package com.qf.aop.bean;

import java.lang.annotation.*;

// 自定义一个注解，用来修饰方法的权限
@Documented // 可以生成API的文档
@Target(ElementType.METHOD) // 决定这个注解可以加到那个元素(类，方法，属性)上面
@Retention(RetentionPolicy.RUNTIME) // 注解生命周期
public @interface Permission {

    // 如果方法设置default后，可以不用强制设置内容了
//    String name() default ""; // 定义一个name方法
//
//    String[] loves() default {};
//
    String value() default "";

}
