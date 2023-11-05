use Sayeeda_Khan
 select * from instructor
 select * from student

 exec sp_rename 'instructor.dept_name', 'teach_dept', 'column'
 exec sp_rename 'instructor.ID','Teacher_ID','column'
 exec sp_rename 'student.Studentr_ID','Student_ID','column'
 exec sp_rename 'student.dept_name','Student_deptNAME','column'

 delete from student
 where Student_ID='200614'

 select  Teacher_ID,Ins_name,teach_dept,
 Student_ID,stu_name,stude_deptNAME,total_credit
 from instructor
 cross join student

 /* INNER JOIN
 select student.stu_name,student.Student_ID,student.stude_deptNAME,
 student.total_credit,instructor.Ins_name
 from instructor
 inner join student on instructor.teach_dept=student.stude_deptNAME
 */

 select instructor.Ins_name as Teacher_name,
	instructor.teach_dept as Teacher_Dept,
	student.Student_ID as Student_ID,
	student.stu_name as Student_Name,
	student.stude_deptNAME as Student_Dept
 from instructor
 inner join student 
 on instructor.teach_dept=student.stude_deptNAME
 select * from instructor
 select * from student

 select instructor.Ins_name as Teacher_name,
	instructor.teach_dept as Teacher_Dept,
	student.Student_ID as Student_ID,
	student.stu_name as Student_Name,
	student.stude_deptNAME as Student_Dept
 from instructor
 left join student 
 on instructor.teach_dept=student.stude_deptNAME

 select instructor.Ins_name as Teacher_name,
	instructor.teach_dept as Teacher_Dept,
	student.Student_ID as Student_ID,
	student.stu_name as Student_Name,
	student.stude_deptNAME as Student_Dept
 from instructor
 right join student 
 on instructor.teach_dept=student.stude_deptNAME

 select instructor.Ins_name as Teacher_name,
	instructor.teach_dept as Teacher_Dept,
	student.Student_ID as Student_ID,
	student.stu_name as Student_Name,
	student.stude_deptNAME as Student_Dept
 from instructor
 full outer join student 
 on instructor.teach_dept=student.stude_deptNAME