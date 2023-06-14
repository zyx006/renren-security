package io.renren.modules.front.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.renren.modules.front.bean.Dish;
import io.renren.modules.front.bean.Setmeal;
import io.renren.modules.front.bean.SetmealDish;
import io.renren.modules.front.dto.SetmealDishDTO;
import io.renren.modules.front.service.CategoryService;
import io.renren.modules.front.service.DishService;
import io.renren.modules.front.service.SetmealDishService;
import io.renren.modules.front.service.SetmealService;
import io.renren.modules.front.utils.R;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 套餐(Setmeal)表控制层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:09:40
 */
@RestController(value = "setmealControllerFront")
@RequestMapping("front/setmeal")
public class SetmealController {
    /**
     * 服务对象
     */
    @Autowired
    private SetmealService setmealService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private SetmealDishService setmealDishService;
    @Autowired
    private DishService dishService;

//    //添加套餐信息
//    @CacheEvict(value = "setmealCache", allEntries = true)
//    @PostMapping
//    public R<String> saveSetmealDish(@RequestBody SetmealDTO setmealDTO){
//        setmealService.saveSetmealDish(setmealDTO);
//        return R.success("套餐添加成功！");
//    }
//
//    @GetMapping("/page")
//    public R<IPage<SetmealDTO>> page(@RequestParam Integer page,
//                                     @RequestParam Integer pageSize,
//                                     @RequestParam(required = false) String name){
//        IPage<SetmealDTO> setmealDTOIPage = new Page<>();
//        IPage<Setmeal> iPage = new Page<>(page, pageSize);
//        LambdaQueryWrapper<Setmeal> lqw = new LambdaQueryWrapper<>();
//        lqw.like(!StringUtils.isEmpty(name), Setmeal::getName, name);
//        setmealService.page(iPage, lqw);
//        BeanUtils.copyProperties(iPage, setmealDTOIPage, "records");
//        List<SetmealDTO> setmealDTOList = iPage.getRecords().stream().map(setmeal -> {
//            SetmealDTO setmealDTO = new SetmealDTO();
//            BeanUtils.copyProperties(setmeal, setmealDTO);
//            Category category = categoryService.getById(setmeal.getCategoryId());
//            setmealDTO.setCategoryName(category.getName());
//            return setmealDTO;
//        }).collect(Collectors.toList());
//        setmealDTOIPage.setRecords(setmealDTOList);
//        return R.success(setmealDTOIPage);
//    }
//
//    @PostMapping("/status/{status}")
//    public R<String> setStatus(@PathVariable("status") Integer status,
//                               @RequestParam List<Long> ids){
//        LambdaUpdateWrapper<Setmeal> luw = new LambdaUpdateWrapper<>();
//        luw.set(Setmeal::getStatus, status).set(Setmeal::getUpdateDate, LocalDateTime.now()).in(Setmeal::getId, ids);
//        setmealService.update(luw);
//        return R.success("停售成功");
//    }
//
//    @DeleteMapping
//    public R<String> delete(@RequestParam List<Long> ids){
//        LambdaQueryWrapper<Setmeal> qw = new LambdaQueryWrapper<>();
//        qw.in(Setmeal::getId, ids).eq(Setmeal::getStatus, 1);
//        long cnt = setmealService.count(qw);
//        if(cnt > 0){
//            throw new CustomException("存在起售的套餐，不能删除");
//        }
//        for (Long id : ids) {
//            LambdaUpdateWrapper<SetmealDish> luw = new LambdaUpdateWrapper<>();
//            luw.eq(SetmealDish::getSetmealId, id);
//            setmealDishService.remove(luw);
//        }
//        setmealService.removeBatchByIds(ids);
//        return R.success("删除成功");
//    }
//
//    @GetMapping("/{setmealId}")
//    public R<SetmealDTO> getSetmealById(@PathVariable("setmealId") Long setmealId){
//        Setmeal setmeal = setmealService.getById(setmealId);
//        SetmealDTO setmealDTO = new SetmealDTO();
//        BeanUtils.copyProperties(setmeal, setmealDTO);
//
//        LambdaQueryWrapper<SetmealDish> lqw = new LambdaQueryWrapper<>();
//        lqw.eq(SetmealDish::getSetmealId, setmealId);
//        List<SetmealDish> setmealDishList = setmealDishService.list(lqw);
//        setmealDTO.setSetmealDishes(setmealDishList);
//        return R.success(setmealDTO);
//    }
//
//    @PutMapping
//    public R<String> update(@RequestBody SetmealDTO setmealDTO){
//        setmealService.updateSetmealDish(setmealDTO);
//        return R.success("套餐保存成功！");
//    }

    //根据分类id和状态查询套餐信息
    @GetMapping("/list")
    @Cacheable(value = "setmealCache", key = "#setmeal.categoryId + '_' + #setmeal.status")
    public R<List<Setmeal>> list(Setmeal setmeal){
        LambdaQueryWrapper<Setmeal> lqw = new LambdaQueryWrapper<>();
        lqw.eq(Setmeal::getCategoryId, setmeal.getCategoryId())
                .eq(setmeal.getStatus()!=null, Setmeal::getStatus, setmeal.getStatus())
                .orderByDesc(Setmeal::getUpdateDate);
        List<Setmeal> setmealList = setmealService.list(lqw);
        return R.success(setmealList);
    }

    //查看套餐详情
    @GetMapping("/dish/{id}")
    public R<List<SetmealDishDTO>> getSetmealDetail(@PathVariable("id") Long id){
        LambdaQueryWrapper<SetmealDish> lqw = new LambdaQueryWrapper<>();
        lqw.eq(SetmealDish::getSetmealId, id).orderByDesc(SetmealDish::getUpdateDate);
        List<SetmealDish> setmealDishList = setmealDishService.list(lqw);

        List<SetmealDishDTO> list = setmealDishList.stream().map(setmealDish -> {
            SetmealDishDTO setmealDishDTO = new SetmealDishDTO();
            BeanUtils.copyProperties(setmealDish, setmealDishDTO);
            Dish dish = dishService.getById(setmealDish.getDishId());
            setmealDishDTO.setImage(dish.getImage());
            return setmealDishDTO;
        }).collect(Collectors.toList());
        return R.success(list);
    }
}
