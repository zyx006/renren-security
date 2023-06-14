package io.renren.modules.front.controller;

import io.renren.modules.front.service.DishFlavorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 菜品口味关系表(DishFlavor)表控制层
 *
 * @author 张宇轩
 * @since 2023-05-29 11:09:40
 */
@RestController(value = "dishFlavorControllerFront")
@RequestMapping("front/dishFlavor")
public class DishFlavorController {
    /**
     * 服务对象
     */
    @Autowired
    private DishFlavorService dishFlavorService;


}
