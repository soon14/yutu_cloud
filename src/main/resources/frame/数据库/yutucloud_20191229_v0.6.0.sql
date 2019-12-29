/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 8.0.18 : Database - yutucloud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yutucloud` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `yutucloud`;

/*Table structure for table `t_cod_config` */

DROP TABLE IF EXISTS `t_cod_config`;

CREATE TABLE `t_cod_config` (
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编码',
  `config_code` varchar(64) DEFAULT NULL COMMENT '配置编码',
  `config_name` varchar(512) DEFAULT NULL COMMENT '配置名称',
  `config_parent` varchar(64) DEFAULT NULL COMMENT '配置父类',
  `config_level` int(11) DEFAULT NULL COMMENT '配置等级',
  `config_status` int(11) DEFAULT '1' COMMENT '配置状态：0:关闭；1:开启',
  `order_by` int(11) DEFAULT '1' COMMENT '排序',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通用_码表';

/*Data for the table `t_cod_config` */

insert  into `t_cod_config`(`uuid`,`config_code`,`config_name`,`config_parent`,`config_level`,`config_status`,`order_by`,`update_time`,`remarks`) values ('2500955e-2483-11ea-941d-f875a40f96a2','yutu_web','中科宇图公司','f7d522d1-2482-11ea-941d-f875a40f96a2',2,1,1,NULL,NULL),('f7d522d1-2482-11ea-941d-f875a40f96a2','appName','单点登录列表','0',1,1,1,'2019-12-22 14:20:10',NULL);

/*Table structure for table `t_log_error` */

DROP TABLE IF EXISTS `t_log_error`;

CREATE TABLE `t_log_error` (
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `project_name` varchar(128) DEFAULT NULL COMMENT '项目名称',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `log_level` varchar(64) DEFAULT NULL COMMENT '等级',
  `log_category` varchar(128) DEFAULT NULL COMMENT '类别',
  `file_name` varchar(256) DEFAULT NULL COMMENT '文件名',
  `thread_name` varchar(64) DEFAULT NULL COMMENT '线程名称',
  `log_line` varchar(256) DEFAULT NULL COMMENT '线程日志',
  `all_category` varchar(515) DEFAULT NULL COMMENT '所有类型',
  `log_message` text COMMENT '详细信息',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日志管理_异常错误信息表';

/*Data for the table `t_log_error` */

/*Table structure for table `t_log_landing` */

DROP TABLE IF EXISTS `t_log_landing`;

CREATE TABLE `t_log_landing` (
  `uuid` varchar(64) NOT NULL COMMENT '主键编码',
  `login_userid` varchar(64) DEFAULT NULL COMMENT '用户id',
  `login_account` varchar(64) DEFAULT NULL COMMENT '登录账号',
  `login_ip` varchar(128) DEFAULT NULL COMMENT '登陆者的ip',
  `login_sessionid` varchar(128) DEFAULT NULL COMMENT '登陆sessionId',
  `login_date` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_type` varchar(32) DEFAULT NULL COMMENT '登陆类型： 登陆/退出登录',
  `login_result` int(11) DEFAULT NULL COMMENT '登陆结果   0：登陆成功   1：登陆失败',
  `login_appname` varchar(256) DEFAULT NULL COMMENT '登录子系统/模块名称',
  `login_address` varchar(256) DEFAULT NULL COMMENT '登陆系统地址',
  `appkey` varchar(128) DEFAULT NULL COMMENT 'appKey',
  `token` varchar(128) DEFAULT NULL COMMENT 'token',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志_用户登录表';

/*Data for the table `t_log_landing` */

insert  into `t_log_landing`(`uuid`,`login_userid`,`login_account`,`login_ip`,`login_sessionid`,`login_date`,`login_type`,`login_result`,`login_appname`,`login_address`,`appkey`,`token`,`remarks`) values ('0161c26f-7e4f-42c9-ab14-1c9230bc0e5f','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','D005E1511CA190C51AF16CB57E2A9ED4','2019-12-29 16:51:24','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('01f172e5-01b5-4216-b098-97c52ad7f003','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','222A7A00691E03E31B60A8A9AD2E8AE0','2019-12-28 22:57:09','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('01f3237e-7ed8-40e5-96f6-d2f03149410a','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','5D57F34DC0193288EF46C515C16875F8','2019-12-29 15:28:29','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('04b39618-d109-4d6b-94af-f7fc1eb89b1e','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','ADFE7070870A8D619E0E04E4D8A9D92B','2019-12-29 16:12:02','登陆',1,'子系统一','/loginSSO','yutu_web','c91ddbd9-144d-4a5c-bd91-a1e40ba85f5e',NULL),('04bc0f8e-a717-422f-a0ec-ac4e3fbf1b4e','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','E8B7EE1764B20EBFE95AEB10CF9ACD62','2019-12-29 14:54:47','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('06941970-bb32-4424-b7e0-6bf967a2f61e','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','12716F9FE74D3DA2C4D82B724273DFE6','2019-12-28 22:05:30','门户登陆',0,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('07c602b7-2b4b-4c78-81ed-fded0b7d7f91','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','A60F20C81CCCF3DE5DD247AF579D8336','2019-12-29 16:16:09','登陆',1,'子系统一','/loginSSO','yutu_web','59270a25-cad9-4977-ac84-e74c07aa09d1',NULL),('0a17b66c-baa1-4be3-b6c4-b35f4b2f94e9','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','D5EB1A90C004C329DA884DE516AD77B4','2019-12-22 10:54:47','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('0a2de812-4f9f-4f6e-bcf5-3919299a5a89','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','539D3707F5BA4A93FFE34DFCFEE5CB76','2019-12-29 16:16:07','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('10d9e754-41b9-4a87-a0c4-2eab5a592b0b','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','6C5A7E89FD7AE8D9225B3BC6A5D86C83','2019-12-18 22:36:18','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('1336930d-5333-4425-8f04-3cf22a7e19ec','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','05DBF494AC6B18A744E0FFD100A7E503','2019-12-29 15:00:35','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1412b8b8-0695-438b-bf4e-4163485bf0ed','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','5EABD095B32858A233E112AF97D14709','2019-12-29 14:58:20','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1543bea0-cc4b-465e-b388-4ef7df68cd2d','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','3AE1CE7934D3AF32F649D1D2D773ED6B','2019-12-28 21:52:21','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1573abcd-68a1-4130-8979-e83bdc112dc1','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','3B3DEFD8DC24013F36F6309087C5B7CC','2019-12-26 22:28:52','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('16150050-777b-468d-8363-f9b345b6692c','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','AD2B33705B119C4732125D4B9A229A1B','2019-12-22 16:12:38','门户登陆',0,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('16971105-9dcc-4b6f-ab26-e979140cc5ce','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','DDDC7AD44701B7079DFC783924CE5A1C','2019-12-28 23:20:09','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('180c3bd0-ec52-4a87-b8ac-7e4e0d2be03c','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','B38A199C97C50564E59DD1319AE18935','2019-12-29 14:58:05','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1c06f312-7950-4238-b649-c8c1db3e7470','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','21C69BC3A59E20AD30CE6D46D7B9B923','2019-12-28 23:11:05','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1ca821f9-6de0-4b9b-80fb-aff1aa498ab0','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','A7AC591E9B6B26CF0286AF35C6A08BA6','2019-12-29 16:18:11','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1ca9f1fa-22ee-49ab-a3ac-0aa29369e9e0','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','84AA3AA59A4AB7FDDFBFF028F7C8EF91','2019-12-29 16:19:42','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1d3b1ddb-d311-4fe9-89cf-aad70d0db4b5','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','31E47686C184A69D772CA9FAF2617181','2019-12-26 22:31:47','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1f4a5283-1bfe-4ab9-981b-fe904a1e7eae','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','3A1AC34680A9194E0F909A11AAACC5DD','2019-12-29 14:29:25','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1f8673a0-7860-45df-a305-e55b36b069da','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','01ADCAFB124899DCABD203BF29B4678F','2019-12-29 17:11:01','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1fc8cbce-6ff9-4983-a842-13ce948e6ea6','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','FB6EDD271CD9535D7DB8E1861434C201','2019-12-29 14:39:16','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('1fce8485-993f-4377-9492-6da176c60b17','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','DCDFD978F268374F3E775392D6740A20','2019-12-29 14:56:42','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('217f08ca-29e8-4ed0-87fe-96fd3d6a877f','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','F69A8675A73F95C58B28E6CC32A29218','2019-12-22 17:54:16','门户登陆',0,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('2411d463-4739-44f6-b4a6-338ac24367d1','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','F4873D10CBFB22326644AE68165CAEF7','2019-12-22 10:30:49','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('24a6de04-5953-44f0-a05c-7296ac9be6f3','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','DF4E8F7BF46CA938A416636FB413010C','2019-12-22 13:55:08','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('24eac19c-0a3c-4922-8599-7f49365571c4','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','EAED2B6314AA60DDE6BC2A46B5A0741C','2019-12-29 14:24:48','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('25ac7b8b-771b-4ec6-be80-9eecfe408e1d','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','6FB1652E6DB1CFEBD8FA2ED542FACE2E','2019-12-20 23:03:26','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('291f543f-52cc-427b-b25a-f2018c3d2b62','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','E663CACD643E4BC58B2A68FFEE396485','2019-12-28 22:11:51','门户登陆',0,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('29ba73ab-5257-472a-8789-04160b375419','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','C5EC2FA80A7187E48C4A0A4ECBDE6720','2019-12-29 16:18:48','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('2bd55264-59c0-4b6c-9a25-11dcad8d8d14','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','EE6CA3B3C7BABCF8BCD0E87E54FA5FF6','2019-12-26 23:11:45','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('2d0302d7-716c-4143-8361-b0a534296d03','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','17C5A5B75ACD2CF6041D87B017771282','2019-12-22 14:44:54','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('2da41d20-f986-4494-ba6d-65cbba8f2da9','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','A25A62A309E4D52108CFF4CE7CA73DEB','2019-12-18 22:40:49','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('2dcc107f-938a-4cde-9bad-f2aba0a83d09','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','9DE6BC5D21A5849EA8877E9C7C04DFFE','2019-12-20 22:50:43','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('2ed1484e-dd3d-496f-b88f-d363ade64791','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','1966A1C2FC48CF75E6EB6E404DB60FCE','2019-12-26 22:24:12','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('311a8b43-efc6-4c28-9558-e342d68cbc59','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','25E67E1EA9E3A5D16BEDA7F8AFC9F572','2019-12-22 11:02:55','门户登陆',0,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('32b65bd4-3a30-4b4e-ac9b-f9ad8fc4e9f1','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','D244D2E642A201B8C0DC76C2AA25ED38','2019-12-29 10:28:53','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('34699c61-8204-42ef-b680-0fc19d79c275','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','0FE498EC2D4410B3E8BEFEADD9B1C4E7','2019-12-22 10:47:44','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('399291ee-7b83-4b32-a5ba-afbe83528a64','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','334D3B695A2CD92E9793657EC01D8559','2019-12-22 09:14:41','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('3c156401-df88-4da7-942c-eb9b5cea03af','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','EE42B3BAA59BC23689175C9E9BE3AA8C','2019-12-29 16:18:50','登陆',1,'子系统一','/loginSSO','yutu_web','ca7cf2b2-7529-4d57-9877-74b72072b5b3',NULL),('3c324763-8a43-4900-b6f8-18224814a4e3','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','B55BEC51BA354D7FB77493AE21E8DC59','2019-12-22 11:07:22','门户登陆',0,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('3cace722-95c7-472a-a576-6342bb939367','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','03614618B06A6DA4A87DB2F99896A920','2019-12-20 22:55:01','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('3d45cc05-5ab4-40c2-a040-e08468263562','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','724DF41DED27BAAAF98EA71E36321D31','2019-12-20 22:54:40','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('3f67bb07-ee5c-40c7-8b6a-5b6a6029b9f6','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','982F9CF4BA92664B70264235B971AB06','2019-12-29 12:06:47','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('4526724f-9518-4f10-9849-4e9866cdde12','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','25794910F8B11235391590060991D736','2019-12-28 22:29:50','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('45b64feb-6bc3-4b2c-8789-e2afb567873c','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','A521DFB7B10540485D6D05EA471B785B','2019-12-22 17:53:36','子系统一登陆',1,'子系统一','/login/getLoginVerification',NULL,NULL,NULL),('49286ea2-4e41-48c6-99f5-8ab6d9256620','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','53233202C3887F3F476D3A57F269CB0A','2019-12-20 22:41:08','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('4a21c77f-79ac-480d-894b-bab98ddb6723','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','AC86D7FA081A7729FA17EED802AC413E','2019-12-29 14:50:49','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('4ae105a6-a175-4633-9b62-69b791700635','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','2D27D12B4C4F96C57971EC8E41843D16','2019-12-29 16:41:06','登陆',1,'子系统一','/loginSSO','yutu_web','1a1020c8-cc5d-4fb9-bc97-fff9c6f9d6cd',NULL),('4c9187d0-7006-4ba9-bea3-e2195c2dce1f','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','1D322A4382FEBC9B09D8D5F8D4B6EFB5','2019-12-15 18:05:17','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('4cabd094-1a84-42ff-a19b-b6bab1793f9b','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','D95C811A1B6CBE0019DF1CFC2FF9CE53','2019-12-29 16:20:50','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('4fae171c-3984-4f3f-ab71-b2848b9c32d0','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','CD0C3851B72BB92BA6F91D9ADBDDDEA6','2019-12-29 15:47:11','注销',1,'子系统一','/login/logout','yutu_web','6a0a24f0-a610-419f-861d-a075c31be0d5','org.springframework.data.redis.RedisConnectionFailureException: Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 192.168.4.20:16379'),('512111ea-c367-4a04-a901-b7b1aa1a1c21','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','0D0675AF702C007F69DD2BEBDD1A2E69','2019-12-29 11:20:47','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('51645a9d-a09f-4b33-bd28-14fd9904e618','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','AA52FFA895C262E13F9CD9830AFDC26F','2019-12-15 15:24:17','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('5235ad4c-d195-4fc3-8aa5-dbf1a3e738e6','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','0385FF5089B797E8C005EAB9533542BC','2019-12-28 23:22:48','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('5390b3cd-13d6-4d84-9c4f-16b498348765','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','CD0C3851B72BB92BA6F91D9ADBDDDEA6','2019-12-29 15:46:13','注销',1,'子系统一','/login/logout','yutu_web','6a0a24f0-a610-419f-861d-a075c31be0d5','org.springframework.data.redis.RedisConnectionFailureException: Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 192.168.4.20:16379'),('56ebda0c-db8b-445e-9d18-20e9c918dc0b','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','674FECA8BE8F121D7073D94CB37F1553','2019-12-29 14:32:58','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('58f28bab-78eb-456e-9c30-ab51bf2fbcb7','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','2AF14C8CC1773512FC231057A8F06A3A','2019-12-29 16:44:35','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('5a4e6c20-7c65-4b80-bcee-a83046f67c86','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','3E65148B03DD813872E2988D27E773CD','2019-12-29 16:51:59','登陆',1,'子系统一','/loginSSO','yutu_web','b18ee530-e6db-4c1f-8fcb-5fbf75cfb4e8',NULL),('5c84dae8-9ee8-4d28-904a-23d354dbeb26','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','A4399C38A341295B70C523BB0EC4ED06','2019-12-18 22:39:24','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('5e8d55ab-a7e4-49db-af0e-f103c589a8b9','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','6C44D4D8A2E09AD4E63C2C1367EE94D6','2019-12-29 14:43:07','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('6017fca0-808e-430c-b8e4-3dd3cd89ded8',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,'2019-12-20 22:38:11','门户登陆',NULL,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('622a9336-c116-483b-821c-1cc6fb25d3f2','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','AD2B33705B119C4732125D4B9A229A1B','2019-12-22 16:13:18','门户注销',1,'系统门户网站','/login/logout',NULL,NULL,'org.springframework.data.redis.RedisConnectionFailureException: Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 192.168.4.20:16379'),('63cc5618-fbf5-43a1-afaf-40da035e925d',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,'2019-12-20 22:37:26','门户登陆',NULL,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('65ba99a6-4d82-451e-a3d6-778889d39e38','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','8A57ABD5CAFE1EB4C6D9723E8E7273A5','2019-12-18 22:18:37','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('662bc2f0-be96-4798-ad4f-e4a25c70b290','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','3D95F9933C0B4905DEB8FAA70767B0FB','2019-12-22 17:54:43','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('6916d72d-bc59-4095-bd63-f1a97d6a5939','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','A891172764096F09BE8D4626CF76296A','2019-12-15 19:22:29','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('6986fa9b-771a-4aef-a3fd-93507c041f21','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','245B78CFEDA266A92E0684AFCAE81EE6','2019-12-22 14:26:42','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('6da58c9d-5191-4b95-82dc-fcc858831a9f','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','E48C23A27A2E8A711F65A38D4A82691E','2019-12-29 16:50:02','登陆',1,'子系统一','/loginSSO','yutu_web','0b5463ab-e1ce-4d15-a984-8d5ab41ecd57',NULL),('6f284889-70f4-4f5d-81b2-98fa5d1be20d','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','2AE3714E866714426ECBED7BB5789D86','2019-12-18 22:21:52','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('7056ad70-5efa-4fbf-bb7b-1d542fa5e7de','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','1338AC2BCA6AD401F3AA11B358BFF263','2019-12-29 14:19:14','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('70fe416f-07a8-48ba-a890-59c74f070c5b','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','994A1AE2F9E5D74BC4D91C881F3FE507','2019-12-18 22:16:22','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('71774aab-3d39-4076-8f0e-8e213252e05e','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','C588D32978C1F4EC28A1BAF03ECABD97','2019-12-28 21:49:37','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('72c7fadc-855b-4c35-8045-1b1cf31e6170','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','DC70D303091A6DCF868BA233E7AF0459','2019-12-29 15:44:58','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('73b7c5ef-8129-43e7-8612-98f8068521aa','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','0D5247FCC5AB2DE20E9BA515493CB3E5','2019-12-29 16:51:01','登陆',1,'子系统一','/loginSSO','yutu_web','4e5fa791-e0cd-452c-876f-155a084ce0cb',NULL),('74c3c0b8-852d-4128-a9ec-c51fb9d5cee5',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,'2019-12-20 22:40:25','门户登陆',NULL,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('773ee7a7-1f8f-4caf-82b6-7c297deef0a8','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','F12CEB47873CE89AAAE54F6CCF5CA46A','2019-12-20 22:55:24','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('77529200-2223-47e7-8eef-cb67e38496c8','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','AEC9F46BA9EC76B5D4E4A7A61B8991FC','2019-12-20 22:43:41','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('7a943e09-c17d-46ec-b2a5-a1930b854773','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','E935092DCF674004778B3AA9B3A9549F','2019-12-20 22:51:12','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('7b3eecbf-5791-4b59-b975-0e1798d3beb4','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','3714EFBFE569DD611C6AD350A1E5BFE0','2019-12-29 16:45:51','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('7d660f1a-a5d2-434d-9928-0e714804570a','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','6B7C6151C7E404E8F69FE89339894F2B','2019-12-29 14:35:03','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('7dbf51ee-6bf9-4e7f-bbac-ee8cb4eee5ba','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','1EBE019C84812D6DC6B2899589D1AD89','2019-12-22 14:48:38','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('7f39d7cb-e735-47ab-8d40-5ef8faa62689','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','D6D6FE92D588FE06732DC0E8D55EC4C7','2019-12-28 21:40:46','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('801e1ee0-7b0a-4950-bd73-679a9c446e33','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','71AFC29AD089E300DC7F253C18A2BFB3','2019-12-15 21:01:07','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('834b1437-6663-4269-8536-c5c49fd976bf','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','7F7A461635630A1EDCE7E05E641C8785','2019-12-29 16:16:34','登陆',1,'子系统一','/loginSSO','yutu_web','c1f1a343-54d6-4ac1-ad51-7d7ece9a8922',NULL),('897e344b-8a85-4229-be45-3c325596269e','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','E663CACD643E4BC58B2A68FFEE396485','2019-12-28 22:11:51','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('898ebd41-8b89-47c1-bce6-fb8614112a68','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','1563F66D7DC62460021E43EC4A4CD290','2019-12-28 21:51:38','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('8b76186c-a4a6-40c4-861b-a25835eb5587','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','BD2F42AA1FD8A5A7A9184DCA594C0CDC','2019-12-29 10:22:20','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('8c8ca739-1a9c-45ef-aa20-6535e1877651','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','A031639B4B195C3A852317D6753A981E','2019-12-22 16:18:18','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('8cbfb759-9344-4015-8a54-c3ea88076eba','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','482A59AC6390F2F7422E0822C73ACEC2','2019-12-15 19:21:03','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('907c0a5f-19bb-4b5f-863e-d471acc1c6bf','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','C4A180F6B593514DD333B7F3313A3A3E','2019-12-29 10:57:54','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('9132d1bf-4096-43b6-9e1d-32d30951387b','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','6BCB4E05661517EC5B2FB20A6C1F044D','2019-12-29 16:46:17','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('91ac6cc2-66f3-4324-b7e6-253efc6a0ad4','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','48AB9037B22B3836A86914C77D8456BE','2019-12-29 15:04:53','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('939d6375-4c3e-4f65-9315-d2dc18c60842','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','DAA756D300003EAB2B8DFD72EF114B1F','2019-12-29 15:31:09','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('95f2cb8e-4f57-4669-ae9d-4c25cb2aa190','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','85308DB013E266F32DA9F18B75AE7331','2019-12-22 16:16:13','门户登陆',0,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('97011fed-511e-46d5-a1bf-04c775a09746','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','41072EA0748F2D860486CF8BB3D3F086','2019-12-29 10:19:16','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('98e15587-d652-4b93-887a-7b14a08a4355','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','784DE40EAA738C1E97260DEFE055455E','2019-12-29 16:50:25','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('997da7f6-1006-4940-b261-f717c9b6cac7','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','2223E0F55F93DCBA847F86819DE7A040','2019-12-29 15:31:01','门户登陆',0,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('99908f80-d003-4b7c-ae34-6a282331d4fd','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','CD0C3851B72BB92BA6F91D9ADBDDDEA6','2019-12-29 15:45:01','登陆',1,'子系统一','/loginSSO','yutu_web','6a0a24f0-a610-419f-861d-a075c31be0d5',NULL),('9ae0bde9-f36b-4689-850d-dfc28f7be719','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','D5EB1A90C004C329DA884DE516AD77B4','2019-12-22 10:50:29','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('9b1a251e-beab-45ba-a7d8-959ddcdca3dd','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','4D916CD9F86BE93B388F1FB7CB3CDC61','2019-12-28 22:35:13','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('9b8619f9-90dd-4863-b0d9-d6fc7909ff74','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','4B8C3FD9048AB7D6074085857363B80D','2019-12-29 16:16:33','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('9cd540ee-e68a-468c-8ea9-73b34b6e1138','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','1D322A4382FEBC9B09D8D5F8D4B6EFB5','2019-12-15 18:04:58','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('9cdf8987-92dc-4303-9893-5ba154491446','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','09D45DDAF23E6B37E8CDBDA0720CA512','2019-12-29 14:53:17','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('9f540ec2-ddc6-48c7-9912-2c6f83d31fdc','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','E4FDE412CFFAF69840D8CC3D3D3235E2','2019-12-15 19:28:41','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('9f6bd396-69be-4926-9ab2-9b321332f676','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','5495E0B851182B9106350AA696E500E2','2019-12-16 22:38:20','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('a28fe31b-d2bd-4cc1-b3b9-4b7cde2497a9','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','1640DF9A47CEFC3089CF2C67CA5A1351','2019-12-29 16:10:09','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('a322cfa6-7ae5-4d44-9e47-e3f2d8e818cc','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','0DE83D33022983A42BEAFFBBBA442E53','2019-12-22 10:56:26','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('a92b84e7-809e-4cce-a435-b477374a9951','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','4607F7A2F9477B67472B8BE84E8505EC','2019-12-20 23:05:58','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('a9920e56-bd66-43c8-920f-c800df54c95c','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','CB75D0A3A88D29BCE9EE2A026AEA1496','2019-12-29 14:51:39','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('aa43ef69-a5bf-44d1-bddb-947d8ce96ab7','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','33963F9BBB749DC8988C2E2DE0C4DF07','2019-12-29 10:58:24','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('aacaee78-16b7-469c-9cc6-ea81a8739de4','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','E4BDEAE6B5432DD8897A5D6304EB21A1','2019-12-22 11:04:24','门户登陆',0,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('ab4bc64a-a098-4bc9-a28b-3af179345532','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','F70639758F45021BC553AB60270C0E5F','2019-12-29 16:20:37','登陆',1,'子系统一','/loginSSO','yutu_web','f2f66839-b5f6-430f-b188-f2b6bf2ca890',NULL),('aba9741b-5c51-4203-9a26-d7579f7bc4af','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','21725DFB9E2E06CBE223FFDC130ABF85','2019-12-29 16:46:29','登陆',1,'子系统一','/loginSSO','yutu_web','78b5c279-ffad-472e-92c1-75e51afa6f05',NULL),('ac01a3b5-b3eb-49a5-b9ab-8cc677227439','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','BFA0FBF52FFE7283C5970445FC5A6047','2019-12-29 16:08:56','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('ae38732b-0baa-42a8-b852-d91ef29a71f6','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','6989C4B63CFA15417BA820EA704BFB75','2019-12-29 14:32:10','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('b0dc3671-ca94-4783-9297-2e39b0a999d1','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','CDFF81CE8D33E4448F3F0302AC519A5E','2019-12-22 10:57:53','门户登陆',0,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('b1f7bed0-119a-4ffc-990b-b1d7106c3f3c','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','B90552FB616F3A6FFDD3A65D511A70B1','2019-12-22 09:13:28','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('b37e7f5a-3faa-481c-8dec-f0a8cc6be9cc',NULL,NULL,'0:0:0:0:0:0:0:1',NULL,'2019-12-20 22:36:49','门户登陆',NULL,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('b46d918d-c394-4571-a13d-12439bb7a3fe','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','4AC95E6E9CD124952F6D825CD2C45558','2019-12-15 21:46:17','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('b6a4af38-ec36-4806-b5e8-4ed30940bcd1','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','4104B8488AC68A7561BA5278306AB733','2019-12-29 16:42:12','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('b7c2ff58-19e0-4f12-a352-ffb6771684ed','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','B0152592DB3D328C3D2321525E9B28DB','2019-12-22 14:54:05','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('b80c27a8-dabe-496e-87c0-a79fbf1b3c2d','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','82886CFC681F13E009DB2A1845F30283','2019-12-29 16:45:53','登陆',1,'子系统一','/loginSSO','yutu_web','87742fd0-8bb2-4dce-a9be-f083b7e7fa66',NULL),('b8c2d635-576d-42f5-8880-841868dbeee1','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','CBAAF27FF445BB16CC791377F5E0AB9A','2019-12-29 12:06:15','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('ba4eb03e-bb9c-45b0-9279-dd026735f7c8','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','655245D8E39EF0924FE94D99512C1D65','2019-12-29 16:11:21','登陆',1,'子系统一','/loginSSO','yutu_web','2e1861c6-74ba-4721-8eae-57d308de3094',NULL),('bc2e89c8-b826-4bae-95fa-ea078e360fcb','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','97174B567206BAC105E34AFE5BE71570','2019-12-22 11:21:41','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('bcab32a0-38ea-4552-a91b-a623aa075431','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','C91B097239E6F7B4948265380A618EDF','2019-12-29 11:31:03','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('bf621cc3-a842-46a8-88b9-93ee4921c25e','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','12716F9FE74D3DA2C4D82B724273DFE6','2019-12-28 22:05:29','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('c1a8abcb-88ee-4372-adce-6b759a70aa1d','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','4B9C634254FD67B17061309E4DC6B63E','2019-12-29 16:44:37','登陆',1,'子系统一','/loginSSO','yutu_web','a58d91ac-2734-4bd9-8674-bc733738517e',NULL),('c252e2c8-7460-4f17-812e-b2cee62265b0','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','4DDD31EF5A666A73809B0B0C3A9EF035','2019-12-20 22:54:29','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('c329f5a3-2dd9-49d3-a741-16601e153650','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','750B789B90604F5320B148BCF02FD224','2019-12-29 14:13:55','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('c3ab3bda-f7f3-4798-b8b9-5b784613788b',NULL,'admin','0:0:0:0:0:0:0:1',NULL,'2019-12-15 18:04:54','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('cd0658e2-9d69-4f63-935b-14347bfbdbe4','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','0FE498EC2D4410B3E8BEFEADD9B1C4E7','2019-12-22 10:49:11','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('cd2430ed-2173-476b-b229-9b7bbe07431b','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','4C01E74764F097AF7880B9F0927468A7','2019-12-28 22:28:34','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('cf87ae1c-2da1-4e29-b01e-f05e2e750567','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','C9F9A41720B1718D331DD7391E9528BA','2019-12-22 11:28:37','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('d0b524a8-f568-4cd0-a9b1-57d8ede0e649','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','0FE498EC2D4410B3E8BEFEADD9B1C4E7','2019-12-22 10:48:09','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('d121620f-0e52-4f1c-ab5e-04b3416bae62','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','CE943DD75D115C44E3F86CE547CB529C','2019-12-29 15:24:55','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('d14a28f2-6d7c-4632-948d-b6495f8e9c05','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','51A268F053BEB77E629268D99D2A756F','2019-12-29 16:11:45','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('d313ff54-38f4-42bb-a9cd-805f934afb0c','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','891081DE8F3EAA57D5BA2FBDDB31AFB0','2019-12-29 16:49:59','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('d36c0fcc-746d-4d6e-b454-880dd22a5516','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','649244B7DB95710BF64560F9BF0F6399','2019-12-29 16:54:16','登陆',1,'子系统一','/loginSSO','yutu_web','300b2506-0baf-4870-ba88-b22bbc1c2652',NULL),('d60eb2c0-eaa2-423b-89c3-7b06a06f787e','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','5DE241E1FC266830CC7F094BF8DE3E15','2019-12-29 14:39:31','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('d902e028-bc66-4b37-8cd8-baafd0f0ba69','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','8CF606BA7E53E6DCC4E6085DDA1C5105','2019-12-22 14:57:20','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('dadfca4d-9cd9-4464-95dc-90b5ede196ea','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','B57A6383FCC9DE13787A14DD54E97C26','2019-12-26 22:19:36','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('db6fffaa-345d-4bd9-b9aa-59b5a2edbfca','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','965089B84FBB851DEF609F902349F6FC','2019-12-18 22:20:34','用户登陆',0,NULL,'/login/getLoginVerification',NULL,NULL,NULL),('df24538c-be82-4c7f-8a09-dd54f6592d73','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','929052AAE70543C399018661D8DF9C8D','2019-12-29 10:28:06','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('df2fec6a-53a3-4742-8a2e-d4f62b8e7896','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','0FE5308A42BA4293EDD21D829CA48386','2019-12-29 10:16:52','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('dfb1f0c0-2d36-475d-87ab-b8359fa5c814','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','E51FE2C4EEA22CA234D288E4DFF697B0','2019-12-29 14:46:31','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('e0042ac5-485f-472d-b480-d63cdf6e2b4a','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','E98FDEC2E2091A2A81F88E552060A91B','2019-12-29 11:07:45','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('e2aff858-abbc-454a-b662-1f28bb15974a','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','68C3E0A97A2300D0386B3C2FEFA84DB2','2019-12-22 17:31:19','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('e3613b82-2f6c-4bef-b892-f9bce53cccf6','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','127.0.0.1','2223E0F55F93DCBA847F86819DE7A040','2019-12-29 15:30:56','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('e4f361cf-4cad-4e50-8561-bab4d9e0bd82','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','ABB628B87EF262947E5679D45838DA30','2019-12-28 22:26:06','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('e55971c3-c0ff-4ce8-acfa-5f187749a27e','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','E0A886C676AA17E4FB64A58825621E80','2019-12-29 16:42:14','登陆',1,'子系统一','/loginSSO','yutu_web','5898d7d1-53d8-429e-9f70-e28b513c0484',NULL),('ea01ec09-d853-427e-b4a1-fa2486d23168','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','2D27D12B4C4F96C57971EC8E41843D16','2019-12-29 16:41:17','登陆',1,'子系统一','/loginSSO','yutu_web','1a1020c8-cc5d-4fb9-bc97-fff9c6f9d6cd',NULL),('ea627187-ea9e-4c86-95ee-39204057f614','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','BF515B613FC71C7B29D67606F15305F2','2019-12-29 15:01:41','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('edc8023d-b4a0-4232-911c-1bc0be14b4ce','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','39CA7AA13A34A320CC2E8E6580B17024','2019-12-22 17:39:25','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('f451b87b-4063-4c94-a813-615404b80e78','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','C1034BA57F07E1997484075DC50D1349','2019-12-22 10:41:08','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('f47a9142-d67b-4054-84d3-a3b3201d0cf7','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','788072749DBF0BCB5823A776AB28304E','2019-12-29 16:54:03','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('f578bcaf-5baa-48b6-a202-49e412d8dc96','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','0B9BE774D27CFBF98A3830A5217DEA04','2019-12-29 11:31:48','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('f7490fe2-4925-4119-b746-a52d81499943','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','127.0.0.1','0DAC4EF876CDDC31B08206B67F534F6A','2019-12-29 16:49:49','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('f80a7c7e-f9af-4632-9b6d-2653045d7613','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','F69A8675A73F95C58B28E6CC32A29218','2019-12-22 17:54:13','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('f8f6f007-37e3-4384-842b-5be7f14b5107','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','94D0F9BECD1F65D3F97EEFA7B3BC5589','2019-12-29 10:36:35','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('fab45b39-e187-4007-9f36-815a4d2c01c5','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','F61A731FC50D41A2E1CED3ABEEFE2FD1','2019-12-22 11:29:35','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('ff8a068e-c6f9-496a-8995-c96f29232f75','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','56C1DB63979BA5D8B5624CFC2C92A09B','2019-12-26 22:28:12','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL),('fff4806d-641e-4251-a729-f7c6dcc2609b','ae771cf1-23f0-4e8e-b235-fc12a6fb4884','admin','0:0:0:0:0:0:0:1','2EECDB867D24EC2A1EB23C14C94DA0AD','2019-12-29 14:07:08','门户登陆',1,'系统门户网站','/login/getLoginVerification',NULL,NULL,NULL);

/*Table structure for table `t_log_operation` */

DROP TABLE IF EXISTS `t_log_operation`;

CREATE TABLE `t_log_operation` (
  `uuid` varchar(64) NOT NULL COMMENT '编码',
  `operate_db` varchar(64) DEFAULT NULL COMMENT '操作数据库',
  `operate_dt` varchar(64) DEFAULT NULL COMMENT '操作表',
  `operate_type` varchar(64) DEFAULT NULL COMMENT '操作类型   增删改',
  `operate_primarykey` varchar(2048) DEFAULT NULL COMMENT '主键',
  `operate_content` text COMMENT '操作内容',
  `operate_person` varchar(64) DEFAULT NULL COMMENT '操作人',
  `operate_datetime` datetime DEFAULT NULL COMMENT '操作时间',
  `log_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志类型',
  `appkey` varchar(128) DEFAULT NULL COMMENT 'appkey',
  `token` varchar(128) DEFAULT NULL COMMENT 'token',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日志管理_数据操作表';

/*Data for the table `t_log_operation` */

/*Table structure for table `t_menu_business` */

DROP TABLE IF EXISTS `t_menu_business`;

CREATE TABLE `t_menu_business` (
  `uuid` varchar(64) NOT NULL COMMENT '编码',
  `menu_parent` varchar(64) DEFAULT NULL COMMENT '菜单父类id',
  `menu_title` varchar(64) DEFAULT NULL COMMENT '菜单名称',
  `menu_type` int(11) DEFAULT '2' COMMENT '菜单类型：1.外部sso弹出  2.内部跳转',
  `menu_url` varchar(512) DEFAULT NULL COMMENT '菜单url地址',
  `menu_page_class` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '页面中的class，为了调整配置样式',
  `menu_page_img` varchar(512) DEFAULT NULL COMMENT '页面中的图标地址',
  `menu_page_other` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '页面中其他的属性值',
  `menu_status` int(11) DEFAULT '0' COMMENT '菜单状态  0：未锁定  1：已锁定',
  `order_by` int(11) DEFAULT '1' COMMENT '排序',
  `delete_status` int(11) DEFAULT '0' COMMENT '用户逻辑删除  0 ：正常   1：删除',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单管理_业务菜单';

/*Data for the table `t_menu_business` */

insert  into `t_menu_business`(`uuid`,`menu_parent`,`menu_title`,`menu_type`,`menu_url`,`menu_page_class`,`menu_page_img`,`menu_page_other`,`menu_status`,`order_by`,`delete_status`,`remarks`) values ('bc912616-2a0f-11ea-bde7-f875a40f96a2','0','测试一',2,NULL,NULL,NULL,NULL,0,1,0,NULL),('d4453d3c-2a0f-11ea-bde7-f875a40f96a2','0','测试二',2,NULL,NULL,NULL,NULL,0,1,0,NULL),('df9e3073-2a0f-11ea-bde7-f875a40f96a2','0','测试三',2,NULL,NULL,NULL,NULL,0,1,0,NULL),('ea452e22-2a0f-11ea-bde7-f875a40f96a2','0','测试四',2,NULL,NULL,NULL,NULL,0,1,0,NULL),('f2176a8f-2a0f-11ea-bde7-f875a40f96a2','0','测试五',2,NULL,NULL,NULL,NULL,0,1,0,NULL);

/*Table structure for table `t_menu_system` */

DROP TABLE IF EXISTS `t_menu_system`;

CREATE TABLE `t_menu_system` (
  `uuid` varchar(64) NOT NULL COMMENT '编码',
  `menu_title` varchar(512) DEFAULT NULL COMMENT '菜单名称',
  `menu_type` int(11) DEFAULT '1' COMMENT '菜单类型：1.外部sso弹出  2.内部跳转',
  `menu_url` varchar(512) DEFAULT NULL COMMENT '菜单url地址',
  `menu_page_class` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '页面中的class，为了调整配置样式',
  `menu_page_other` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '页面中其他的属性值',
  `order_by` int(11) DEFAULT '1' COMMENT '排序',
  `delete_status` int(11) DEFAULT '0' COMMENT '用户逻辑删除  0 ：正常   1：删除',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单管理_门户子系统';

/*Data for the table `t_menu_system` */

insert  into `t_menu_system`(`uuid`,`menu_title`,`menu_type`,`menu_url`,`menu_page_class`,`menu_page_other`,`order_by`,`delete_status`,`remarks`) values ('0c0fced6-1f12-11ea-a564-f875a40f96a2','案例展示',1,'http://localhost:8096/loginSSO',NULL,NULL,1,0,NULL),('ac4784b7-1f12-11ea-a564-f875a40f96a2','运算服务',1,'http://localhost:8097/loginSSO',NULL,NULL,2,0,NULL),('d385da86-1f12-11ea-a564-f875a40f96a2','数据服务',1,'http://localhost:8098/loginSSO',NULL,NULL,3,0,NULL);

/*Table structure for table `t_sys_organization` */

DROP TABLE IF EXISTS `t_sys_organization`;

CREATE TABLE `t_sys_organization` (
  `uuid` varchar(64) NOT NULL COMMENT '编码',
  `org_parent` varchar(64) DEFAULT NULL COMMENT '部门父类id(表格树)',
  `org_code` varchar(64) DEFAULT NULL COMMENT '部门特殊编码',
  `org_name` varchar(512) DEFAULT NULL COMMENT '部门名称',
  `org_phone` varchar(64) DEFAULT NULL COMMENT '部门电话',
  `org_address` varchar(2048) DEFAULT NULL COMMENT '部门地址',
  `org_Manager` varchar(64) DEFAULT NULL COMMENT '部门负责人',
  `org_status` int(11) DEFAULT '0' COMMENT '部门状态 0：未锁定  1：已锁定',
  `order_by` int(11) DEFAULT '1' COMMENT '排序',
  `delete_status` int(11) DEFAULT '0' COMMENT '逻辑删除 0:未删除,  1:已删除',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统_组织表';

/*Data for the table `t_sys_organization` */

insert  into `t_sys_organization`(`uuid`,`org_parent`,`org_code`,`org_name`,`org_phone`,`org_address`,`org_Manager`,`org_status`,`order_by`,`delete_status`,`remarks`) values ('8fc09900-1f11-11ea-a564-f875a40f96a2','0','yutu','宇图',NULL,NULL,NULL,0,1,0,NULL);

/*Table structure for table `t_sys_role` */

DROP TABLE IF EXISTS `t_sys_role`;

CREATE TABLE `t_sys_role` (
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编码',
  `role_parent` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色父类ID（角色树）',
  `role_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色名称',
  `role_status` int(11) DEFAULT '0' COMMENT '角色状态 0：未锁定  1：已锁定',
  `order_by` int(11) DEFAULT '1' COMMENT '排序',
  `delete_status` int(11) DEFAULT '0' COMMENT '用户逻辑删除  0 ：正常   1：删除',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统_权限表';

/*Data for the table `t_sys_role` */

insert  into `t_sys_role`(`uuid`,`role_parent`,`role_name`,`role_status`,`order_by`,`delete_status`,`remarks`) values ('b5aa892c-1f11-11ea-a564-f875a40f96a2','0','管理员',0,1,0,NULL);

/*Table structure for table `t_sys_role_menubus` */

DROP TABLE IF EXISTS `t_sys_role_menubus`;

CREATE TABLE `t_sys_role_menubus` (
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编码',
  `role_uuid` varchar(64) DEFAULT NULL COMMENT '角色uuid',
  `menubus_uuid` varchar(64) DEFAULT NULL COMMENT '业务菜单uuid',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统_角色和业务菜单中间表';

/*Data for the table `t_sys_role_menubus` */

insert  into `t_sys_role_menubus`(`uuid`,`role_uuid`,`menubus_uuid`,`remarks`) values ('1','b5aa892c-1f11-11ea-a564-f875a40f96a2','bc912616-2a0f-11ea-bde7-f875a40f96a2',NULL),('2','b5aa892c-1f11-11ea-a564-f875a40f96a2','d4453d3c-2a0f-11ea-bde7-f875a40f96a2',NULL),('3','b5aa892c-1f11-11ea-a564-f875a40f96a2','df9e3073-2a0f-11ea-bde7-f875a40f96a2',NULL),('4','b5aa892c-1f11-11ea-a564-f875a40f96a2','ea452e22-2a0f-11ea-bde7-f875a40f96a2',NULL),('5','b5aa892c-1f11-11ea-a564-f875a40f96a2','f2176a8f-2a0f-11ea-bde7-f875a40f96a2',NULL);

/*Table structure for table `t_sys_role_menusys` */

DROP TABLE IF EXISTS `t_sys_role_menusys`;

CREATE TABLE `t_sys_role_menusys` (
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编码',
  `role_uuid` varchar(64) DEFAULT NULL COMMENT '角色uuid',
  `menusys_uuid` varchar(64) DEFAULT NULL COMMENT '系统菜单uuid',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统_角色和系统菜单中间表';

/*Data for the table `t_sys_role_menusys` */

insert  into `t_sys_role_menusys`(`uuid`,`role_uuid`,`menusys_uuid`,`remarks`) values ('083137d8-1f13-11ea-a564-f875a40f96a2','b5aa892c-1f11-11ea-a564-f875a40f96a2','ac4784b7-1f12-11ea-a564-f875a40f96a2',NULL),('10ea09d5-1f13-11ea-a564-f875a40f96a2','b5aa892c-1f11-11ea-a564-f875a40f96a2','d385da86-1f12-11ea-a564-f875a40f96a2',NULL),('f36e6886-1f12-11ea-a564-f875a40f96a2','b5aa892c-1f11-11ea-a564-f875a40f96a2','0c0fced6-1f12-11ea-a564-f875a40f96a2',NULL);

/*Table structure for table `t_sys_user` */

DROP TABLE IF EXISTS `t_sys_user`;

CREATE TABLE `t_sys_user` (
  `uuid` varchar(64) NOT NULL COMMENT '主键',
  `user_code` varchar(64) DEFAULT NULL COMMENT '用户特殊编码',
  `user_account` varchar(128) DEFAULT NULL COMMENT '用户登陆名',
  `user_pwd` varchar(64) DEFAULT NULL COMMENT '用户密码',
  `user_question` varchar(256) DEFAULT NULL COMMENT '密码提示',
  `user_name` varchar(256) DEFAULT NULL COMMENT '用户真实姓名',
  `user_sex` int(11) DEFAULT NULL COMMENT '用户性别  0：保密   1：男   2：女''',
  `user_title` varchar(256) DEFAULT NULL COMMENT '用户职称',
  `user_phone` varchar(64) DEFAULT NULL COMMENT '手机号',
  `user_email` varchar(256) DEFAULT NULL COMMENT '用户邮件',
  `user_status` int(11) DEFAULT '0' COMMENT '用户锁定  0：正常   1：锁定',
  `order_by` int(11) DEFAULT '1' COMMENT '排序',
  `delete_status` int(11) DEFAULT '0' COMMENT '用户逻辑删除  0 ：正常   1：删除',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

/*Data for the table `t_sys_user` */

insert  into `t_sys_user`(`uuid`,`user_code`,`user_account`,`user_pwd`,`user_question`,`user_name`,`user_sex`,`user_title`,`user_phone`,`user_email`,`user_status`,`order_by`,`delete_status`,`remarks`) values ('ae771cf1-23f0-4e8e-b235-fc12a6fb4884','yt-001','admin','1168d53c7f5094945a60aa6d2320e7c4','admin','管理员',1,NULL,'18001030020','it_zbc@outlook.com',0,1,0,NULL);

/*Table structure for table `t_sys_user_organization` */

DROP TABLE IF EXISTS `t_sys_user_organization`;

CREATE TABLE `t_sys_user_organization` (
  `uuid` varchar(64) NOT NULL COMMENT '编码',
  `org_uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '部门uuid',
  `user_uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户uuid',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统_用户部门中间表';

/*Data for the table `t_sys_user_organization` */

insert  into `t_sys_user_organization`(`uuid`,`org_uuid`,`user_uuid`,`remarks`) values ('cde1e742-1f11-11ea-a564-f875a40f96a2','f875a40f96a2','ae771cf1-23f0-4e8e-b235-fc12a6fb4884',NULL);

/*Table structure for table `t_sys_user_role` */

DROP TABLE IF EXISTS `t_sys_user_role`;

CREATE TABLE `t_sys_user_role` (
  `uuid` varchar(64) NOT NULL COMMENT '编码',
  `role_uuid` varchar(64) DEFAULT NULL COMMENT '角色uuid',
  `user_uuid` varchar(64) DEFAULT NULL COMMENT '用户uuid',
  `remarks` text COMMENT '备注',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统_用户角色表';

/*Data for the table `t_sys_user_role` */

insert  into `t_sys_user_role`(`uuid`,`role_uuid`,`user_uuid`,`remarks`) values ('e3fb4794-1f11-11ea-a564-f875a40f96a2','b5aa892c-1f11-11ea-a564-f875a40f96a2','ae771cf1-23f0-4e8e-b235-fc12a6fb4884',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
