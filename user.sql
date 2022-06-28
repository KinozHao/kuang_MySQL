-- 用户管理

-- 创建用户
create user 用户名 identified by '密码';

-- 设置指定用户密码
set password for 用户名 = password('密码');

-- 设置当前用户密码
set password = password('密码');

-- 重命名用户名
RENAME USER 旧用户名 TO 新用户名;

-- 给用户赋予最高权限除GRANT
GRANT ALL PRIVILEGES ON *.* TO 用户名;

-- 查看用户权限
show grants for 用户名;

-- 撤销权限 撤销哪些权限 在哪个库撤销 给谁撤
revoke all privileges on *.* from 用户名;

-- 删除指定用户
drop user 用户名;
