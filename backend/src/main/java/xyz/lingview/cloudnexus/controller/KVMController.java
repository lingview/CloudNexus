package xyz.lingview.cloudnexus.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.libvirt.Connect;
import org.libvirt.Domain;
import xyz.lingview.cloudnexus.service.DynamicTemplateService;
import xyz.lingview.cloudnexus.domain.VmConfig;

/**
 * @Author: lingview
 * @Date: 2025/10/22 17:08:53
 * @Description: 虚拟机管理控制器
 * @Version: 1.0
 */

@RestController
@RequestMapping("/api")
public class KVMController {

    @Autowired
    private DynamicTemplateService dynamicTemplateService;

    @PostMapping("/addkvm")
    public ResponseEntity<String> addKVM(@RequestBody VmConfig vmConfig) {
        try {
            // 动态生成XML
            String domainXml = dynamicTemplateService.generateDomainXml(vmConfig);

            // 连接libvirt并创建虚拟机
            Connect conn = new Connect("qemu:///system");
            Domain domain = conn.domainDefineXML(domainXml);

            if (domain != null) {
                domain.create();
                return ResponseEntity.ok("虚拟机 " + vmConfig.getName() + " 创建成功");
            } else {
                return ResponseEntity.badRequest().body("虚拟机定义失败");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("创建失败: " + e.getMessage());
        }
    }
}
