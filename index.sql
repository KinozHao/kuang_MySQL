-- 索引
-- 显示所有的索引信息
SHOW INDEX FROM cusinfo;
-- 增加一个全文索引  `索引名` (`列名称`)
ALTER TABLE BANK.cusinfo ADD FULLTEXT INDEX `NAME` (`NAME`);
-- EXPLAIN 分析sql情况
Explain select  * from cusinfo; -- 非全文索引
Explain select  * from cusinfo where match(name) against('赵');


-- 索引测试
CREATE TABLE `app_user` (
    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) DEFAULT'' COMMENT'用户昵称',
    `email` VARCHAR(50) NOT NULL COMMENT'用户邮箱',
    `phone` VARCHAR(20) DEFAULT'' COMMENT'手机号',
    `gender` TINYINT(4) UNSIGNED DEFAULT '0'COMMENT '性别（0：男;1:女）',
    `password` VARCHAR(100) NOT NULL COMMENT '密码',
    `age` TINYINT(4) DEFAULT'0'  COMMENT '年龄',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COMMENT = 'app用户表'
select * from app_user;

-- mysql编程插入数据
-- 插入100万数据.

DELIMITER $$
-- 写函数之前必须要写，标志
CREATE FUNCTION mock_datas ()
    RETURNS INT
BEGIN
    DECLARE num INT DEFAULT 1000000;
    DECLARE i INT DEFAULT 0;
    WHILE i<num DO
            INSERT INTO `app_user`(`name`,`email`,`phone`,`gender`,`password`,`age`)
            VALUES(CONCAT('用户',i),'19224305@qq.com','123456789',FLOOR(RAND()*2),UUID(),floor(rand()*100));
            SET i=i+1;
        END WHILE;
    RETURN i;
END;
select mock_datas();

select  * from app_user where name ='用户9999'; -- 没有索引:execution: 565 ms, fetching: 31 ms

create index id_app_user_name on app_user (`name`); -- 为name创建索引
drop index id_app_user_name on app_user; -- 去除索引
select  * from app_user where name ='用户9999'; -- 添加索引后:execution: 0 ms, fetching: 47 ms

-- 对索引分析 添加前:rows为992906 添加后:rows为1
explain select  * from app_user where name ='用户9999';