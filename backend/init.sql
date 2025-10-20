/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80405 (8.4.5)
 Source Host           : localhost:3306
 Source Schema         : cloudnexus

 Target Server Type    : MySQL
 Target Server Version : 80405 (8.4.5)
 File Encoding         : 65001

 Date: 20/10/2025 19:38:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
                               `id` int NOT NULL AUTO_INCREMENT COMMENT '权限ID',
                               `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限码，如 post:view',
                               `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称，如 查看文章',
                               `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属模块，如 post, user, system',
                               `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '权限描述',
                               `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               PRIMARY KEY (`id`) USING BTREE,
                               UNIQUE INDEX `idx_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'vm:create', '创建虚拟机', 'vm', '允许用户在云平台上创建新的虚拟机实例。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (2, 'vm:start', '启动虚拟机', 'vm', '允许用户启动已存在的虚拟机实例。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (3, 'vm:stop', '停止虚拟机', 'vm', '允许用户强制停止正在运行的虚拟机。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (4, 'vm:shutdown', '软关机虚拟机', 'vm', '允许用户通过系统命令正常关闭虚拟机。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (5, 'vm:reboot', '重启虚拟机', 'vm', '允许用户重启虚拟机实例。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (6, 'vm:delete:own', '删除自己的虚拟机', 'vm', '允许用户删除自己创建的虚拟机。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (7, 'vm:delete:any', '删除任意虚拟机', 'vm', '允许运维或管理员删除任意虚拟机。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (8, 'vm:view:own', '查看自己的虚拟机', 'vm', '允许用户查看自己创建的虚拟机信息。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (9, 'vm:view:any', '查看所有虚拟机', 'vm', '允许查看所有虚拟机的状态与详情。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (10, 'vm:snapshot:create', '创建快照', 'vm', '允许用户为虚拟机创建快照。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (11, 'vm:snapshot:restore', '恢复快照', 'vm', '允许用户将虚拟机恢复到某个快照状态。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (12, 'vm:snapshot:delete', '删除快照', 'vm', '允许用户删除虚拟机快照。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (13, 'vm:clone:own', '克隆自己的虚拟机', 'vm', '允许用户克隆自己的虚拟机。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (14, 'vm:migrate', '迁移虚拟机', 'vm', '允许运维或管理员迁移虚拟机到其他宿主机。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (15, 'host:view', '查看宿主机', 'host', '允许用户查看宿主机的基本信息和状态。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (16, 'host:maintenance', '维护宿主机', 'host', '允许对宿主机执行维护操作，如进入维护模式。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (17, 'host:refresh', '刷新宿主机状态', 'host', '允许手动刷新宿主机的状态信息。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (18, 'template:create', '创建模板', 'template', '允许用户或运维创建虚拟机模板。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (19, 'template:edit:any', '编辑所有模板', 'template', '允许编辑系统内任意虚拟机模板。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (20, 'template:delete:any', '删除模板', 'template', '允许删除任意虚拟机模板。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (21, 'system:config', '系统配置', 'system', '允许修改系统全局配置项。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (22, 'system:user:manage', '用户管理', 'system', '允许管理员创建、编辑或禁用用户。', '2025-10-20 19:22:13');
INSERT INTO `permission` VALUES (23, 'system:log:view', '查看操作日志', 'system', '允许查看系统操作日志记录。', '2025-10-20 19:22:13');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码，如 ADMIN',
                         `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
                         `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '描述',
                         `status` tinyint NULL DEFAULT 1 COMMENT '状态：1启用，0禁用',
                         `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         PRIMARY KEY (`id`) USING BTREE,
                         UNIQUE INDEX `idx_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'USER', '普通用户', '可创建、管理自己的虚拟机及快照，无法操作他人或系统配置。', 1, '2025-10-20 19:22:13');
INSERT INTO `role` VALUES (2, 'OPERATOR', '运维操作员', '可管理虚拟机和宿主机，但不能管理用户和系统配置。', 1, '2025-10-20 19:22:13');
INSERT INTO `role` VALUES (3, 'ADMIN', '管理员', '系统超级管理员，拥有所有权限。', 1, '2025-10-20 19:22:13');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
                                    `role_id` int NOT NULL,
                                    `permission_id` int NOT NULL,
                                    PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
                                    INDEX `fk_rp_permission`(`permission_id` ASC) USING BTREE,
                                    CONSTRAINT `fk_rp_permission` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
                                    CONSTRAINT `fk_rp_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (3, 1);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (2, 2);
INSERT INTO `role_permission` VALUES (3, 2);
INSERT INTO `role_permission` VALUES (1, 3);
INSERT INTO `role_permission` VALUES (2, 3);
INSERT INTO `role_permission` VALUES (3, 3);
INSERT INTO `role_permission` VALUES (1, 4);
INSERT INTO `role_permission` VALUES (2, 4);
INSERT INTO `role_permission` VALUES (3, 4);
INSERT INTO `role_permission` VALUES (1, 5);
INSERT INTO `role_permission` VALUES (2, 5);
INSERT INTO `role_permission` VALUES (3, 5);
INSERT INTO `role_permission` VALUES (1, 6);
INSERT INTO `role_permission` VALUES (2, 6);
INSERT INTO `role_permission` VALUES (3, 6);
INSERT INTO `role_permission` VALUES (2, 7);
INSERT INTO `role_permission` VALUES (3, 7);
INSERT INTO `role_permission` VALUES (1, 8);
INSERT INTO `role_permission` VALUES (2, 8);
INSERT INTO `role_permission` VALUES (3, 8);
INSERT INTO `role_permission` VALUES (2, 9);
INSERT INTO `role_permission` VALUES (3, 9);
INSERT INTO `role_permission` VALUES (1, 10);
INSERT INTO `role_permission` VALUES (2, 10);
INSERT INTO `role_permission` VALUES (3, 10);
INSERT INTO `role_permission` VALUES (1, 11);
INSERT INTO `role_permission` VALUES (2, 11);
INSERT INTO `role_permission` VALUES (3, 11);
INSERT INTO `role_permission` VALUES (1, 12);
INSERT INTO `role_permission` VALUES (2, 12);
INSERT INTO `role_permission` VALUES (3, 12);
INSERT INTO `role_permission` VALUES (1, 13);
INSERT INTO `role_permission` VALUES (2, 13);
INSERT INTO `role_permission` VALUES (3, 13);
INSERT INTO `role_permission` VALUES (2, 14);
INSERT INTO `role_permission` VALUES (3, 14);
INSERT INTO `role_permission` VALUES (1, 15);
INSERT INTO `role_permission` VALUES (2, 15);
INSERT INTO `role_permission` VALUES (3, 15);
INSERT INTO `role_permission` VALUES (2, 16);
INSERT INTO `role_permission` VALUES (3, 16);
INSERT INTO `role_permission` VALUES (2, 17);
INSERT INTO `role_permission` VALUES (3, 17);
INSERT INTO `role_permission` VALUES (2, 18);
INSERT INTO `role_permission` VALUES (3, 18);
INSERT INTO `role_permission` VALUES (2, 19);
INSERT INTO `role_permission` VALUES (3, 19);
INSERT INTO `role_permission` VALUES (2, 20);
INSERT INTO `role_permission` VALUES (3, 20);
INSERT INTO `role_permission` VALUES (3, 21);
INSERT INTO `role_permission` VALUES (3, 22);
INSERT INTO `role_permission` VALUES (1, 23);
INSERT INTO `role_permission` VALUES (2, 23);
INSERT INTO `role_permission` VALUES (3, 23);

-- ----------------------------
-- Table structure for user_information
-- ----------------------------
DROP TABLE IF EXISTS `user_information`;
CREATE TABLE `user_information`  (
                                     `id` int NOT NULL AUTO_INCREMENT COMMENT '用户创建顺序',
                                     `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '唯一用户id',
                                     `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
                                     `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用户头像',
                                     `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
                                     `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
                                     `gender` enum('male','female','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'other' COMMENT '性别',
                                     `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
                                     `birthday` date NULL DEFAULT NULL COMMENT '生日',
                                     `role_id` int NOT NULL DEFAULT 1 COMMENT '角色ID',
                                     `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `status` tinyint NOT NULL COMMENT '状态：0=删除,1=正常,2=封禁',
                                     PRIMARY KEY (`id`) USING BTREE,
                                     UNIQUE INDEX `uuid`(`uuid` ASC) USING BTREE,
                                     UNIQUE INDEX `username`(`username` ASC) USING BTREE,
                                     INDEX `fk_user_role`(`role_id` ASC) USING BTREE,
                                     CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_information
-- ----------------------------
INSERT INTO `user_information` VALUES (1, '075eb86f721743e3940f35869154a140175689381296899805858', 'admin', '/upload/admin/avatar/avatar-3e04e348-8bef-4abe-a164-572e0421f17e-1757579183.jpeg', NULL, 'official@dimstack.com', 'other', '$2a$10$hNfMxBf3egQkomuMql9LDeMJb2AC9IXkp904GgqX6DAxc8u9i1aAm', NULL, 3, '2025-09-03 18:03:33', 1);

SET FOREIGN_KEY_CHECKS = 1;
