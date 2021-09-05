package com.system.admin.manage.service;

import com.system.admin.entities.SysRole;
import com.baomidou.mybatisplus.extension.service.IService;
import com.system.admin.manage.req.SysRoleREQ;
import com.system.admin.util.base.Result;

import java.util.List;

/**
 * <p>
 * 角色信息表 服务类
 * </p>
 *
 * @author Luotianxu
 * @since 2021-08-06
 */
public interface ISysRoleService extends IService<SysRole> {
    /**
     * 条件分页查询角色列表
     * @param req
     */
    Result queryPage(SysRoleREQ req);

    /**
     * 通过角色id删除角色信息及角色菜单关系表
     * @param id 角色id
     */
    Result deleteById(String id);

    /**
     * 根据角色id查询此角色拥有的权限菜单ids
     * @param id 角色id
     */
    Result findMenuIdsById(String id);

    /**
     * 新增角色菜单权限数据到 sys_role_menu
     * @param roleId 角色id
     * @param menuIds 菜单id集合
     */
    Result saveRoleMenu(String roleId, List<String> menuIds);

    /**
     * 根据用户id查询用户角色
     * @param id
     * @return
     */
    List<SysRole> findRoleById(String id);
}
