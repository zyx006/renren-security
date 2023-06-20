package io.renren.modules.takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
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
import io.renren.modules.front.bean.SetmealDish;
import io.renren.modules.takeout.dto.SetmealDTO;
import io.renren.modules.takeout.dto.SetmealDishDTO;
import io.renren.modules.takeout.excel.SetmealExcel;
import io.renren.modules.takeout.service.SetmealDishService;
import io.renren.modules.takeout.service.SetmealService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * 套餐
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Slf4j
@RestController
@RequestMapping("takeout/setmeal")
@Api(tags="套餐")
public class SetmealController {
    @Autowired
    private SetmealService setmealService;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private SetmealDishService setmealDishService;
    @Autowired
    private io.renren.modules.front.service.SetmealDishService setmealDishServiceFront;
    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
        @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType="int") ,
        @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query",required = true, dataType="int") ,
        @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType="String") ,
        @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType="String")
    })
    @RequiresPermissions("takeout:setmeal:page")
    public Result<PageData<SetmealDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params){
        PageData<SetmealDTO> page = setmealService.page(params);
        return new Result<PageData<SetmealDTO>>().ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    @RequiresPermissions("takeout:setmeal:info")
    public Result<SetmealDTO> get(@PathVariable("id") Long id){
        SetmealDTO data = setmealService.get(id);

        return new Result<SetmealDTO>().ok(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @LogOperation("保存")
    @RequiresPermissions("takeout:setmeal:save")
    @CacheEvict(value = "setmealCache", allEntries = true)
    public Result save(@RequestBody SetmealDTO dto){
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
        log.info("dto=={}",dto);
        setmealService.save(dto);
        //保存套餐菜品信息
        List<SetmealDishDTO> setmealDishes=dto.getSetmealDishes();
        log.info("123456");
        log.info("dishes={}",setmealDishes);
        for (SetmealDishDTO setmealDishDTO:setmealDishes){
            log.info("654321");
            log.info("setmealDish={}",setmealDishDTO);
//            SetmealDishDTO setmealDishDTO =new SetmealDishDTO();
////            BeanUtils.copyProperties(setmealDish, setmealDishDTO);
            setmealDishDTO.setSetmealId(dto.getId().toString());
//            setmealDishDTO.setCopies(setmealDish.getCopies());
//            setmealDishDTO.setDishId(setmealDish.getDishId());
//            setmealDishDTO.setName(setmealDish.getName());
//            setmealDishDTO.setPrice(setmealDish.getPrice());
            log.info("setmealDishDTO=={}",setmealDishDTO);
            setmealDishService.save(setmealDishDTO);
//            setmealDish.setSetmealId(dto.getId().toString());
        }
//        setmealDishService.insertBatch(setmealDishes);
        //清除所有的菜品缓存数据
        redisTemplate.delete("setmeal_*");
        return new Result();
    }

    @PutMapping
    @ApiOperation("修改")
    @LogOperation("修改")
    @RequiresPermissions("takeout:setmeal:update")
    @CacheEvict(value = "setmealCache", allEntries = true)
    public Result update(@RequestBody SetmealDTO dto){
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);
        setmealService.update(dto);
        LambdaQueryWrapper<SetmealDish> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(SetmealDish::getSetmealId,dto.getId());
        setmealDishServiceFront.remove(wrapper);
        List<SetmealDishDTO> setmealDishes=dto.getSetmealDishes();
        for (SetmealDishDTO setmealDishDTO:setmealDishes){
            setmealDishDTO.setSetmealId(dto.getId().toString());
            setmealDishService.save(setmealDishDTO);
        }        //清除所有的菜品缓存数据
        redisTemplate.delete("setmeal_*");
        return new Result();
    }

    @DeleteMapping
    @ApiOperation("删除")
    @LogOperation("删除")
    @RequiresPermissions("takeout:setmeal:delete")
    @CacheEvict(value = "setmealCache", allEntries = true)
    public Result delete(@RequestBody Long[] ids){
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");
        setmealService.delete(ids);
        //清除SetmealDish
        for (Long id:ids){
            LambdaQueryWrapper<SetmealDish> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(SetmealDish::getSetmealId,id);
            setmealDishServiceFront.remove(wrapper);
        }
        //清除所有的菜品缓存数据
        redisTemplate.delete("setmeal_*");
        return new Result();
    }

    @GetMapping("export")
    @ApiOperation("导出")
    @LogOperation("导出")
    @RequiresPermissions("takeout:setmeal:export")
    public void export(@ApiIgnore @RequestParam Map<String, Object> params, HttpServletResponse response) throws Exception {
        List<SetmealDTO> list = setmealService.list(params);

        ExcelUtils.exportExcelToTarget(response, null, list, SetmealExcel.class);
    }

    @PutMapping("updateStatus")
//    @ApiOperation("更新套餐状态")
//    @LogOperation("更新套餐状态")
//    @RequiresPermissions("takeout:setmeal:updateStatus")
    @CacheEvict(value = "setmealCache", allEntries = true)
    public Result updateStatus(@RequestParam Map<String, String> params) {
        List<String> ids=new ArrayList<>();
        for (Map.Entry<String, String> entry : params.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            if (key != null && value != null) {
                ids.add(value);
            }
        }
        setmealService.updateStatus(ids);
        return new Result();
    }
}