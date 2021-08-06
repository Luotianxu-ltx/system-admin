package com.system.admin.manage.service;

import com.system.admin.entities.SysMenu;
import com.baomidou.mybatisplus.extension.service.IService;
import com.system.admin.manage.req.SysMenuREQ;
import com.system.admin.util.base.Result;

import java.util.List;

/**
 * <p>
 * 菜单信息表 服务类
 * </p>
 *
 * @author Luotianxu
 * @since 2021-08-06
 */
public interface ISysMenuService extends IService<SysMenu> {
    /**
     * 条件查询菜单列表
     * @param req
     * @return
     */
    Result queryList(SysMenuREQ req);

    /**
     * 根据菜单id删除
     * @param id 菜单id
     * @return
     */
    Result deleteById(String id);

    /**
     * 通过用户id查询所拥有的权限菜单树
     * @param userId
     * @return
     */
    Result findUserMenuTree(String userId);

    /**
     * 通过用户id查询所拥有的权限信息
     * @param userId
     * @return
     */
    List<SysMenu> findByUserId(String userId);

}
