/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.25 : Database - system_admin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`system_admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `system_admin`;

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(40) NOT NULL COMMENT '菜单 ID',
  `parent_id` varchar(40) DEFAULT NULL COMMENT '父菜单 ID (0为顶级菜单)',
  `name` varchar(60) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `type` int DEFAULT '1' COMMENT '类型(1目录，2菜单，3按钮)',
  `code` varchar(60) DEFAULT NULL COMMENT '授权标识符',
  `icon` varchar(200) DEFAULT NULL COMMENT '图标',
  `sort` int DEFAULT '1' COMMENT '排序',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='菜单信息表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`name`,`url`,`type`,`code`,`icon`,`sort`,`remark`,`create_date`,`update_date`) values 
('11','0','首页','/dashboard',1,'index','el-icon-s-home',1,'','2023-08-08 11:11:11','2020-04-24 22:28:38'),
('1251060960026705921','0','博客管理','/blog',1,'blog','el-icon-notebook-2',2,NULL,'2020-04-17 16:12:31','2020-04-24 22:29:29'),
('1251061016268128258','1251060960026705921','标签管理','/blog/label',2,'label','el-icon-collection-tag\nel-icon-collection-tag\nel-icon-collection-tag\nel-icon-collection-tagel-icon-collection-tag',3,NULL,'2020-04-17 16:12:44','2020-04-24 10:33:28'),
('1251061181913776129','1251060960026705921','分类管理','/blog/category',2,'category','el-icon-s-order',2,NULL,'2020-04-17 16:13:24','2020-04-24 10:33:14'),
('1251061228965478402','1251060960026705921','文章管理','/blog/article',2,'article','el-icon-notebook-1\nel-icon-notebook-1',1,NULL,'2020-04-17 16:13:35','2020-04-24 15:40:53'),
('1251061280744161281','1251061228965478402','查询','',3,'article:search','',1,NULL,'2020-04-17 16:13:47','2020-07-10 16:19:54'),
('1251061397639413762','1251061228965478402','删除','',3,'article:delete','',4,NULL,'2020-04-17 16:14:15','2020-07-10 16:24:52'),
('1251061460868546562','1251061228965478402','查看','',3,'article:view','',3,NULL,'2020-04-17 16:14:30','2020-07-30 15:26:04'),
('1251070494405349377','1251061181913776129','查询','',3,'category:search','',1,NULL,'2020-04-17 16:50:24','2020-07-10 16:24:24'),
('1251070561216417794','1251061181913776129','新增','',3,'category:add','',2,NULL,'2020-04-17 16:50:40','2020-07-10 16:24:30'),
('1251070617537531905','1251061181913776129','编辑','',3,'category:edit','',3,NULL,'2020-04-17 16:50:53','2020-07-10 16:24:37'),
('1251070746856312833','1251061181913776129','删除','',3,'category:detele','',4,NULL,'2020-04-17 16:51:24','2020-07-10 16:24:20'),
('1251071087492517890','1251061016268128258','查询','',3,'label:search','',1,NULL,'2020-04-17 16:52:45','2020-07-10 16:23:26'),
('1251071167758913538','1251061016268128258','新增','',3,'label:add','',2,NULL,'2020-04-17 16:53:04','2020-07-10 16:23:17'),
('1251071220363874305','1251061016268128258','编辑','',3,'label:edit','',4,NULL,'2020-04-17 16:53:17','2020-07-10 16:22:53'),
('1251071270213177345','1251061016268128258','删除','',3,'label:delete','',4,NULL,'2020-04-17 16:53:29','2020-07-10 16:23:03'),
('1251071340815896577','18','设置角色','',3,'user:role','',5,NULL,'2020-04-17 16:53:46','2020-07-10 16:27:47'),
('1251071383350333442','18','密码修改','',3,'user:password','',6,NULL,'2020-04-17 16:53:56','2020-07-10 16:27:52'),
('1251071493878632450','0','广告管理','/advert/index',2,'adver','el-icon-picture-outline-round',3,NULL,'2020-04-17 16:54:22','2020-04-24 22:20:46'),
('1253512582655021057','1251061228965478402','审核','',3,'article:audit','',2,NULL,'2020-04-24 10:34:23','2020-07-10 16:25:27'),
('1253513166296616961','0','梦学谷官网','http://www.mengxuegu.com',2,'public','el-icon-link',5,NULL,'2020-04-24 10:36:42','2020-04-24 15:58:34'),
('1253592898971275265','23','分配权限','',3,'role:permission','',5,NULL,'2020-04-24 15:53:32','2020-07-10 16:30:22'),
('1281490789589049345','1251071493878632450','新增','',3,'advert:add','',2,'新增广告按钮','2020-07-10 15:29:47','2020-07-10 16:24:01'),
('1281503969723801601','1251071493878632450','删除','',3,'advert:delete','',4,NULL,'2020-07-10 16:22:10','2020-07-10 16:22:10'),
('1281504074870808577','1251071493878632450','编辑','',3,'advert:edit','',3,NULL,'2020-07-10 16:22:35','2020-07-10 16:22:35'),
('1281504383378644993','1251071493878632450','查询','',3,'advert:search','',1,NULL,'2020-07-10 16:23:48','2020-07-10 16:23:48'),
('17','0','系统管理','/system',1,'system','el-icon-setting',4,NULL,'2023-08-08 11:11:11','2020-04-24 22:28:56'),
('18','17','用户管理','/system/user',2,'user','el-icon-user-solid',1,NULL,'2023-08-08 11:11:11','2020-07-10 16:28:26'),
('19','18','查询','',3,'user:search','',1,'员工列表','2023-08-08 11:11:11','2020-07-10 16:26:49'),
('20','18','新增','',3,'user:add','',2,'新增用户','2023-08-08 11:11:11','2020-07-10 16:26:15'),
('21','18','编辑','',3,'user:edit','',3,'修改用户','2023-08-08 11:11:11','2020-07-10 16:27:38'),
('22','18','删除','',3,'user:delete','',4,'删除用户','2023-08-08 11:11:11','2020-07-10 16:26:24'),
('23','17','角色管理','/system/role',2,'role','el-icon-coin',2,NULL,'2023-08-08 11:11:11','2020-07-10 16:28:36'),
('24','23','查询','',3,'role:search','',1,'角色列表','2023-08-08 11:11:11','2020-07-10 16:29:05'),
('25','23','新增','',3,'role:add','',2,'新增角色','2023-08-08 11:11:11','2020-07-10 16:29:17'),
('26','23','修改','',3,'role:edit','',3,'修改角色','2023-08-08 11:11:11','2020-07-10 16:29:53'),
('27','23','删除','',3,'role:delete','',4,'删除角色','2023-08-08 11:11:11','2020-07-10 16:30:16'),
('28','17','菜单管理','/system/menu',2,'menu','el-icon-menu',3,NULL,'2023-08-08 11:11:11','2020-07-10 16:28:43'),
('29','28','查询','',3,'menu:search','',1,'权限列表','2023-08-08 11:11:11','2020-07-10 16:31:01'),
('30','28','新增','',3,'menu:add','',2,'新增权限','2023-08-08 11:11:11','2020-07-10 16:31:12'),
('31','28','修改','',3,'menu:edit','',3,'修改权限','2023-08-08 11:11:11','2020-07-10 16:31:29'),
('32','28','删除','',3,'menu:delete','',4,'删除权限','2023-08-08 11:11:11','2020-07-10 16:31:21');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(40) NOT NULL COMMENT '角色 ID',
  `name` varchar(60) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '角色说明',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`remark`,`create_date`,`update_date`) values 
('10','普通管理员','拥有查看权限','2023-08-08 11:11:11','2023-08-08 11:11:11'),
('9','超级管理员','拥有所有的权限','2023-08-08 11:11:11','2023-08-08 11:11:11');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` varchar(40) NOT NULL COMMENT '主键 ID',
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色 ID',
  `menu_id` varchar(40) DEFAULT NULL COMMENT '菜单 ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色权限表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values 
('1287965925087313921','9','11'),
('1287965925087313922','9','1251060960026705921'),
('1287965925087313923','9','1251061228965478402'),
('1287965925087313924','9','1251061280744161281'),
('1287965925091508225','9','1253512582655021057'),
('1287965925091508226','9','1251061460868546562'),
('1287965925091508227','9','1251061397639413762'),
('1287965925091508228','9','1251061181913776129'),
('1287965925091508229','9','1251070494405349377'),
('1287965925091508230','9','1251070561216417794'),
('1287965925091508231','9','1251070617537531905'),
('1287965925091508232','9','1251070746856312833'),
('1287965925091508233','9','1251061016268128258'),
('1287965925091508234','9','1251071087492517890'),
('1287965925091508235','9','1251071167758913538'),
('1287965925091508236','9','1251071270213177345'),
('1287965925091508237','9','1251071220363874305'),
('1287965925091508238','9','1251071493878632450'),
('1287965925091508239','9','1281504383378644993'),
('1287965925091508240','9','1281490789589049345'),
('1287965925091508241','9','1281504074870808577'),
('1287965925091508242','9','1281503969723801601'),
('1287965925091508243','9','17'),
('1287965925091508244','9','18'),
('1287965925091508245','9','19'),
('1287965925091508246','9','20'),
('1287965925091508247','9','21'),
('1287965925091508248','9','22'),
('1287965925091508249','9','1251071340815896577'),
('1287965925095702529','9','1251071383350333442'),
('1287965925095702530','9','23'),
('1287965925095702531','9','24'),
('1287965925095702532','9','25'),
('1287965925095702533','9','26'),
('1287965925095702534','9','27'),
('1287965925095702535','9','1253592898971275265'),
('1287965925095702536','9','28'),
('1287965925095702537','9','29'),
('1287965925095702538','9','30'),
('1287965925095702539','9','31'),
('1287965925095702540','9','32'),
('1287965925095702541','9','1253513166296616961');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(40) NOT NULL COMMENT '用户 ID',
  `username` varchar(60) DEFAULT NULL COMMENT '用户名',
  `password` varchar(60) DEFAULT NULL COMMENT '密码，加密存储, admin/1234',
  `is_account_non_expired` int DEFAULT '1' COMMENT '帐户是否过期(1 未过期，0已过期)',
  `is_account_non_locked` int DEFAULT '1' COMMENT '帐户是否被锁定(1 未过期，0已过期)',
  `is_credentials_non_expired` int DEFAULT '1' COMMENT '密码是否过期(1 未过期，0已过期)',
  `is_enabled` int DEFAULT '1' COMMENT '帐户是否可用(1 可用，0 删除用户)',
  `nick_name` varchar(60) DEFAULT NULL COMMENT '昵称',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像url',
  `mobile` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `pwd_update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '密码更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`is_account_non_expired`,`is_account_non_locked`,`is_credentials_non_expired`,`is_enabled`,`nick_name`,`image_url`,`mobile`,`email`,`create_date`,`update_date`,`pwd_update_date`) values 
('10','test','$2a$10$uA51hWL5yusFBoEvZOAZbeaYYqUaFV7xjdDB8GA.4iViNiCSK9xKO',1,1,1,1,'测试','https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','16888886666','test1@qq.com','2023-08-08 11:11:11','2020-05-22 15:05:57','2020-04-10 09:41:51'),
('11','string','$2a$10$uA51hWL5yusFBoEvZOAZbeaYYqUaFV7xjdDB8GA.4iViNiCSK9xKO',0,1,0,0,'string','https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','string','string','2020-04-11 21:37:25','2020-04-17 16:43:19','2020-04-11 21:37:25'),
('1253583309139775489','root','$2a$10$qci2y9rouzWgEP/injjeDeUAFbWIGP7wQILjqmDE61S1ZMwWqiGqi',0,1,1,1,'root','https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','15888888888',NULL,'2020-04-24 15:15:26','2020-07-25 09:16:36','2020-04-24 15:15:26'),
('1417128448945963009','test0','$2a$10$2.57TTT1E0GOjKePrwMaP.uV7L3oQy1zNFayqgx/SClg3KOMkyoHO',1,1,1,1,'测试','https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','16888896666','tes1@qq.com','2021-07-19 22:25:25','2021-07-19 22:25:25','2021-07-19 22:25:25'),
('1417494641070567426','luo','$2a$10$GRZPTb2a7SFuaQQfwqGkUupWVvsqamSOQCVQQwoHmEmOfxUrsf1me',1,1,1,1,'luo',NULL,'15122061897','123@qq.com','2021-07-20 22:40:33','2021-07-20 22:40:33','2021-07-20 22:40:33'),
('9','admin','$2a$10$2c6uqCzY3ObyCBU7WnY/AORFVU6ZAR.JfUnsogxX3ixgsszCJeiWW',1,1,1,1,'梦学谷','https://mengxuegu.oss-cn-shenzhen.aliyuncs.com/article/20200522/8665d73ae2484bd28bc2ff4103538385.png','18888888888','mengxuegu888@163.com','2023-08-08 11:11:11','2020-05-22 22:30:14','2020-04-10 09:41:51');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` varchar(40) NOT NULL COMMENT '主键 ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户 ID',
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色 ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户角色关系表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values 
('1287965845408120834','9','9'),
('2','10','10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
