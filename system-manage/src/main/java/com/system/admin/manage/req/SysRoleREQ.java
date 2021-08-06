package com.system.admin.manage.req;

import com.system.admin.entities.SysRole;
import com.system.admin.util.base.BaseRequest;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author LuoTianxu
 */
@Data
@Accessors(chain = true)
@ApiModel(value = "SysRoleREQ对象", description = "角色查询条件")
public class SysRoleREQ extends BaseRequest<SysRole> {

    @ApiModelProperty(value = "角色名称")
    private String name;

}
