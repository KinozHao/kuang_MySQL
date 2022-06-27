SELECT * FROM student;
-- 基础DQL的综合运用
-- 一、查询高等数学-1成绩大于60 排名前10的学生
SELECT a.`studentno`,`StudentName`,`SubjectName`,`StudentResult`
FROM `student` AS a
INNER JOIN `result` AS b
ON a.`StudentNo` = b.`StudentNo`
INNER JOIN `subject` AS c
ON b.`SubjectNo` = c.`SubjectNo`
WHERE `studentresult` >=60 AND `subjectname` = '高等数学-1'
ORDER BY `studentresult` DESC
LIMIT 0,10;

-- 分数不小于80分的学生的学号和姓名
SELECT DISTINCT A.`StudentNo`,`StudentName`
FROM student AS A
INNER JOIN result AS r
on a.StudentNo = r.StudentNo
WHERE `StudentResult` >= 80;

-- 子查询
-- 二、分数不小于80分的学生的学号和姓名 科目为高等数学-1
-- 查询 高等数学-1编号
SELECT DISTINCT A.`StudentNo`,StudentName
FROM student AS A
INNER JOIN result as r
ON A.StudentNO = R.StudentNo
WHERE StudentResult >= 80 AND SubjectNo=(
    SELECT SubjectNo  FROM subject
    WHERE SubjectName='高等数学-1'
    );
-- 嵌套查询(由里即外)
select StudentNo,StudentName from student where studentno in (
    select StudentNo from result where StudentResult >= 80 and SubjectNo in(
        select SubjectNo from subject where SubjectName='高等数学-1'
        )
    )


-- 三、查询高等数学-1排行前五的学生信息
-- 1.确定查询字段
select distinct a.`StudentNo`,`StudentName`,`StudentResult`
-- 2.连表查询
from student as a
inner join result as b
on a.StudentNo = b.StudentNo
-- 3.子查询
WHERE b.SubjectNo =(
    select SubjectNo from subject
    where SubjectName='高等数学-1'
)
order by StudentResult DESC
LIMIT 0,5;

