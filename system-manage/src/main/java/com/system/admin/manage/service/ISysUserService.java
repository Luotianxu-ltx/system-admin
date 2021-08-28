package com.system.admin.manage.service;

import com.system.admin.entities.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;
import com.system.admin.manage.req.RegisterREQ;
import com.system.admin.manage.req.SysUserCheckPasswordREQ;
import com.system.admin.manage.req.SysUserREQ;
import com.system.admin.manage.req.SysUserUpdatePasswordREQ;
import com.system.admin.util.base.Result;

import java.util.List;

/**
 * <p>
 * 用户信息表 服务类
 * </p>
 *
 * @author Luotianxu
 * @since 2021-08-06
 */
public interface ISysUserService extends IService<SysUser> {
    /**
     * 条件分页查询用户列表
     * @param req
     */
    Result queryPage(SysUserREQ req);

    /**
     * 根据用户id查询当前用户所拥有的角色ids
     * @param id 用户id
     */
    Result findRoleIdsById(String id);

    /**
     * 新增用户角色关系表数据
     * @param userId 用户id
     * @param roleIds 角色id集合
     */
    Result saveUserRole(String userId, List<String> roleIds);

    /**
     * 根据用户id进行删除，假删除，将is_enabled 状态值更新为0
     * @param id 用户id
     */
    Result deleteById(String id);

    /**
     * 校验原密码是否正确
     * @param req
     */
    Result checkPassword(SysUserCheckPasswordREQ req);

    /**
     * 修改用户密码
     * @param req
     */
    Result updatePassword(SysUserUpdatePasswordREQ req);

    /**
     * 更新用户信息
     * @param sysUser
     */
    Result update(SysUser sysUser);

    /**
     * 查询总用户数
     */
    Result getUserTotal();

    /**
     * 校验用户名是否存在
     * @param username
     */
    Result checkUsername(String username);

    /**
     * 注册用户
     * @param req
     */
    Result register(RegisterREQ req);

    /**
     * 通过用户名查询用户信息
     * @param username 用户名
     */
    SysUser findByUsername(String username);
}
