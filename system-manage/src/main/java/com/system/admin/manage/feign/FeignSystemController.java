package com.system.admin.manage.feign;

import com.system.admin.entities.SysMenu;
import com.system.admin.entities.SysUser;
import com.system.admin.feign.IFeignSystemController;
import com.system.admin.manage.service.ISysMenuService;
import com.system.admin.manage.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class FeignSystemController implements IFeignSystemController {

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private ISysMenuService sysMenuService;

    /**
     * 通过用户名查询用户信息
     * @param username 用户名
     * @return
     */
    @Override
    public SysUser findUserByUsername(String username) {
        return sysUserService.findByUsername(username);
    }

    /**
     *通过用户ID查询拥有权限
     * @param userId 用户id
     * @return
     */
    @Override
    public List<SysMenu> findMenuListByUserId(String userId) {
        return sysMenuService.findByUserId(userId);
    }
}
