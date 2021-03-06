package com.system.admin.manage.api;

import com.system.admin.manage.req.RegisterREQ;
import com.system.admin.manage.service.ISysUserService;
import com.system.admin.util.base.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author LuoTianxu
 */
@Api(value = "用户管理接口", description = "用户管理接口，不需要身份认证就可以调用下面接口")
@RestController
@RequestMapping("/api/user")
public class ApiSysUserController {

    @Autowired
    private ISysUserService sysUserService;

    @ApiImplicitParam(name = "username", value = "用户名", required = true)
    @ApiOperation("校验用户名是否存在接口")
    @GetMapping("/username/{username}")
    public Result checkUsername(@PathVariable("username") String username) {
        return sysUserService.checkUsername(username);
    }

    @ApiOperation("注册用户接口")
    @PostMapping("/register")
    public Result register(@RequestBody RegisterREQ req) {
        return sysUserService.register(req);
    }

}
