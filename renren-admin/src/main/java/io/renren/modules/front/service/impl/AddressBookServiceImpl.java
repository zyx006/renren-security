package io.renren.modules.front.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.front.bean.AddressBook;
import io.renren.modules.front.dao.AddressBookMapper;
import io.renren.modules.front.service.AddressBookService;
import io.renren.modules.front.utils.BaseContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 地址管理(AddressBook)表服务实现类
 *
 * @author 张宇轩
 * @since 2023-05-29 11:08:43
 */
@Service(value = "addressBookServiceImplFront")
@Transactional
public class AddressBookServiceImpl extends ServiceImpl<AddressBookMapper, AddressBook> implements AddressBookService {
    @Override
    public void defaultAddress(AddressBook addressBook) {
        //把当前登录用户的所有地址的默认值改为0
        LambdaUpdateWrapper<AddressBook> luw = new LambdaUpdateWrapper<>();
        luw.eq(AddressBook::getUserId, BaseContext.getCurrentId()).set(AddressBook::getIsDefault, 0);
        this.update(luw);
        //把当前登录用户的当前地址的默认值改为1
        LambdaUpdateWrapper<AddressBook> luw1 = new LambdaUpdateWrapper<>();
        luw1.eq(AddressBook::getId, addressBook.getId()).set(AddressBook::getIsDefault, 1);
        this.update(luw1);
    }
}
