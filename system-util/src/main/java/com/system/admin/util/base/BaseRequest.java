package com.system.admin.util.base;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 封装参数基础类、带分页参数
 * @author LuoTianxu
 * @param <T>
 */
@Accessors(chain = true)
@Data
public class BaseRequest<T> implements Serializable {

    @ApiModelProperty(value = "页码", required = true)
    private long current;
    @ApiModelProperty(value = "每页显示多少条", required = true)
    private long size;

    /**
     * 封装分页对象
     * @return
     */
    @ApiModelProperty(hidden = true) // 不在swagger文档中显示
    public IPage<T> getPage() {
        return new Page<T>().setCurrent(this.current).setSize(this.size);
    }

}
