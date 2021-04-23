package com.linln.common.utils;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * 密码加密测试类，可用于重置密码
 * @author wcy
 * @date 2020/02/22
 */
public class EncryptUtilTest {

    @Test
    public void encrypt() {
        String password = "123456";
        String salt = "abcdef";

        String encrypt = EncryptUtil.encrypt(password, salt);
        System.out.println("明文密码：" + password);
        System.out.println("密码盐：" + salt);
        System.out.println("混淆密码：" + encrypt);
    }
}