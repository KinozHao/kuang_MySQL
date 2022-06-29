CREATE DATABASE `jdbcStudy` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `jdbcStudy`;

CREATE TABLE `users`(
                        `id` INT PRIMARY KEY,
                        `NAME` VARCHAR(40),
                        `PASSWORD` VARCHAR(40),
                        `email` VARCHAR(60),
                        birthday DATE
);

INSERT INTO `users`(`id`,`NAME`,`PASSWORD`,`email`,`birthday`)
VALUES('1','zhangsan','123456','zs@sina.com','1980-12-04'),
      ('2','lisi','123456','lisi@sina.com','1981-12-04'),
      ('3','wangwu','123456','wangwu@sina.com','1979-12-04');

select *
from users;
insert into users (id, NAME, PASSWORD, email, birthday)
values ('5','Make','123456','Make@gmail.com','1980-12-08');