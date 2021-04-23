package com.linln.admin.equipment.validator;

import lombok.Data;

import java.io.Serializable;
import javax.validation.constraints.NotEmpty;

/**
 * @author wcy
 * @date 2020/02/22 2020/02/22
 */
@Data
public class EquipmentValid implements Serializable {
    @NotEmpty(message = "器材名称不能为空")
    private String name;
}