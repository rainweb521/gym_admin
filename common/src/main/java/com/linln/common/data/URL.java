package com.linln.common.data;

import com.linln.common.utils.HttpServletUtil;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 封装URL地址，自动添加应用上下文路径
 *
 * @author wcy
 */
@Data
@ApiModel("封装URL地址，自动添加应用上下文路径")
public class URL {

    @ApiModelProperty("URL地址")
    private String url;

    public URL() {

    }

    /**
     * 封装URL地址，自动添加应用上下文路径
     *
     * @param url URL地址
     */
    public URL(String url) {
        this.url = HttpServletUtil.getRequest().getContextPath() + url;
    }

    @Override
    public String toString() {
        return this.url;
    }
}
