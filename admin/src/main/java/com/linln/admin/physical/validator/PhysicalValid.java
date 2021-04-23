package com.linln.admin.physical.validator;

import lombok.Data;

import java.io.Serializable;
import javax.validation.constraints.NotEmpty;

/**
 * @author wcy
 * @date 2020/02/22
 */
@Data
public class PhysicalValid implements Serializable {
    @NotEmpty(message = "标题不能为空")
    private String title;
}