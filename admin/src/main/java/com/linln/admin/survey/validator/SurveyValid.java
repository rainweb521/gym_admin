package com.linln.admin.survey.validator;

import lombok.Data;

import java.io.Serializable;
import javax.validation.constraints.NotEmpty;

/**
 * @author wcy
 * @date 2020/02/22 2020/02/22
 */
@Data
public class SurveyValid implements Serializable {
    @NotEmpty(message = "课程或教练名称不能为空")
    private String name;
}