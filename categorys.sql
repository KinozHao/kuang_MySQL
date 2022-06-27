CREATE TABLE `category`(
 `categoryid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主题id',
 `pid` INT(10) NOT NULL COMMENT '父id',
 `categoryname` VARCHAR(50) NOT NULL COMMENT '主题名字',
PRIMARY KEY (`categoryid`) 
 ) ENGINE=INNODB  AUTO_INCREMENT=9 DEFAULT CHARSET=utf8; 

INSERT INTO `category` (`categoryid`, `pid`, `categoryname`) 
VALUES ('2','1','信息技术'),
('3','1','软件开发'),
('5','1','美术设计'),
('4','3','数据库'),
('8','2','办公信息'),
('6','3','web开发'),
('7','5','ps技术');

SELECT * FROM `category`;