package com.system.admin.manage.mapper;

import com.system.admin.entities.SysMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.system.admin.manage.req.SysMenuREQ;
import com.system.admin.util.base.Result;
import feign.Param;

import java.util.List;

/**
 * <p>
 * 菜单信息表 Mapper 接口
 * </p>
 *
 * @author Luotianxu
 * @since 2021-08-06
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    /**
     * 查询指定用户id所拥有的菜单权限（目录、菜单、按钮）
     * @param userId
     * @return
     */
    List<SysMenu> findByUserId(@Param("userId") String userId);
}
