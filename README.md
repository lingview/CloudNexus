# CloudNexus

## 权限设计
| 模块              | 权限 code               | 用户 User | 运维 Operator | 管理员 Admin | 权限说明       |
| --------------- | --------------------- | ------- | ----------- | --------- | ---------- |
| **虚拟机 VM**      | `vm:create`           | ✓       | ✓           | ✓         | 创建虚拟机      |
|                 | `vm:start`            | ✓       | ✓           | ✓         | 启动虚拟机      |
|                 | `vm:stop`             | ✓       | ✓           | ✓         | 停止虚拟机      |
|                 | `vm:shutdown`         | ✓       | ✓           | ✓         | 关闭虚拟机      |
|                 | `vm:reboot`           | ✓       | ✓           | ✓         | 重启虚拟机      |
|                 | `vm:delete:own`       | ✓       | ✓           | ✓         | 删除自己拥有的虚拟机 |
|                 | `vm:delete:any`       | ✗       | ✓           | ✓         | 删除任意虚拟机    |
|                 | `vm:view:own`         | ✓       | ✓           | ✓         | 查看自己的虚拟机   |
|                 | `vm:view:any`         | ✗       | ✓           | ✓         | 查看任意虚拟机    |
|                 | `vm:snapshot:create`  | ✓       | ✓           | ✓         | 创建快照       |
|                 | `vm:snapshot:restore` | ✓       | ✓           | ✓         | 恢复快照       |
|                 | `vm:snapshot:delete`  | ✓       | ✓           | ✓         | 删除快照       |
|                 | `vm:clone:own`        | ✓       | ✓           | ✓         | 克隆自己的虚拟机   |
|                 | `vm:migrate`          | ✗       | ✓           | ✓         | 迁移虚拟机      |
| **宿主机 Host**    | `host:view`           | ✓       | ✓           | ✓         | 查看宿主机      |
|                 | `host:maintenance`    | ✗       | ✓           | ✓         | 进入维护模式     |
|                 | `host:refresh`        | ✗       | ✓           | ✓         | 刷新宿主机状态    |
| **模板 Template** | `template:create`     | ✗       | ✓           | ✓         | 创建模板       |
|                 | `template:edit:any`   | ✗       | ✓           | ✓         | 编辑任意模板     |
|                 | `template:delete:any` | ✗       | ✓           | ✓         | 删除任意模板     |
| **系统 System**   | `system:config`       | ✗       | ✗           | ✓         | 系统配置管理     |
|                 | `system:log:view`     | ✓       | ✓           | ✓         | 查看系统日志     |
|                 | `system:user:manage`  | ✗       | ✗           | ✓         | 管理用户账号     |
