package xyz.lingview.cloudnexus.config;


import org.springframework.web.client.RestTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import xyz.lingview.cloudnexus.interceptor.UserPermissionInterceptor;
import xyz.lingview.cloudnexus.security.SessionAuthFilter;

/**
 *@Author: lingview
 *@Date: 2025/10/22 09:10:24
 *@Description: 接口配置
 *@Version: 1.0
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private SessionAuthFilter sessionAuthFilter;

    // 注册 SessionAuthFilter
    @Bean
    public FilterRegistrationBean<SessionAuthFilter> sessionAuthFilterRegistration() {
        FilterRegistrationBean<SessionAuthFilter> registration = new FilterRegistrationBean<>();
        registration.setFilter(sessionAuthFilter);
        registration.addUrlPatterns("/api/*");
        registration.setOrder(2);
        return registration;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:upload/");
    }

    // 注册权限拦截器
    @Autowired
    private UserPermissionInterceptor userPermissionInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(userPermissionInterceptor)
                .addPathPatterns("/api/**");
    }


    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
