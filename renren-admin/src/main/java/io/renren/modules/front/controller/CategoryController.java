package io.renren.modules.front.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.renren.modules.front.bean.Category;
import io.renren.modules.front.service.CategoryService;
import io.renren.modules.front.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 菜品及套餐分类(Category)表控制层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:09:40
 */
@RestController(value = "categoryControllerFront")
@RequestMapping("front/category")
public class CategoryController {
    /**
     * 服务对象
     */
    @Autowired
    private CategoryService categoryService;

//    //添加菜品套餐的分类信息
//    @PostMapping
//    public R<String> add(@RequestBody Category category){
//        categoryService.save(category);
//        return R.success("添加成功！");
//    }
//
//    //分页查询员工信息
//    @GetMapping("/page")
//    public R<IPage<Category>> page(@RequestParam Integer page,
//                                   @RequestParam Integer pageSize){
//        IPage<Category> iPage = new Page<>(page, pageSize);
//        QueryWrapper<Category> lqw = new QueryWrapper<>();
//        lqw.lambda().orderByDesc(Category::getUpdateDate);
//        categoryService.page(iPage, lqw);
//        return R.success(iPage);
//    }
//
//    @PutMapping
//    public R<String> update(@RequestBody Category category){
//        categoryService.updateById(category);
//        return R.success("修改成功！");
//    }
//
//    @DeleteMapping
//    public R<String> removeById(@RequestParam("id") Long cateId){
//        //删除分类信息
//        categoryService.removeCateById(cateId);
//        return R.success("删除分类信息成功");
//    }

    @GetMapping("/list")
    public R<List<Category>> list(@RequestParam(required = false) Integer type){
        LambdaQueryWrapper<Category> lqw = new LambdaQueryWrapper<>();
        lqw.eq(type!=null, Category::getType, type).orderByDesc(Category::getUpdateDate);
        List<Category> categoryList = categoryService.list(lqw);
        return R.success(categoryList);
    }
}
