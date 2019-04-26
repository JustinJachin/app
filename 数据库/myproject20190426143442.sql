-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: myproject
-- ------------------------------------------------------
-- Server version	5.5.53

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `my_address`
--

DROP TABLE IF EXISTS `my_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `defaultadd` tinyint(1) NOT NULL DEFAULT '0' COMMENT '当为1为默认地址，0为非默认地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_address`
--

LOCK TABLES `my_address` WRITE;
/*!40000 ALTER TABLE `my_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_admin`
--

DROP TABLE IF EXISTS `my_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(20) NOT NULL COMMENT '管理员名称',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `creattime` int(12) NOT NULL COMMENT '创建时间',
  `role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为超级管理员0为管理员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_admin`
--

LOCK TABLES `my_admin` WRITE;
/*!40000 ALTER TABLE `my_admin` DISABLE KEYS */;
INSERT INTO `my_admin` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',1521092017,1),(2,'jachin','25d55ad283aa400af464c76d713c07ad',1521103941,0),(10,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(11,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(12,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(13,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(14,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(15,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(16,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(17,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(18,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(19,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(20,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0),(21,'jachin','25d55ad283aa400af464c76d713c07ad',1523427958,0);
/*!40000 ALTER TABLE `my_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_deal`
--

DROP TABLE IF EXISTS `my_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `oid` int(11) NOT NULL COMMENT '订单号',
  `money` double NOT NULL COMMENT '押金',
  `deduct` double NOT NULL COMMENT '提成',
  `income` double NOT NULL COMMENT '收入',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='交易表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_deal`
--

LOCK TABLES `my_deal` WRITE;
/*!40000 ALTER TABLE `my_deal` DISABLE KEYS */;
INSERT INTO `my_deal` VALUES (13,167,10.4,8.32,2.08),(14,168,25.2,20.16,5.04),(15,169,25.2,20.16,5.04),(16,170,25.2,20.16,5.04),(17,171,25.2,20.16,5.04),(19,173,34,27.200000000000003,6.800000000000001),(18,172,230.7,184.56,46.14),(20,174,47.2,37.760000000000005,9.440000000000001),(21,175,92.2,73.76,18.44),(22,176,31.5,25.200000000000003,6.300000000000001),(23,177,291.2,232.96,58.24),(24,178,59.7,47.760000000000005,11.940000000000001);
/*!40000 ALTER TABLE `my_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_evaluate`
--

DROP TABLE IF EXISTS `my_evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `score` double NOT NULL DEFAULT '5' COMMENT '分数',
  `appraise` varchar(255) NOT NULL COMMENT '评价',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_evaluate`
--

LOCK TABLES `my_evaluate` WRITE;
/*!40000 ALTER TABLE `my_evaluate` DISABLE KEYS */;
INSERT INTO `my_evaluate` VALUES (1,35,4.8,'ok'),(2,36,4.6,'ok'),(3,37,4.8,'ok'),(4,38,4.6,'ok'),(5,39,4.5,'ok'),(6,40,5,'ok'),(7,41,4.8,'ok'),(8,42,4.5,'ok');
/*!40000 ALTER TABLE `my_evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_indent`
--

DROP TABLE IF EXISTS `my_indent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_indent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creat_time` int(12) NOT NULL COMMENT '创建时间',
  `merchant_id` int(11) NOT NULL COMMENT '商家ID',
  `start` varchar(255) NOT NULL COMMENT '起始地',
  `bourn` varchar(255) NOT NULL COMMENT '目的地',
  `delivery_distance` double NOT NULL COMMENT '配送距离',
  `consignee` varchar(50) NOT NULL COMMENT '收货人',
  `consignee_phone` varchar(11) NOT NULL COMMENT '收获人联系方式',
  `cash` double NOT NULL COMMENT '押金',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未接单1未配送2进行中 3未评价 4已完成  5订单异常',
  `delivery_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送员ID',
  `finish_time` int(12) DEFAULT NULL COMMENT '完成时间',
  `merchant_appraise` varchar(255) DEFAULT NULL COMMENT '商家评价',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `orderNote` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `orderclass` tinyint(4) NOT NULL COMMENT '0表示帮我取，1表示帮我买，2表示帮我送，3表示帮我排队，4表示跑腿帮办，5表示自定义',
  `actuals` varchar(100) NOT NULL COMMENT '实际物品',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_indent`
--

LOCK TABLES `my_indent` WRITE;
/*!40000 ALTER TABLE `my_indent` DISABLE KEYS */;
INSERT INTO `my_indent` VALUES (25,1523856010,55,'杭州市下城区富春路','杭州市西湖区教工路',2000,'吴三','15678964562',19,2,46,1523942410,NULL,'杭州市','衣服',3,'衣服'),(1,1523337610,10,'杭州市滨江区滨河路','杭州市上城区解放路',10000,'赵三','15789064452',28.5,1,3,NULL,NULL,'杭州市','衣服',2,'衣服'),(2,1523337610,36,'杭州市滨江区滨盛路','杭州市上城区富春路',1000,'赵四','15789064452',22,1,11,NULL,NULL,'杭州市','衣服',2,'衣服'),(3,1523942410,55,'杭州市滨江区滨河路','杭州市上城区新业路',1000,'赵六','15789064452',22,1,11,NULL,NULL,'杭州市','衣服',2,'衣服'),(4,1523942410,56,'杭州市滨江区滨河路','杭州市西湖区黄龙路',1000,'赵七','15789064452',22,1,11,NULL,NULL,'杭州市','食物',1,'食物'),(5,1523942410,56,'杭州市滨江区滨河路','杭州市西湖区黄龙路',1000,'赵七','15789064452',22,1,11,NULL,NULL,'杭州市','食物',1,'食物'),(7,1523942410,56,'杭州市滨江区滨河路','杭州市西湖区黄龙路',1000,'赵七','15789064452',22,1,11,NULL,NULL,'杭州市','食物',1,'食物'),(8,1523942410,56,'杭州市滨江区滨河路','杭州市西湖区黄龙路',1000,'赵七','15789064452',22,1,11,NULL,NULL,'杭州市','食物',0,'食物'),(9,1523942410,56,'杭州市滨江区滨河路','杭州市西湖区黄龙路',1000,'赵七','15789064452',22,1,11,NULL,NULL,'杭州市','食物',0,'食物'),(31,1523856010,56,'杭州市滨江滨盛路','杭州市滨江滨河路',2000,'方毅','15678964562',19,3,46,1523942410,NULL,'杭州市','衣服',1,'衣服'),(30,1523856010,56,'杭州市滨江滨盛路','杭州市滨江滨河路',2000,'方毅','15678964562',19,3,46,1523942410,NULL,'杭州市','衣服',0,'衣服'),(29,1523856010,10,'杭州市滨江滨盛路','杭州市滨江滨河路',2000,'方毅','15678964562',19,3,11,1523942410,NULL,'杭州市','衣服',0,'衣服'),(28,1523856010,55,'杭州市下城区富春路','杭州市滨江滨河路',2000,'吴四','15678964562',19,2,46,1523942410,NULL,'杭州市','衣服',4,'衣服'),(27,1523856010,55,'杭州市下城区富春路','杭州市滨江滨河路',2000,'吴四','15678964562',19,2,46,1523942410,NULL,'杭州市','衣服',4,'衣服'),(26,1523856010,55,'杭州市下城区富春路','杭州市滨江滨河路',2000,'吴四','15678964562',19,2,46,1523942410,NULL,'杭州市','衣服',4,'衣服'),(23,1523856010,55,'杭州市下城区钱江路','杭州市西湖区文二路',2000,'吴一','15678964562',19,2,46,1523942410,NULL,'杭州市','衣服',1,'衣服'),(21,1523856010,10,'杭州市滨江区滨兴路','杭州市西湖区文一路',2000,'吴毅','15678964562',19,2,11,1523942410,NULL,'杭州市','食物',0,'食物'),(22,1523856010,55,'杭州市滨江区滨盛路','杭州市西湖区文二路',2000,'吴一','15678964562',19,2,45,1523942410,NULL,'杭州市','食物',1,'食物'),(18,1523856010,56,'杭州市滨江区滨盛路','杭州市西湖区文三路',2000,'王三','15678964562',27,1,47,NULL,NULL,'杭州市','食物',2,'食物'),(19,1523856010,56,'杭州市滨江区滨和路','杭州市西湖区文三路',2000,'王三','15678964562',27,1,47,NULL,NULL,'杭州市','食物',3,'食物'),(20,1523856010,55,'杭州市滨江区滨兴路','杭州市西湖区文三路',2000,'王三','15678964562',27,1,45,NULL,NULL,'杭州市','食物',4,'食物'),(13,1523856010,10,'杭州市西湖区文三路','杭州市西湖区文一路',2000,'王毅','15678964562',27,1,11,NULL,NULL,'杭州市','食物',0,'食物'),(14,1523856010,54,'杭州市西湖区文二路','杭州市西湖区文一路',2000,'王一','15678964562',27,1,43,NULL,NULL,'杭州市','食物',0,'食物'),(15,1523856010,55,'杭州市滨江区滨盛路','杭州市西湖区文一路',2000,'王二','15678964562',27,1,44,NULL,NULL,'杭州市','食物',1,'食物'),(16,1523856010,55,'杭州市滨江区滨盛路','杭州市西湖区文一路',2000,'王二','15678964562',27,1,44,NULL,NULL,'杭州市','食物',1,'食物'),(17,1523856010,56,'杭州市滨江区滨盛路','杭州市西湖区文三路',2000,'王三','15678964562',27,1,47,NULL,NULL,'杭州市','食物',2,'食物'),(10,1523942410,56,'杭州市西湖区文三路','杭州市西湖区黄龙路',1000,'赵七','15789064452',22,1,11,NULL,NULL,'杭州市','食物',0,'食物'),(11,1523942410,56,'杭州市西湖区文三路','杭州市西湖区教工路',1000,'赵七','15789064452',22,1,47,NULL,NULL,'杭州市','食物',3,'食物'),(12,1523942410,54,'杭州市西湖区文三路','杭州市西湖区教工路',1000,'赵七','15789064452',22,0,0,NULL,NULL,'杭州市','食物',3,'食物'),(178,1525450246,10,'西湖区','江干区',23.9,'','17858662140',59.7,1,11,NULL,NULL,'杭州市','',0,''),(44,1523856010,52,'杭州市西湖区教工路','杭州市上萧山区翔飞路',2000,'杨毅','15678964562',50,5,47,1523942410,NULL,'杭州市','衣服',0,'衣服'),(43,1523856010,10,'杭州市西湖区教工路','杭州市上萧山区翔飞路',2000,'杨毅','15678964562',50,5,11,1523942410,NULL,'杭州市','衣服',0,'衣服'),(42,1523856010,52,'杭州市滨江滨和路','杭州市上城区钱江路',2000,'何毅','15678964562',20,4,43,1523942410,NULL,'杭州市','衣服',4,'衣服'),(41,1523856010,52,'杭州市滨江滨和路','杭州市上城区钱江路',2000,'何毅','15678964562',20,4,43,1523942410,NULL,'杭州市','衣服',0,'衣服'),(39,1523856010,52,'杭州市滨江滨和路','杭州市上城区钱江路',2000,'何毅','15678964562',20,4,43,1523942410,NULL,'杭州市','衣服',3,'衣服'),(40,1523856010,52,'杭州市滨江滨和路','杭州市上城区钱江路',2000,'何毅','15678964562',20,4,43,1523942410,NULL,'杭州市','衣服',2,'衣服'),(38,1523856010,52,'杭州市滨江滨和路','杭州市上城区钱江路',2000,'何毅','15678964562',20,4,43,1523942410,NULL,'杭州市','衣服',1,'衣服'),(37,1523856010,52,'杭州市滨江滨和路','杭州市上城区钱江路',2000,'何毅','15678964562',20,4,43,1523942410,NULL,'杭州市','衣服',1,'衣服'),(36,1523856010,52,'杭州市滨江滨和路','杭州市上城区钱江路',2000,'何毅','15678964562',20,4,43,1523942410,NULL,'杭州市','衣服',1,'衣服'),(35,1523856010,10,'杭州市滨江滨和路','杭州市上城区钱江路',2000,'何毅','15678964562',20,4,11,1523942410,NULL,'杭州市','衣服',1,'衣服'),(34,1523856010,56,'杭州市滨江滨盛路','杭州市滨江滨河路',2000,'方毅','15678964562',19,3,46,1523942410,NULL,'杭州市','衣服',2,'衣服'),(32,1523856010,56,'杭州市滨江滨盛路','杭州市滨江滨河路',2000,'方毅','15678964562',19,3,46,1523942410,NULL,'杭州市','衣服',2,'衣服'),(33,1523856010,56,'杭州市滨江滨盛路','杭州市滨江滨河路',2000,'方毅','15678964562',19,3,46,1523942410,NULL,'杭州市','衣服',2,'衣服'),(174,1525389375,10,'萧山区','滨江区',18.9,'','17811111111',47.2,1,11,NULL,NULL,'杭州市','',0,''),(175,1525441705,10,'西湖区','富阳区',36.9,'','17858662140',92.2,1,11,NULL,NULL,'杭州市','新鲜的苹果',0,''),(176,1525443743,10,'上城区','拱墅区',12.6,'','17858662140',31.5,1,11,NULL,NULL,'杭州市','买一包烟',0,''),(171,1525363066,10,'西湖区','滨江区',10.1,'','17858661747',25.2,1,11,NULL,NULL,'杭州市','尽快送达',0,''),(172,1525365228,10,'临安市','江干区',92.3,'','17858661747',230.7,1,11,NULL,NULL,'杭州市','尽快送达',0,''),(173,1525387609,10,'滨江区','下城区',13.6,'','17858661999',34,1,11,NULL,NULL,'杭州市','一点点',2,''),(170,1525359011,10,'西湖区','滨江区',10.1,'','17858662140',25.2,1,3,NULL,NULL,'杭州市','',0,''),(169,1525352379,10,'滨江区','西湖区',10.1,'','17858662140',25.2,1,11,NULL,NULL,'杭州市','',2,''),(168,1525352184,10,'滨江区','西湖区',10.1,'','17858663441',25.2,1,11,NULL,NULL,'杭州市','',0,''),(167,1525350953,10,'西湖区','西湖区',0,'武松','17858662140',10.4,5,0,NULL,NULL,'杭州市','排队',1,''),(48,1523856010,52,'杭州市西湖区文三路','杭州市西湖区黄龙路',2000,'杨毅','15678964562',50,5,47,1523942410,NULL,'杭州市','衣服',0,'衣服'),(47,1523856010,52,'杭州市余杭区世纪大道西路','杭州市西湖区黄龙路',2000,'杨毅','15678964562',50,5,47,1523942410,NULL,'杭州市','衣服',0,'衣服'),(45,1523856010,52,'杭州市下城区朝辉路','杭州市上萧山区翔飞路',2000,'杨毅','15678964562',50,5,47,1523942410,NULL,'杭州市','衣服',0,'衣服'),(46,1523856010,52,'杭州市余杭区世纪大道西路','杭州市上萧山区翔飞路',2000,'杨毅','15678964562',50,5,47,1523942410,NULL,'杭州市','衣服',1,'衣服'),(177,1525448898,10,'余杭区','建德市',116.5,'','17858662140',291.2,1,47,NULL,NULL,'杭州市','新鲜的香蕉',0,''),(24,1523856010,55,'杭州市下城区富春路','杭州市西湖区教工路',2000,'吴二','15678964562',19,2,46,1523942410,NULL,'杭州市','衣服',2,'衣服');
/*!40000 ALTER TABLE `my_indent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_user`
--

DROP TABLE IF EXISTS `my_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '用户名 ',
  `password` varchar(32) NOT NULL COMMENT ' 密码',
  `sex` tinyint(4) NOT NULL DEFAULT '1' COMMENT '性别 1表示男，0表示女',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `power` tinyint(4) NOT NULL DEFAULT '0' COMMENT '权限 0表示普通用户 1表示接单者2表示商家',
  `cardnum` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `phonenum` varchar(12) DEFAULT NULL COMMENT '手机号',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `truename` varchar(20) DEFAULT NULL COMMENT '真实姓名 ',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱 ',
  `pic` varchar(255) NOT NULL DEFAULT 'default.png' COMMENT '头像 ',
  `shop_name` varchar(100) DEFAULT NULL COMMENT '店铺名',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '接单次数',
  `money` double NOT NULL DEFAULT '0' COMMENT '钱包',
  `overall` double DEFAULT NULL COMMENT '总评',
  `latitude` double DEFAULT '0' COMMENT '纬度',
  `longitude` double DEFAULT '0' COMMENT '经度',
  `creattime` int(11) DEFAULT NULL COMMENT '注册时间',
  `logintime` int(11) DEFAULT NULL COMMENT '登录时间',
  `city` varchar(50) DEFAULT NULL COMMENT '接单者注册地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`),
  UNIQUE KEY `cardnum` (`cardnum`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_user`
--

LOCK TABLES `my_user` WRITE;
/*!40000 ALTER TABLE `my_user` DISABLE KEYS */;
INSERT INTO `my_user` VALUES (1,'jone','25d55ad283aa400af464c76d713c07ad',0,21,0,NULL,'15689074542',NULL,NULL,'15689074542@163.com','default.png','',0,0,0,NULL,0,1521284684,NULL,NULL),(3,'张一山','25f9e794323b453885f5181f1b624d0b',1,23,1,NULL,'15790854562',NULL,NULL,'15689074542@163.com','default.png','',13,700,46,30.2144853586,120.2184719597,1522391645,NULL,'杭州市'),(6,'杨紫','25d55ad283aa400af464c76d713c07ad',0,27,2,NULL,'15689074552',NULL,NULL,'15689074542@163.com','default.png','我家店铺',0,970,0,NULL,0,1521873405,NULL,NULL),(7,'Maxwell','25d55ad283aa400af464c76d713c07ad',1,24,2,NULL,'15689074562',NULL,NULL,'15689074542@163.com','default.png','娃哈哈',1,0,0,NULL,0,1521876685,NULL,NULL),(9,'15689074512','25d55ad283aa400af464c76d713c07ad',1,23,0,NULL,'15689074512',NULL,NULL,'15689074542@163.com','default.png','',1,0,0,NULL,0,1521957877,NULL,NULL),(10,'武松','25d55ad283aa400af464c76d713c07ad',1,26,2,NULL,'17858662140',NULL,NULL,'15689074542@163.com','2b096fe639bf4320a3a6a8192184c3fb.jpg','真假',1,102.29999999999988,0,NULL,0,1522054949,NULL,NULL),(11,'高德伟','e10adc3949ba59abbe56e057f20f883e',1,22,1,NULL,'18668242730',NULL,NULL,'15689074542@163.com','default.png','',104,1000,450,30.2144853586,120.2184719597,1522056277,NULL,'杭州市'),(44,'Brody','25d55ad283aa400af464c76d713c07ad',0,23,1,NULL,'15578450023',NULL,NULL,'15578450023@163.com','default.png',NULL,19,200,85,30.2144853586,120.2184719597,1523420410,NULL,'杭州市'),(31,'emma','25d55ad283aa400af464c76d713c07ad',1,28,0,NULL,'15876542891',NULL,NULL,'15876542891@163.com','default.png',NULL,0,0,NULL,NULL,0,1522391645,NULL,NULL),(32,'Lydia','25d55ad283aa400af464c76d713c07ad',1,25,1,NULL,'15790854562',NULL,NULL,'15689074542@163.com','default.png',NULL,4,578,18,30.2144853586,120.2184719597,1522391645,NULL,'杭州市'),(33,'joce','25d55ad283aa400af464c76d713c07ad',1,24,0,NULL,'15790854562',NULL,NULL,'15689074542@163.com','default.png',NULL,0,0,0,0,0,1522391645,NULL,NULL),(34,'Lydia','25d55ad283aa400af464c76d713c07ad',1,25,1,NULL,'15790854562',NULL,NULL,'15689074542@163.com','default.png',NULL,4,1000,18,30.2144853586,120.2184719597,1522391645,NULL,'杭州市'),(35,'Lydia','25d55ad283aa400af464c76d713c07ad',1,25,1,NULL,'15589764567',NULL,NULL,'15689074542@163.com','default.png',NULL,1,20,5,30.2144853586,120.2184719597,1522391645,8,'杭州市'),(36,'Maxwell','25d55ad283aa400af464c76d713c07ad',0,38,2,NULL,'15690878878',NULL,NULL,'15689074542@163.com','default.png','qixing',0,0,NULL,NULL,NULL,1522391645,NULL,NULL),(132,'15057219085','a60a5063f8add70a59acd2cf974929ff',1,NULL,0,NULL,'15057219085',NULL,NULL,NULL,'default.png',NULL,0,0,NULL,0,0,1525427135,NULL,NULL),(131,'17858661747','5690dddfa28ae085d23518a035707282',1,NULL,0,NULL,'17858661747',NULL,NULL,NULL,'default.png',NULL,0,0,NULL,0,0,1525358709,NULL,NULL),(57,'Lilly','25d55ad283aa400af464c76d713c07ad',0,19,2,NULL,'15666542017',NULL,NULL,'15666542017@163.com','default.png','我哈哈',0,2100,NULL,0,0,1523247610,NULL,NULL),(56,'Jeremy','25d55ad283aa400af464c76d713c07ad',1,19,2,NULL,'15666542017',NULL,NULL,'15666542017@163.com','default.png','我哈哈',0,2100,NULL,0,0,1523247610,NULL,NULL),(55,'Payton','25d55ad283aa400af464c76d713c07ad',0,29,2,NULL,'15666542017',NULL,NULL,'15666542017@163.com','default.png','我哈哈',0,2100,NULL,0,0,1523247610,NULL,NULL),(54,'Jocelyn','25d55ad283aa400af464c76d713c07ad',0,29,2,NULL,'15666542017',NULL,NULL,'15666542017@163.com','default.png','我哈哈',0,2100,NULL,0,0,1523247610,NULL,NULL),(53,'Colin','25d55ad283aa400af464c76d713c07ad',1,29,2,NULL,'15666542017',NULL,NULL,'15666542017@163.com','default.png','我哈哈',0,2100,NULL,0,0,1523247610,NULL,NULL),(52,'Jenna','25d55ad283aa400af464c76d713c07ad',0,29,2,NULL,'15666542017',NULL,NULL,'15666542017@163.com','default.png','我哈哈',0,2100,NULL,0,0,1523247610,NULL,NULL),(51,'Micah','25d55ad283aa400af464c76d713c07ad',1,29,2,NULL,'15666542017',NULL,NULL,'15666542017@163.com','default.png','系哈哈',0,2300,NULL,0,0,1523247610,NULL,NULL),(50,'Micah','25d55ad283aa400af464c76d713c07ad',0,29,2,NULL,'15666542017',NULL,NULL,'15666542017@163.com','default.png','娃哈哈',0,200,NULL,0,0,1523247610,NULL,NULL),(48,'Brody','25d55ad283aa400af464c76d713c07ad',0,23,1,NULL,'15578450023',NULL,NULL,'15578450023@163.com','default.png',NULL,200,800,870,30.2144853586,120.2184719597,1523420410,NULL,'杭州市'),(47,'Brody','25d55ad283aa400af464c76d713c07ad',0,23,1,NULL,'15578450023',NULL,NULL,'15578450023@163.com','default.png',NULL,202,800,880,30.2144853586,120.2184719597,1523420410,NULL,'杭州市'),(46,'Brody','25d55ad283aa400af464c76d713c07ad',0,23,1,NULL,'15578450023',NULL,NULL,'15578450023@163.com','default.png',NULL,200,800,870,30.2144853586,120.2184719597,1523420410,NULL,'杭州市'),(45,'Brody','25d55ad283aa400af464c76d713c07ad',0,23,1,NULL,'15578450023',NULL,NULL,'15578450023@163.com','default.png',NULL,23,700,100,30.2144853586,120.2184719597,1523420410,NULL,'杭州市'),(43,'Brody','25d55ad283aa400af464c76d713c07ad',1,23,1,NULL,'15578450023',NULL,NULL,'15578450023@163.com','default.png',NULL,20,200,89,30.2144853586,120.2184719597,1523420410,NULL,'杭州市'),(42,'mark','25d55ad283aa400af464c76d713c07ad',1,26,0,NULL,'15678907890',NULL,NULL,'15678907890@163.com','default.png',NULL,0,0,NULL,0,0,1523334010,NULL,NULL),(40,'mark','25d55ad283aa400af464c76d713c07ad',1,26,0,NULL,'15678907890',NULL,NULL,'15678907890@163.com','default.png',NULL,0,0,NULL,0,0,1523334010,NULL,NULL),(41,'mark','25d55ad283aa400af464c76d713c07ad',1,26,0,NULL,'15678907890',NULL,NULL,'15678907890@163.com','default.png',NULL,0,0,NULL,0,0,1523334010,NULL,NULL),(39,'mark','25d55ad283aa400af464c76d713c07ad',1,26,0,NULL,'15678907890',NULL,NULL,'15678907890@163.com','default.png',NULL,0,0,NULL,0,0,1523334010,NULL,NULL),(38,'mark','25d55ad283aa400af464c76d713c07ad',0,26,0,NULL,'15678907890',NULL,NULL,'15678907890@163.com','default.png',NULL,0,0,NULL,0,0,1523334010,NULL,NULL),(130,'mark','25d55ad283aa400af464c76d713c07ad',0,26,0,NULL,'15678907890','',NULL,'15678907890@163.com','default.png',NULL,0,0,NULL,0,0,1523334010,NULL,NULL),(37,'mark','25d55ad283aa400af464c76d713c07ad',1,26,0,NULL,'15678907890','',NULL,'15678907890@163.com','default.png',NULL,0,0,NULL,0,0,1523334010,NULL,NULL);
/*!40000 ALTER TABLE `my_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-26 14:35:35
