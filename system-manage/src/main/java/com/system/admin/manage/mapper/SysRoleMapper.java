package com.system.admin.manage.mapper;

import com.system.admin.entities.SysRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import feign.Param;

import java.util.List;

/**
 * <p>
 * 角色信息表 Mapper 接口
 * </p>
 *
 * @author Luotianxu
 * @since 2021-08-06
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {
    /**
     * 通过角色id删除角色菜单关系表数据
     * @param roleId 角色id
     * @return
     */
    boolean deleteRoleMenuByRoleId(@Param("roleId")String roleId);

    /**
     * 根据角色id查询此角色拥有的权限菜单ids
     * @param id 角色id
     * @return 菜单id集合
     */
    List<String> findMenuIdsById(@Param("id") String id);

    /**
     * 新增角色菜单权限数据到 sys_role_menu
     * @param roleId 角色id
     * @param menuIds 菜单 id 集合
     * @return
     */
    boolean saveRoleMenu(@Param("roleId") String roleId,@Param("menuIds") List<String> menuIds);
}
