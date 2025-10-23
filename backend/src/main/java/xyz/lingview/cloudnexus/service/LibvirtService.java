package xyz.lingview.cloudnexus.service;

import org.libvirt.Connect;
import org.libvirt.LibvirtException;
import org.springframework.stereotype.Service;

/**
 * @Author: lingview
 * @Date: 2025/10/22 18:18:52
 * @Description: libvirtd连接
 * @Version: 1.0
 */
@Service
public class LibvirtService {

    private Connect connect() throws LibvirtException {
        // 连接到本地 QEMU/KVM hypervisor
        return new Connect("qemu:///system");

        // 连接远程主机
        // return new Connect("qemu+ssh://root@remote-host/system");
    }
}
