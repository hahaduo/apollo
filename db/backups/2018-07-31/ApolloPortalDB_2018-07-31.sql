-- MySQL dump 10.13  Distrib 5.7.18, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: ApolloPortalDB
-- ------------------------------------------------------
-- Server version	5.7.21

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

CREATE DATABASE IF NOT EXISTS ApolloPortalDB DEFAULT CHARACTER SET = utf8mb4;

Use ApolloPortalDB;

--
-- Table structure for table `App`
--

DROP TABLE IF EXISTS `App`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `App` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `App`
--

LOCK TABLES `App` WRITE;
/*!40000 ALTER TABLE `App` DISABLE KEYS */;
INSERT INTO `App` VALUES (1,'mes-auth','mes-auth','TEST1','样例部门1','apollo','apollo@acme.com','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(2,'mes-gate','mes-gate','TEST1','样例部门1','apollo','apollo@acme.com','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(3,'mes-admin','mes-admin','TEST1','样例部门1','apollo','apollo@acme.com','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(4,'mes-dict','mes-dict','TEST1','样例部门1','apollo','apollo@acme.com','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(5,'mes-newstart','mes-newstart','TEST1','样例部门1','apollo','apollo@acme.com','\0','apollo','2018-07-27 00:16:41','apollo','2018-07-27 00:16:41'),(6,'ttt','ttt','TEST1','样例部门1','apollo','apollo@acme.com','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(7,'rrr','rrr','TEST1','样例部门1','apollo','apollo@acme.com','','apollo','2018-07-31 06:37:22','apollo','2018-07-31 06:08:46');
/*!40000 ALTER TABLE `App` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AppNamespace`
--

DROP TABLE IF EXISTS `AppNamespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AppNamespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId` (`AppId`),
  KEY `Name_AppId` (`Name`,`AppId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppNamespace`
--

LOCK TABLES `AppNamespace` WRITE;
/*!40000 ALTER TABLE `AppNamespace` DISABLE KEYS */;
INSERT INTO `AppNamespace` VALUES (1,'application','mes-auth','properties','\0','default app namespace','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(2,'application','mes-gate','properties','\0','default app namespace','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(3,'application','mes-admin','properties','\0','default app namespace','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(4,'application','mes-dict','properties','\0','default app namespace','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(5,'application','mes-newstart','properties','\0','default app namespace','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(6,'application','ttt','properties','\0','default app namespace','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(7,'application','rrr','properties','\0','default app namespace','','apollo','2018-07-31 06:37:23','apollo','2018-07-31 06:08:46');
/*!40000 ALTER TABLE `AppNamespace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Authorities`
--

DROP TABLE IF EXISTS `Authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authorities` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(50) NOT NULL,
  `Authority` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authorities`
--

LOCK TABLES `Authorities` WRITE;
/*!40000 ALTER TABLE `Authorities` DISABLE KEYS */;
INSERT INTO `Authorities` VALUES (1,'apollo','ROLE_user');
/*!40000 ALTER TABLE `Authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Consumer`
--

DROP TABLE IF EXISTS `Consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Consumer` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开放API消费者';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consumer`
--

LOCK TABLES `Consumer` WRITE;
/*!40000 ALTER TABLE `Consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsumerAudit`
--

DROP TABLE IF EXISTS `ConsumerAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsumerAudit` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ConsumerId` (`ConsumerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer审计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsumerAudit`
--

LOCK TABLES `ConsumerAudit` WRITE;
/*!40000 ALTER TABLE `ConsumerAudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsumerAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsumerRole`
--

DROP TABLE IF EXISTS `ConsumerRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsumerRole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_ConsumerId_RoleId` (`ConsumerId`,`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer和role的绑定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsumerRole`
--

LOCK TABLES `ConsumerRole` WRITE;
/*!40000 ALTER TABLE `ConsumerRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsumerRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsumerToken`
--

DROP TABLE IF EXISTS `ConsumerToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsumerToken` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Token` (`Token`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsumerToken`
--

LOCK TABLES `ConsumerToken` WRITE;
/*!40000 ALTER TABLE `ConsumerToken` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsumerToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Favorite`
--

DROP TABLE IF EXISTS `Favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Favorite` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT '10000' COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `IX_UserId` (`UserId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Favorite`
--

LOCK TABLES `Favorite` WRITE;
/*!40000 ALTER TABLE `Favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `Favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permission`
--

DROP TABLE IF EXISTS `Permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_TargetId_PermissionType` (`TargetId`(191),`PermissionType`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COMMENT='permission表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permission`
--

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
INSERT INTO `Permission` VALUES (1,'CreateCluster','mes-auth','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(2,'CreateNamespace','mes-auth','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(3,'AssignRole','mes-auth','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(4,'ModifyNamespace','mes-auth+application','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(5,'ReleaseNamespace','mes-auth+application','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(6,'ModifyNamespace','mes-auth+application+DEV','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(7,'ReleaseNamespace','mes-auth+application+DEV','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(8,'CreateCluster','mes-gate','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(9,'CreateNamespace','mes-gate','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(10,'AssignRole','mes-gate','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(11,'ModifyNamespace','mes-gate+application','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(12,'ReleaseNamespace','mes-gate+application','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(13,'ModifyNamespace','mes-gate+application+DEV','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(14,'ReleaseNamespace','mes-gate+application+DEV','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(15,'CreateCluster','mes-admin','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(16,'CreateNamespace','mes-admin','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(17,'AssignRole','mes-admin','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(18,'ModifyNamespace','mes-admin+application','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(19,'ReleaseNamespace','mes-admin+application','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(20,'ModifyNamespace','mes-admin+application+DEV','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(21,'ReleaseNamespace','mes-admin+application+DEV','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(22,'CreateCluster','mes-dict','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(23,'CreateNamespace','mes-dict','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(24,'AssignRole','mes-dict','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(25,'ModifyNamespace','mes-dict+application','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(26,'ReleaseNamespace','mes-dict+application','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(27,'ModifyNamespace','mes-dict+application+DEV','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(28,'ReleaseNamespace','mes-dict+application+DEV','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(29,'CreateCluster','mes-newstart','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(30,'CreateNamespace','mes-newstart','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(31,'AssignRole','mes-newstart','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(32,'ModifyNamespace','mes-newstart+application','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(33,'ReleaseNamespace','mes-newstart+application','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(34,'ModifyNamespace','mes-newstart+application+DEV','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(35,'ReleaseNamespace','mes-newstart+application+DEV','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(36,'CreateCluster','ttt','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(37,'CreateNamespace','ttt','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(38,'AssignRole','ttt','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(39,'ModifyNamespace','ttt+application','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(40,'ReleaseNamespace','ttt+application','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(41,'ModifyNamespace','ttt+application+DEV','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(42,'ReleaseNamespace','ttt+application+DEV','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(43,'CreateCluster','rrr','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(44,'CreateNamespace','rrr','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(45,'AssignRole','rrr','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(46,'ModifyNamespace','rrr+application','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(47,'ReleaseNamespace','rrr+application','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(48,'ModifyNamespace','rrr+application+DEV','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(49,'ReleaseNamespace','rrr+application+DEV','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46');
/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_RoleName` (`RoleName`(191)),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Master+mes-auth','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(2,'ModifyNamespace+mes-auth+application','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(3,'ReleaseNamespace+mes-auth+application','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(4,'ModifyNamespace+mes-auth+application+DEV','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(5,'ReleaseNamespace+mes-auth+application+DEV','\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(6,'Master+mes-gate','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(7,'ModifyNamespace+mes-gate+application','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(8,'ReleaseNamespace+mes-gate+application','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(9,'ModifyNamespace+mes-gate+application+DEV','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(10,'ReleaseNamespace+mes-gate+application+DEV','\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(11,'Master+mes-admin','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(12,'ModifyNamespace+mes-admin+application','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(13,'ReleaseNamespace+mes-admin+application','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(14,'ModifyNamespace+mes-admin+application+DEV','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(15,'ReleaseNamespace+mes-admin+application+DEV','\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(16,'Master+mes-dict','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(17,'ModifyNamespace+mes-dict+application','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(18,'ReleaseNamespace+mes-dict+application','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(19,'ModifyNamespace+mes-dict+application+DEV','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(20,'ReleaseNamespace+mes-dict+application+DEV','\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(21,'Master+mes-newstart','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(22,'ModifyNamespace+mes-newstart+application','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(23,'ReleaseNamespace+mes-newstart+application','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(24,'ModifyNamespace+mes-newstart+application+DEV','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(25,'ReleaseNamespace+mes-newstart+application+DEV','\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(26,'Master+ttt','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(27,'ModifyNamespace+ttt+application','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(28,'ReleaseNamespace+ttt+application','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(29,'ModifyNamespace+ttt+application+DEV','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(30,'ReleaseNamespace+ttt+application+DEV','','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(31,'Master+rrr','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(32,'ModifyNamespace+rrr+application','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(33,'ReleaseNamespace+rrr+application','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(34,'ModifyNamespace+rrr+application+DEV','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(35,'ReleaseNamespace+rrr+application+DEV','','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RolePermission`
--

DROP TABLE IF EXISTS `RolePermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RolePermission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) unsigned DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_PermissionId` (`PermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COMMENT='角色和权限的绑定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RolePermission`
--

LOCK TABLES `RolePermission` WRITE;
/*!40000 ALTER TABLE `RolePermission` DISABLE KEYS */;
INSERT INTO `RolePermission` VALUES (1,1,1,'\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(2,1,2,'\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(3,1,3,'\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(4,2,4,'\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(5,3,5,'\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(6,4,6,'\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(7,5,7,'\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(8,6,8,'\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(9,6,9,'\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(10,6,10,'\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(11,7,11,'\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(12,8,12,'\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(13,9,13,'\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(14,10,14,'\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(15,11,15,'\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(16,11,16,'\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(17,11,17,'\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(18,12,18,'\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(19,13,19,'\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(20,14,20,'\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(21,15,21,'\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(22,16,22,'\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(23,16,23,'\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(24,16,24,'\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(25,17,25,'\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(26,18,26,'\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(27,19,27,'\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(28,20,28,'\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(29,21,29,'\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(30,21,30,'\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(31,21,31,'\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(32,22,32,'\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(33,23,33,'\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(34,24,34,'\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(35,25,35,'\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(36,26,36,'','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(37,26,37,'','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(38,26,38,'','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(39,27,39,'','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(40,28,40,'','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(41,29,41,'','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(42,30,42,'','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(43,31,43,'','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(44,31,44,'','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(45,31,45,'','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(46,32,46,'','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(47,33,47,'','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(48,34,48,'','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(49,35,49,'','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46');
/*!40000 ALTER TABLE `RolePermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServerConfig`
--

DROP TABLE IF EXISTS `ServerConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServerConfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Key` (`Key`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServerConfig`
--

LOCK TABLES `ServerConfig` WRITE;
/*!40000 ALTER TABLE `ServerConfig` DISABLE KEYS */;
INSERT INTO `ServerConfig` VALUES (1,'apollo.portal.envs','dev','可支持的环境列表','\0','default','2018-07-26 09:08:09','','2018-07-26 09:08:09'),(2,'organizations','[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]','部门列表','\0','default','2018-07-26 09:08:09','','2018-07-26 09:08:09'),(3,'superAdmin','apollo','Portal超级管理员','\0','default','2018-07-26 09:08:09','','2018-07-26 09:08:09'),(4,'api.readTimeout','10000','http接口read timeout','\0','default','2018-07-26 09:08:09','','2018-07-26 09:08:09'),(5,'consumer.token.salt','someSalt','consumer token salt','\0','default','2018-07-26 09:08:09','','2018-07-26 09:08:09'),(6,'admin.createPrivateNamespace.switch','false','是否允许项目管理员创建私有namespace','\0','default','2018-07-26 09:08:09','','2018-07-26 09:08:09');
/*!40000 ALTER TABLE `ServerConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserRole`
--

DROP TABLE IF EXISTS `UserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserRole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_UserId_RoleId` (`UserId`,`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='用户和role的绑定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserRole`
--

LOCK TABLES `UserRole` WRITE;
/*!40000 ALTER TABLE `UserRole` DISABLE KEYS */;
INSERT INTO `UserRole` VALUES (1,'apollo',1,'\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(2,'apollo',2,'\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(3,'apollo',3,'\0','apollo','2018-07-26 17:47:08','apollo','2018-07-26 17:47:08'),(4,'apollo',6,'\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(5,'apollo',7,'\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(6,'apollo',8,'\0','apollo','2018-07-26 18:32:10','apollo','2018-07-26 18:32:10'),(7,'apollo',11,'\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(8,'apollo',12,'\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(9,'apollo',13,'\0','apollo','2018-07-26 18:50:37','apollo','2018-07-26 18:50:37'),(10,'apollo',16,'\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(11,'apollo',17,'\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(12,'apollo',18,'\0','apollo','2018-07-26 18:52:53','apollo','2018-07-26 18:52:53'),(13,'apollo',21,'\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(14,'apollo',22,'\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(15,'apollo',23,'\0','apollo','2018-07-27 00:16:42','apollo','2018-07-27 00:16:42'),(16,'apollo',26,'','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(17,'apollo',27,'','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(18,'apollo',28,'','apollo','2018-07-28 18:21:39','apollo','2018-07-31 06:08:28'),(19,'apollo',31,'','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(20,'apollo',32,'','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46'),(21,'apollo',33,'','apollo','2018-07-31 06:37:24','apollo','2018-07-31 06:08:46');
/*!40000 ALTER TABLE `UserRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'apollo','$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS','apollo@acme.com',1);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-31 14:25:54
