package com.linln.admin.vip.validator;

import lombok.Data;

import java.io.Serializable;
import javax.validation.constraints.NotEmpty;

/**
 * @author wcy
 * @date 2020/02/22 2020/02/22
 */
@Data
public class VipValid implements Serializable {
    @NotEmpty(message = "卡号不能为空")
    private String card;
}