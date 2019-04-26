-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-03-17 11:37:51
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myproject`
--

-- --------------------------------------------------------

--
-- 表的结构 `my_admin`
--

CREATE TABLE `my_admin` (
  `id` int(11) NOT NULL,
  `adminname` varchar(20) NOT NULL COMMENT '管理员名称',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `creattime` int(12) NOT NULL COMMENT '创建时间',
  `role` mediumint(1) NOT NULL DEFAULT '0' COMMENT '1为超级管理员0为管理员'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `my_admin`
--

INSERT INTO `my_admin` (`id`, `adminname`, `password`, `creattime`, `role`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1521092017, 1),
(2, 'jachin', '25d55ad283aa400af464c76d713c07ad', 1521103941, 0);

-- --------------------------------------------------------

--
-- 表的结构 `my_indent`
--

CREATE TABLE `my_indent` (
  `id` int(11) NOT NULL,
  `order_number` varchar(30) NOT NULL COMMENT '订单编号',
  `creat_time` varchar(12) NOT NULL COMMENT '创建时间',
  `merchant_id` int(11) NOT NULL COMMENT '商家ID',
  `start` varchar(255) NOT NULL COMMENT '起始地',
  `bourn` varchar(255) NOT NULL COMMENT '目的地',
  `delivery_distance` int(11) NOT NULL COMMENT '配送距离',
  `consignee` varchar(50) NOT NULL COMMENT '收货人',
  `consignee_phone` varchar(11) NOT NULL COMMENT '收获人联系方式',
  `urgent` tinyint(4) NOT NULL DEFAULT '0' COMMENT '急件0为普通物件，1为急件',
  `cash` int(11) NOT NULL COMMENT '押金',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态0为未发货，1为已发货，2已签收',
  `delivery_id` int(11) NOT NULL COMMENT '配送员ID',
  `finish_time` varchar(12) NOT NULL COMMENT '完成时间',
  `merchant_appraise` varchar(255) DEFAULT NULL COMMENT '商家评价'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `my_indent`
--

INSERT INTO `my_indent` (`id`, `order_number`, `creat_time`, `merchant_id`, `start`, `bourn`, `delivery_distance`, `consignee`, `consignee_phone`, `urgent`, `cash`, `order_status`, `delivery_id`, `finish_time`, `merchant_appraise`) VALUES
(1, '10001', '1521286563', 4, '杭州滨江中医药大学', '杭州滨江宝龙广场', 3000, '张三', '15878565422', 0, 25, 1, 3, '', '1521286563');

-- --------------------------------------------------------

--
-- 表的结构 `my_user`
--

CREATE TABLE `my_user` (
  `id` int(11) NOT NULL,
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
  `pic` varchar(255) DEFAULT NULL COMMENT '头像 ',
  `creattime` int(11) DEFAULT NULL COMMENT '注册时间',
  `logintime` int(11) DEFAULT NULL COMMENT '登录时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip地址',
  `shopname` varchar(100) DEFAULT NULL COMMENT '店铺名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `my_user`
--

INSERT INTO `my_user` (`id`, `username`, `password`, `sex`, `age`, `power`, `cardnum`, `phonenum`, `address`, `truename`, `email`, `pic`, `creattime`, `logintime`, `remark`, `ip`, `shopname`) VALUES
(1, 'jone', '25d55ad283aa400af464c76d713c07ad', 0, 21, 0, NULL, '15689074542', NULL, NULL, '15689074542@163.com', '/uploads/20180317\\983d01164dccfb3cdb89d6c93b078479.jpg', 1521284684, NULL, NULL, NULL, NULL),
(3, 'jaca', '25f9e794323b453885f5181f1b624d0b', 1, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Larissa', '25d55ad283aa400af464c76d713c07ad', 0, 22, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1521284977, NULL, NULL, NULL, NULL),
(5, 'Kelly', '25d55ad283aa400af464c76d713c07ad', 1, 0, 0, NULL, '', NULL, NULL, '', NULL, 1521285019, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `my_admin`
--
ALTER TABLE `my_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_indent`
--
ALTER TABLE `my_indent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_user`
--
ALTER TABLE `my_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID` (`id`),
  ADD UNIQUE KEY `cardnum` (`cardnum`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `my_admin`
--
ALTER TABLE `my_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `my_indent`
--
ALTER TABLE `my_indent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `my_user`
--
ALTER TABLE `my_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
