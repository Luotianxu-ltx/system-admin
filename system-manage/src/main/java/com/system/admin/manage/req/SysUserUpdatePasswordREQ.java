package com.system.admin.manage.req;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author LuoTianxu
 */
@Data
@Accessors(chain = true)
@ApiModel("提交密码修改请求参数")
public class SysUserUpdatePasswordREQ extends SysUserCheckPasswordREQ{

    @ApiModelProperty(value = "新密码", required = true)
    private String newPassword;

    @ApiModelProperty(value = "确认密码", required = true)
    private String repPassword;
}
