package io.renren.modules.takeout.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import io.renren.common.service.impl.CrudServiceImpl;
import io.renren.modules.takeout.dao.SetmealDao;
import io.renren.modules.takeout.dto.SetmealDTO;
import io.renren.modules.takeout.entity.SetmealEntity;
import io.renren.modules.takeout.service.SetmealService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 套餐
 *
 * @author zyx
 * @since 1.0.0 2023-06-09
 */
@Service
public class SetmealServiceImpl extends CrudServiceImpl<SetmealDao, SetmealEntity, SetmealDTO> implements SetmealService {

    @Override
    public QueryWrapper<SetmealEntity> getWrapper(Map<String, Object> params){
        String id = (String)params.get("id");

        QueryWrapper<SetmealEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }

    @Override
    public void updateStatus(List<String> ids) {
        if (ids.size()>1){
            int index =Integer.parseInt(ids.get(0)) ;
            for (int i = 1; i < ids.size(); i++) {
                Long id =Long.parseLong(ids.get(i)) ;
                SetmealEntity setmeal = this.selectById(id);
                setmeal.setStatus(index);
                this.updateById(setmeal);
            }
        }else {
            Long id =Long.parseLong(ids.get(0)) ;
            SetmealEntity setmeal = this.selectById(id);
            if (setmeal.getStatus().equals(1)){
                setmeal.setStatus(0);
                this.updateById(setmeal);
            }
            else {
                setmeal.setStatus(1);
                this.updateById(setmeal);
            }
        }
    }
}