package io.renren.modules.takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import io.renren.common.annotation.LogOperation;
import io.renren.common.constant.Constant;
import io.renren.common.page.PageData;
import io.renren.common.utils.ExcelUtils;
import io.renren.common.utils.Result;
import io.renren.common.validator.AssertUtils;
import io.renren.common.validator.ValidatorUtils;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.DefaultGroup;
import io.renren.common.validator.group.UpdateGroup;
import io.renren.modules.front.bean.Category;
import io.renren.modules.front.bean.DishFlavor;
import io.renren.modules.front.bean.Setmeal;
import io.renren.modules.front.bean.SetmealDish;
import io.renren.modules.front.service.CategoryService;
import io.renren.modules.front.service.SetmealDishService;
import io.renren.modules.front.service.SetmealService;
import io.renren.modules.takeout.dto.DishDTO;
import io.renren.modules.takeout.dto.DishFlavorDTO;
import io.renren.modules.takeout.entity.DishEntity;
import io.renren.modules.takeout.excel.DishExcel;
import io.renren.modules.takeout.service.DishFlavorService;
import io.renren.modules.takeout.service.DishService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.stream.Collectors;


/**
 * 菜品管理
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@RestController
@RequestMapping("takeout/dish")
@Api(tags="菜品管理")
public class DishController {
    @Autowired
    private DishService dishService;
    @Autowired
    private DishFlavorService dishFlavorService;
    @Autowired
    private io.renren.modules.front.service.DishFlavorService dishFlavorServiceFront;

    @Autowired
    private SetmealDishService setmealDishService;
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private RedisTemplate redisTemplate;

    @PutMapping("updateStatus")
    public Result updateStatus(@RequestParam Map<String, String> params){
        String type = params.get("0");
        if (type == null){
            //此时只有单个菜品的停售/起售，直接取反
            Long dishId = Long.valueOf(params.get("1"));
            Integer oldStatus = dishService.get(dishId).getStatus();

            DishEntity dish = new DishEntity();
            dish.setId(dishId);
            dish.setStatus(oldStatus == 1 ? 0 : 1);
            dishService.updateById(dish);
        } else {
            Integer status = Integer.parseInt(type);
            params.remove("0");

            List<DishEntity> ids = params.values().stream().map(id -> {
                DishEntity dish = new DishEntity();
                dish.setId(Long.valueOf(id));
                dish.setStatus(status);
                return dish;
            }).collect(Collectors.toList());
            dishService.updateBatchById(ids);
        }
        //清除所有的菜品缓存数据
        redisTemplate.delete("dish_*");

        return new Result();
    }

    @GetMapping("list")
    public Result<List<DishDTO>> list(@RequestParam Map<String, Object> params){
        List<DishDTO> list = dishService.list(params);
        return new Result<List<DishDTO>>().ok(list);
    }

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
        @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType="int") ,
        @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query",required = true, dataType="int") ,
        @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType="String") ,
        @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType="String")
    })
    @RequiresPermissions("takeout:dish:page")
    public Result<PageData<DishDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params){
        PageData<DishDTO> page = dishService.page(params);
        List<DishDTO> dishDTOList = page.getList();
        for (DishDTO dishDTO : dishDTOList) {
            Long categoryId = dishDTO.getCategoryId();
            Category category = categoryService.getById(categoryId);
            dishDTO.setCategoryName(category.getName());
        }
        page.setList(dishDTOList);
        return new Result<PageData<DishDTO>>().ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    @RequiresPermissions("takeout:dish:info")
    public Result<DishDTO> get(@PathVariable("id") Long id){
        DishDTO data = dishService.get(id);

        //封装口味信息
        Map<String, Object> param = new HashMap<>();
        param.put("dish_id", data.getId());
        List<DishFlavorDTO> flavorDTOList = dishFlavorService.list(param);
        data.setFlavors(flavorDTOList);

        return new Result<DishDTO>().ok(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @LogOperation("保存")
    @RequiresPermissions("takeout:dish:save")
    public Result save(@RequestBody DishDTO dto){
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);

        dishService.save(dto);
        //保存口味信息
        List<DishFlavorDTO> flavors = dto.getFlavors();
        for (DishFlavorDTO flavor : flavors) {
            flavor.setId(null);
            flavor.setDishId(dto.getId());
            dishFlavorService.save(flavor);
        }

        //清除当前分类下的菜品信息
        redisTemplate.delete("dish_" + dto.getCategoryId() + "_1");

        return new Result();
    }

    @PutMapping
    @ApiOperation("修改")
    @LogOperation("修改")
    @RequiresPermissions("takeout:dish:update")
    public Result update(@RequestBody DishDTO dto){
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);

        dishService.update(dto);
        //清除原有口味信息
        LambdaUpdateWrapper<DishFlavor> luw = new LambdaUpdateWrapper<>();
        luw.eq(DishFlavor::getDishId, dto.getId());
        dishFlavorServiceFront.remove(luw);

        //保存新口味信息
        List<DishFlavorDTO> flavors = dto.getFlavors();
        for (DishFlavorDTO flavor : flavors) {
            flavor.setId(null);
            flavor.setDishId(dto.getId());
            dishFlavorService.save(flavor);
        }

        //清除当前分类下的菜品信息
        redisTemplate.delete("dish_" + dto.getCategoryId() + "_1");

        return new Result();
    }

    @DeleteMapping
    @ApiOperation("删除")
    @LogOperation("删除")
    @RequiresPermissions("takeout:dish:delete")
    public Result delete(@RequestBody Long[] ids){
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");
        for(Long id:ids){
            LambdaQueryWrapper<SetmealDish> wrapper=new LambdaQueryWrapper<>();
            wrapper.eq(SetmealDish::getDishId,id);
            if(setmealDishService.list(wrapper)!=null) {
                return new Result().error("存在套餐内含有该菜品");
            }

        }

        dishService.delete(ids);
        //清除每个菜品的所有口味信息
        for (Long id : ids) {
            LambdaUpdateWrapper<DishFlavor> luw = new LambdaUpdateWrapper<>();
            luw.eq(DishFlavor::getDishId, id);
            dishFlavorServiceFront.remove(luw);
        }

        //清除所有的菜品缓存数据
        redisTemplate.delete("dish_*");

        return new Result();
    }

    @GetMapping("export")
    @ApiOperation("导出")
    @LogOperation("导出")
    @RequiresPermissions("takeout:dish:export")
    public void export(@ApiIgnore @RequestParam Map<String, Object> params, HttpServletResponse response) throws Exception {
        List<DishDTO> list = dishService.list(params);

        ExcelUtils.exportExcelToTarget(response, null, list, DishExcel.class);
    }

}