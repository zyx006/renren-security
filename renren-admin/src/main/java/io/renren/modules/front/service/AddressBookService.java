package io.renren.modules.front.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.front.bean.AddressBook;

/**
 * 地址管理(AddressBook)表服务接口
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:43
 */
public interface AddressBookService extends IService<AddressBook> {
    void defaultAddress(AddressBook addressBook);
}
