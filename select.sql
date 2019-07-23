# 1.查询同时存在1课程和2课程的情况
select student.*
from student LEFT JOIN student_course
ON student.id=student_course.studentId
and student_course.courseId=1
and student_course.courseId=2

# 2.查询同时存在1课程和2课程的情况
select student.*
from student LEFT JOIN student_course
ON student.id=student_course.studentId
and student_course.courseId=1
and student_course.courseId=2

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select student.id,student.name,student_course.score
from student LEFT JOIN student_course
ON student.id=student_course.studentId
GROUP BY student.name
HAVING AVG(student_course.score)>=60

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT * FROM student 
WHERE id not in (select studentId FROM student_course)

# 5.查询所有有成绩的SQL
SELECT * FROM student 
WHERE id in (select studentId FROM student_course)

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select
		a.*
	from
		student a,
		student_course b,
		student_course c
	where
		a.id = b.studentId
		and a.id = c.studentId
		and b.courseId = '1'
		and c.courseId = '2';
		
# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT student.*
from student,student_course
WHERE student.id=student_course.studentId
and student_course.courseId='1'
and student_course.score<60
ORDER BY student_course.score

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select student_course.*,AVG(student_course.score) as avg_score
from student right JOIN student_course
on student.id=student_course.studentId
GROUP BY student_course.courseId
order by avg_score desc,student_course.courseId asc

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT student.name,student_course.score
from student,student_course
WHERE student.id=student_course.studentId
and student_course.courseId='2'
and student_course.score<60