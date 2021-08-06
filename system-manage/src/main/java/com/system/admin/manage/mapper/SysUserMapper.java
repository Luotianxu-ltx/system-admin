package com.system.admin.manage.mapper;

import com.system.admin.entities.SysUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import feign.Param;

import java.util.List;

/**
 * <p>
 * 用户信息表 Mapper 接口
 * </p>
 *
 * @author Luotianxu
 * @since 2021-08-06
 */
public interface SysUserMapper extends BaseMapper<SysUser> {
    /**
     * 根据用户id查询当前用户所拥有的角色ids
     * @param id 用户id
     * @return
     */
    List<String> findRoleIdsById(@Param("id") String id);

    /**
     * 通过用户id删除用户角色关系表数据
     * @param userId 用户id
     * @return
     */
    boolean deleteUserRoleByUserId(@Param("userId") String userId);

    /**
     * 新增用户角色关系 表数据
     * @param userId 用户id
     * @param roleIds 角色id集合
     * @return
     */
    boolean saveUserRole(@Param("userId") String userId,
                         @Param("roleIds") List<String> roleIds);

}
