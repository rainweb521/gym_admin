package com.linln.common.exception.advice;

/**
 * 异常通知器接口
 * @author wcy
 */
public interface ExceptionAdvice {

    /**
     * 运行
     * @param e 异常对象
     */
    void run(RuntimeException e);
}
