package xyz.lingview.cloudnexus.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 *@Author: lingview
 *@Date: 2025/10/22 09:10:24
 *@Description: 权限控制
 *@Version: 1.0
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface RequiresPermission {

    String[] value();
    boolean all() default false;
}
