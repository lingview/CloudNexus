package xyz.lingview.cloudnexus.service;

import org.springframework.stereotype.Service;
import xyz.lingview.cloudnexus.domain.VmConfig;

import java.util.UUID;

/**
 * @Author: lingview
 * @Date: 2025/10/22 20:50:54
 * @Description: 动态模板生成
 * @Version: 1.0
 */
@Service
public class DynamicTemplateService {

    public String generateDomainXml(VmConfig config) {
        StringBuilder xml = new StringBuilder();
        xml.append("<domain type='kvm'>\n");
        xml.append("  <name>").append(config.getName()).append("</name>\n");
        xml.append("  <uuid>").append(UUID.randomUUID().toString()).append("</uuid>\n");
        xml.append("  <memory unit='KiB'>").append(config.getMemoryMB() * 1024).append("</memory>\n");
        xml.append("  <currentMemory unit='KiB'>").append(config.getMemoryMB() * 1024).append("</currentMemory>\n");
        xml.append("  <vcpu placement='static'>").append(config.getVcpus()).append("</vcpu>\n");

        // OS配置
        xml.append("  <os>\n");
        xml.append("    <type arch='x86_64' machine='pc-i440fx-2.9'>hvm</type>\n");
        xml.append("    <boot dev='cdrom'/>\n");
        xml.append("    <boot dev='hd'/>\n");
        xml.append("  </os>\n");

        // Features
        xml.append("  <features>\n");
        xml.append("    <acpi/>\n");
        xml.append("    <apic/>\n");
        xml.append("    <pae/>\n");
        xml.append("  </features>\n");

        xml.append("  <cpu mode='host-model' check='partial'/>\n");
        xml.append("  <clock offset='utc'/>\n");
        xml.append("  <on_poweroff>destroy</on_poweroff>\n");
        xml.append("  <on_reboot>restart</on_reboot>\n");
        xml.append("  <on_crash>destroy</on_crash>\n");
        xml.append("  <devices>\n");
        xml.append("    <emulator>/usr/bin/qemu-system-x86_64</emulator>\n");

        // 系统磁盘
        xml.append("    <disk type='file' device='disk'>\n");
        xml.append("      <driver name='qemu' type='qcow2'/>\n");
        xml.append("      <source file='").append(config.getDiskPath()).append("'/>\n");
        xml.append("      <target dev='vda' bus='virtio'/>\n");
        xml.append("    </disk>\n");

        // 主ISO镜像
        xml.append("    <disk type='file' device='cdrom'>\n");
        xml.append("      <driver name='qemu' type='raw'/>\n");
        xml.append("      <source file='").append(config.getIsoPath()).append("'/>\n");
        xml.append("      <target dev='hdc' bus='ide'/>\n");
        xml.append("      <readonly/>\n");
        xml.append("    </disk>\n");

        // 额外的ISO镜像
        if (config.getAdditionalIsoPaths() != null) {
            char ideDevice = 'd'; // 从hdd开始
            for (String isoPath : config.getAdditionalIsoPaths()) {
                xml.append("    <disk type='file' device='cdrom'>\n");
                xml.append("      <driver name='qemu' type='raw'/>\n");
                xml.append("      <source file='").append(isoPath).append("'/>\n");
                xml.append("      <target dev='hd").append(ideDevice++).append("' bus='ide'/>\n");
                xml.append("      <readonly/>\n");
                xml.append("    </disk>\n");
            }
        }

        // 控制器
        xml.append("    <controller type='usb' index='0' model='ich9-ehci1'/>\n");
        xml.append("    <controller type='pci' index='0' model='pci-root'/>\n");

        // 网络接口
        if (config.getNetworkInterfaces() != null && !config.getNetworkInterfaces().isEmpty()) {
            for (String network : config.getNetworkInterfaces()) {
                xml.append("    <interface type='network'>\n");
                xml.append("      <source network='").append(network).append("'/>\n");
                xml.append("      <model type='virtio'/>\n");
                xml.append("    </interface>\n");
            }
        } else {
            // 默认网络接口
            xml.append("    <interface type='network'>\n");
            xml.append("      <source network='").append(config.getNetworkType()).append("'/>\n");
            xml.append("      <model type='virtio'/>\n");
            xml.append("    </interface>\n");
        }

        // SPICE图形界面
        xml.append("    <graphics type='spice' autoport='yes' listen='0.0.0.0'>\n");
        xml.append("      <listen type='address' address='0.0.0.0'/>\n");
        xml.append("      <image compression='auto_glz'/>\n");
        xml.append("      <jpeg compression='auto'/>\n");
        xml.append("      <zlib compression='auto'/>\n");
        xml.append("      <playback compression='on'/>\n");
        xml.append("      <streaming mode='filter'/>\n");
        xml.append("    </graphics>\n");

        // SPICE通道
        xml.append("    <channel type='spicevmc'>\n");
        xml.append("      <target type='virtio' name='com.redhat.spice.0'/>\n");
        xml.append("    </channel>\n");

        xml.append("    <video>\n");
        xml.append("      <model type='qxl' ram='65536' vram='65536' vgamem='16384' heads='1' primary='yes'/>\n");
        xml.append("    </video>\n");
        xml.append("    <memballoon model='virtio'/>\n");
        xml.append("  </devices>\n");
        xml.append("</domain>\n");

        return xml.toString();
    }
}