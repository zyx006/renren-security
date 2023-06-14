package io.renren.modules.front.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.front.bean.Setmeal;
import io.renren.modules.front.bean.SetmealDish;
import io.renren.modules.front.dao.SetmealMapper;
import io.renren.modules.front.service.SetmealDishService;
import io.renren.modules.front.service.SetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 套餐(Setmeal)表服务实现类
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:45
 */
@Service(value = "setmealServiceImplFront")
public class SetmealServiceImpl extends ServiceImpl<SetmealMapper, Setmeal> implements SetmealService {

//    @Autowired
//    private SetmealDishService setmealDishService;
//
//    @Override
//    public void saveSetmealDish(SetmealDTO setmealDTO) {
//        //保存套餐信息
//        this.save(setmealDTO);
//        //保存套餐菜品信息
//        List<SetmealDish> list = setmealDTO.getSetmealDishes().stream().map(setmealDish -> {
//            setmealDish.setSetmealId(String.valueOf(setmealDTO.getId()));
//            return setmealDish;
//        }).collect(Collectors.toList());
//        setmealDishService.saveBatch(list);
//    }
//
//    @Override
//    public void updateSetmealDish(SetmealDTO setmealDTO) {
//        //保存套餐信息
//        this.updateById(setmealDTO);
//        //清空原有菜品信息
//        LambdaUpdateWrapper<SetmealDish> luw = new LambdaUpdateWrapper<>();
//        luw.eq(SetmealDish::getSetmealId, setmealDTO.getId());
//        setmealDishService.remove(luw);
//        //保存套餐新菜品信息
//        List<SetmealDish> list = setmealDTO.getSetmealDishes().stream().map(setmealDish -> {
//            setmealDish.setSetmealId(String.valueOf(setmealDTO.getId()));
//            return setmealDish;
//        }).collect(Collectors.toList());
//        setmealDishService.saveBatch(list);
//    }
}
