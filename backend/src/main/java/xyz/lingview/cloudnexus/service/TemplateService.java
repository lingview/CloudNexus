//package xyz.lingview.cloudnexus.service;
//
//import org.springframework.stereotype.Service;
//import org.springframework.core.io.ClassPathResource;
//import xyz.lingview.cloudnexus.domain.VmConfig;
//
//import java.io.InputStream;
//import java.util.UUID;
//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//import java.util.stream.Collectors;
//
///**
// * @Author: lingview
// * @Date: 2025/10/22 18:23:31
// * @Description: 模板处理服务
// * @Version: 1.0
// */
//@Service
//public class TemplateService {
//
//    /**
//     * 加载模板文件内容
//     */
//    public String loadTemplate(String templateName) throws Exception {
//        ClassPathResource resource = new ClassPathResource("VMTemplate/" + templateName);
//        InputStream inputStream = resource.getInputStream();
//        return new BufferedReader(new InputStreamReader(inputStream))
//                .lines()
//                .collect(Collectors.joining("\n"));
//    }
//
//    /**
//     * 替换模板中的占位符
//     */
//    public String processTemplate(String templateContent, VmConfig config) {
//        return templateContent
//                .replace("{{vmName}}", config.getName())
//                .replace("{{uuid}}", UUID.randomUUID().toString())
//                .replace("{{memoryKB}}", String.valueOf(config.getMemoryMB() * 1024))
//                .replace("{{vcpus}}", String.valueOf(config.getVcpus()))
//                .replace("{{diskPath}}", config.getDiskPath())
//                .replace("{{isoPath}}", config.getIsoPath())
//                .replace("{{networkType}}", config.getNetworkType());
//    }
//}