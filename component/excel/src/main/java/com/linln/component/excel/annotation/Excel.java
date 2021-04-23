package com.linln.component.excel.annotation;

import com.linln.component.excel.enums.ExcelType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author wcy
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE, ElementType.FIELD})
public @interface Excel {
    // 字段标题名称或文件名称
    public String value();
    // excel操作类型ExcelType
    public ExcelType type() default ExcelType.ALL;
    // 字段字典标识，用于导入导出时进行字典转换（只支持导出操作）
    public String dict() default "";
    // 关联操作实体对象字段名称，用于获取关联数据（只支持导出操作）
    public String joinField() default "";
}
