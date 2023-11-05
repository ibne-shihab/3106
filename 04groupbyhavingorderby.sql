use Sayeeda_Khan
select * from instructor

select count(Teacher_ID) as Teachers,teach_dept
from instructor
group by teach_dept

select count(Teacher_ID) as Teachers,teach_dept,avg(salary) as average_salary
from instructor
group by teach_dept
having avg(salary)>74000

select Teacher_ID,teach_dept,salary
from instructor
where salary>74000


select Teacher_ID,Ins_name,teach_dept,salary
from instructor
where teach_dept='ICE' 
order by salary desc

create view Teachers_01 as
select Ins_name,teach_dept
from instructor
where salary>80000

select * from Teachers_01
select * from student

create index stu on student(stu_name)
create index Stu_De on student(Stude_deptNAME)
create index teacher on instructor(Ins_name)

/* speed up data retrieval for queries that involve the "Ins_name" column  */

CREATE PROCEDURE get_teacher_by_dpt
    @tech_dept VARCHAR(30)
AS
BEGIN
    SELECT Teacher_ID, Ins_name
    FROM instructor
    WHERE teach_dept = @tech_dept;
END

EXEC get_teacher_by_dpt @tech_dept = 'MATH'

CREATE PROCEDURE get_student_by_dept
    @SD VARCHAR(30)
AS
BEGIN
    SELECT Student_ID, stu_name
    FROM student
    WHERE Stude_deptNAME = @SD;
END
exec get_student_by_dept @SD='CSE'

