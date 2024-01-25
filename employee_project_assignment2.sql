/*select *from emp_project*/
/*1.	Select the detail of the employee whose name start with U.*/
select * from emp_project where emp_name like 'u%'; 

/*2.	How many permanent candidate take salary more than 5000.*/
 select count(salary) as count_salary from emp_project where ispermanent='yes' and salary>5000;
 /*3	List name of all employees whose name ends with a.*/
 select* from emp_project where emp_name like '%a';
 /*4.	select the name of the employee whose name's 3rd charactor is 't'.*/
 select *from emp_project where emp_name like '__t%';
 /* 5 What is total salary that is paid to permanent employees?*/
/* select sum(salary) as total_salary from emp_project where ispermanent='yes';*/
 /* 6.	Select the details of the employee who work either for department E-104 or E-102.*/
 select * from emp_project where department='E-104'or department='E-102';
 /*7	List the number of department of employees in each project.*/
 select count(emp_id) as employee  ,project from emp_project group by project;
 /*Select the detail of employee whose emailId is in gmail.*/
 select * from emp_project where email_id like'%gmail';