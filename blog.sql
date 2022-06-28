/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.20 : Database - kinoz_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kinoz_blog` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `kinoz_blog`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) NOT NULL COMMENT '文章唯一标识',
  `title` varchar(100) NOT NULL COMMENT '文章标题',
  `author_id` varchar(30) NOT NULL COMMENT '作者名称',
  `category_id` int(10) NOT NULL COMMENT '文章分类',
  `content` text NOT NULL COMMENT '文章体',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `love` int(10) NOT NULL COMMENT '点赞数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `article` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `create_user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(10) NOT NULL COMMENT '评论id',
  `blog_id` int(10) NOT NULL COMMENT '所属文章',
  `user_id` int(10) NOT NULL COMMENT '评论用户',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `user_id_parent` int(10) NOT NULL COMMENT '回复人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `links` */

DROP TABLE IF EXISTS `links`;

CREATE TABLE `links` (
  `id` int(10) NOT NULL COMMENT '唯一标识',
  `links` varchar(100) NOT NULL COMMENT '友链网站名称',
  `href` varchar(2000) NOT NULL COMMENT '友链网站域名',
  `sort` int(10) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `links` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `sex` varchar(3) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `sign` varchar(100) DEFAULT NULL,
  `avator` varchar(200) NOT NULL COMMENT '头像',
  `open_id` varchar(1000) NOT NULL COMMENT '微信id需对接微信api',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `user_follow` */

DROP TABLE IF EXISTS `user_follow`;

CREATE TABLE `user_follow` (
  `id` int(10) NOT NULL COMMENT '唯一标识',
  `user_id` int(10) NOT NULL COMMENT '被关注的id',
  `follow_id` int(10) NOT NULL COMMENT '关注人的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_follow` */

insert  into `user_follow`(`id`,`user_id`,`follow_id`) values (1,1001,2001),(2,1001,2018);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
