package com.linln.admin.course.validator;

import lombok.Data;

import java.io.Serializable;
import javax.validation.constraints.NotEmpty;

/**
 * @author wcy
 * @date 2020/02/22
 */
@Data
public class CourseValid implements Serializable {
    @NotEmpty(message = "课程名称不能为空")
    private String name;
}