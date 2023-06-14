package io.renren.modules.front.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.front.bean.Category;

/**
 * 菜品及套餐分类(Category)表服务接口
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:44
 */
public interface CategoryService extends IService<Category> {
    void removeCateById(Long cateId);
}
