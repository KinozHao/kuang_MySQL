-- 一、创建数据库与表
create database `bank` character set utf8;
create table `cusinfo`(
    `ID` int(3) not null auto_increment comment '客户代号',
    `name` varchar(30) not null comment 'name',
    `money` decimal(9,2) not null,
    primary key (`ID`)
)engine=innodb char set=utf8;

-- 二、使用数据库
use bank;

-- 三、添加数据并查询数据是否添加成功
insert into `cusinfo`(name, money)
values ('李',200),('赵',300);
select * from cusinfo;

-- 四、事务操纵
set autocommit = 0; -- 关闭自动提交
start transaction;  -- 开启一个事务
-- 事务里面操纵的数据(原子性)
update cusinfo set money = money-50 where id='1';
update cusinfo set money = money+50 where id='2';

commit; -- 提交(持久性)
rollback; -- 回滚(恢复操作前数据)

set autocommit = 1; -- 开启自动提交
