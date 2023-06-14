package io.renren.modules.front.controller;

import io.renren.modules.front.service.DishService;
import io.renren.modules.front.service.SetmealDishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 套餐菜品关系(SetmealDish)表控制层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:09:40
 */
@RestController(value = "setmealDishControllerFront")
@RequestMapping("front/setmealDish")
public class SetmealDishController {
    /**
     * 服务对象
     */
    @Autowired
    private SetmealDishService setmealDishService;
    @Autowired
    private DishService dishService;

//    //查询套餐详情信息
//    @GetMapping("/dish/{id}")
//    public R<List<SetmealDishDTO>> setmealDetail(@PathVariable Long id) {
//        LambdaQueryWrapper<SetmealDish> lqw = new LambdaQueryWrapper<>();
//        lqw.eq(SetmealDish::getSetmealId, id)
//                .orderByDesc(SetmealDish::getUpdateDate);
//        List<SetmealDish> setmealDishList = setmealDishService.list(lqw);
//        List<SetmealDishDTO> setmealDishDTOList = setmealDishList.stream().map(setmealDish -> {
//            SetmealDishDTO setmealDishDTO = new SetmealDishDTO();
//            BeanUtils.copyProperties(setmealDish, setmealDishDTO);
//            Dish dish = dishService.getById(setmealDish.getDishId());
//            setmealDishDTO.setImage(dish.getImage());
//            return setmealDishDTO;
//        }).collect(Collectors.toList());
//        return R.success(setmealDishDTOList);
//    }

}
