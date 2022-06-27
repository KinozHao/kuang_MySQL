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