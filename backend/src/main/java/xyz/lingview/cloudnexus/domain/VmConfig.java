package xyz.lingview.cloudnexus.domain;

/**
 * @Author: lingview
 * @Date: 2025/10/22 18:24:28
 * @Description: 模板数据
 * @Version: 1.0
 */

import lombok.Data;

import java.util.List;

@Data
public class VmConfig {
    private String name;
    private int memoryMB;
    private int vcpus;
    private String diskPath;
    private String isoPath;
    private String networkType = "default";
    private List<String> additionalIsoPaths;
    private List<String> networkInterfaces;
    private String osType;
    private boolean enableVirtioDrivers;
}