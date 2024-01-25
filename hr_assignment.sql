 /*1 Display details of jobs where the minimum salary is greater than 10000*/

 select * from employees
 SELECT * FROM JOBS WHERE MIN_SALARY > 10000
 --Display the first name and join date of the employees who joined between 2002 and 2005.
  select first_name,hire_date from employees where datepart(yyyy,hire_date)=2002 and  datepart(yyyy,hire_date)=2005
 --3 Display first name and join date of the employees who is either IT Programmer or Sales Man.
  select first_name ,hire_date,job_id from employees where job_id='it_pro' or job_id='sa_man' 
  /*4 Display employees who joined after 1st January 2008.*/
  select*from employees where hire_date > '2008-01-01'
  /*5 Display details of employee with ID 150 or 160.*/
  select * from employees where employee_id in (150,160)
  -- 6 Display first name, salary, commission pct, and hire date for employees with salary less than 10000.
  select first_name,salary,commission_pct ,hire_date from employees where salary < 10000
 -- 7 Display job Title, the difference between minimum and maximum salaries for jobs with max salary in the range 10000 to 20000.

   select job_title ,max_salary-min_salary difference from jobs where max_salary between 10000 and 20000

  --8 Display first name, salary, and round the salary to thousands.
  select first_name,salary ,round(salary,2) from employees
  --9Display details of jobs in the descending order of the title.
  select *from jobs  order by job_title DESc
  --10Display employees where the first name or last name starts with S
  select first_name ,last_name from employees where first_name like 'S%' and last_name like 'S%'
 --11Display employees who joined in the month of May.
  select *from employees where datepart(MM,hire_date)=5
  --12Display details of the employees where commission percentage is null and salary in the range 5000 to 10000 and department is 30.
  select * from employees where commission_pct is null and salary between 5000 and 10000 and department_id=30


--13Display first name and date of first salary of the employees error occurs 
SELECT first_name, min(hire_date) as "first salary" FROM employees
GROUP BY first_name;
select first_name, hire_date from employees order by first_name

--14 check Display first name and experience of the employees.
SELECT convert(varchar(3),DATEDIFF(MONTH, hire_date, GETDATE())/12) +' years '+
    convert(varchar(2),DATEDIFF(DD, hire_date, GETDATE()) % 12)+ ' months' 
    AS EXPERIENCE from employees;

--15Display first name of employees who joined in 2001

select first_name,hire_date from employees where datepart(YYYY,hire_date)=2001
 
--16 check Display first name and last name after converting the first letter of each name to upper case and the rest to lower case.

SELECT UPPER(LEFT(first_name,1)) FROM employees 
--17. check	Display the first word in job title.
select substring(job_title,1,charindex('',job_title)) from jobs 
 
--18 Display the length of first name for employees where last name contain character ‘b’ after 3rd position.
select len(first_name) as lengthfirstname,last_name   from  employees where  last_name like ('__a%') 
--19Display first name in upper case and email address in lower case for employees where the first name and email address are same irrespective of the case.

select upper(first_name )  as upper_name , lower(email) as lower_email from employees  where upper(first_name)  != lower(email)
select upper(first_name),lower(email) from employees --where upper(first_name)=upper(email)

--20Display employees who joined in the current year.
select * from employees where datepart(yyyy,hire_date)=year(getdate())
--21Display the number of days between system date and 1st January 2011.
select datediff( day,'2011-1-1',getdate()) from employees
--22Display how many employees joined in each month of the current year.

select *from employees where datepart(mm,hire_date)=getdate()
--23.	Display manager ID and number of employees managed by the manager.
select m.manager_id , count (e.employee_id ) as number_emp from manager m join employees e on m.manager_id=e.manager_id 
group by m.manager_id
--24Display employee ID and the date on which he ended his previous job.
 SELECT employee_id , MAX(end_date)
FROM job_history group  by employee_id

--25Di splay number of employees joined after 15th of the month.
SELECT * FROM EMPLOYEES WHERE datepart(dd,hire_date) > 15
--26Display the country ID and number of cities we have in the country.

 SELECT country_ID,  COUNT(*)  as numbr_cities  from locations GROUP BY COUNTRY_ID
--27display average salary of employees in each department who have commission percentage.
select avg(salary),department_id from employees where commission_pct is not null group by department_id
select department_id,avg(salary) from employees where commission_pct is not null group by department_id
--28Display job ID, number of employees, sum of salary, and difference between highest salary and lowest salary of the employees of the job.
select job_id ,count(*) as num_emp ,sum(salary) as sum_salary , max(salary)-min(salary) as diff from employees group by job_id 
select job_id,count(*),sum(salary) , max(salary)-min(salary) from employees group by job_id
--29Display job ID for jobs with average salary more than 10000.
select job_id ,avg(salary) from employees where avg(salary)>10000-- error is liye aaya hai
select job_id,avg(salary) from employees group by job_id having avg(salary) >10000
--30Display years in which more than 10 employees joined
select  datepart(yyyy,hire_date) from employees  group by datepart(yyyy,hire_date) having count(employee_id)>10
select datepart(yyyy,hire_date) from  employees group by  datepart(yyyy,hire_date) having count(employee_id)>10 
.
--31Display departments in which more than five employees have commission percentage.
select department_id  from employees where commission_pct is not null group by department_id having count(employee_id)>5
--32Display employee ID for employees who did more than one job in the past.
select employee_id from job_history group by employee_id having count(*)>1
select employee_id from job_history group by employee_id having count(*)>1 
--33Display job ID of jobs that were done by more than 3 employees for more than 100 days.
sELECT JOB_ID FROM employees WHERE datepart(DD,hire_date)> 100 GROUP BY JOB_ID
HAVING COUNT(*)>3

--34Display department ID, year, and Number of employees joined.
SELECT DEPARTMENT_ID, datepart(yyyy,hire_date) as years , COUNT(EMPLOYEE_ID) as join_emp 
FROM EMPLOYEES GROUP BY DEPARTMENT_ID, datepart(yyyy,hire_date)
ORDER BY DEPARTMENT_ID


 
 --36 Change salary of employee 1115 to 8000 if the existing salary is less than 6000
 update  employees set salary =8000 where employee_id=115 and salary < 6000
 --37 Insert a new employee into employees with all the required details.
 insert  into employees values(209,'Uzma','Hidayat','CDA','515.233.333',2023-09-09,'It_Pro',24000,00,NUll )
 --38 Delete department 20
 delete departments where department_id=20;
 --39Change job ID of employee 110 to IT_PROG if the employee belongs to department 10 and the existing job ID does not start with IT.
 update employees set job_id= 'IT_PROG'  where employee_id=110 and department_id=10
-- 40.	Insert a row into departments table with manager ID 120 and location ID in any location ID for city Tokyo.
insert into departments values(271,'sales',120,1800)
select Null from employees
---  past paper 8th semester 
--1). Enlists all the employees whose First Name starts with ‘S’
select * from employees where first_name like 's%' 
--2 Enlist the Employees who have got at least 06 years of experience in the company
select  convert (varchar(3),datediff(month,hire_date,getdate())/12)+'years'+convert(varchar(2),datediff(day,hire_date,getdate())% 12)+ 'months'
AS experience from employees 

select  first_name , hire_date, dateadd(year,-6,getdate()) as experience from employees

--3Select number of employees who have been promoted exactly twice since they have been hired
SELECT COUNT(*) AS employee_count
FROM employees
--WHERe   = 2;
--4 Create a view that displays departments who have not been assigned any manager
CREATE VIEW departments_without_manager AS
SELECT department_id, department_name
FROM departments
WHERE manager_id IS NULL;

--5 Display Manager name,


--2nd time 
SELECT d.department_id, d.department_name, d.manager_id, e.first_name 
FROM departments d 
INNER JOIN employees e 
ON (d.manager_id = e.employee_id);
--6 Delete employees who are working in Marketing department
delete from employees where  job_id='St_Man';
--7Increase the salaries by 10%, of those employees who are getting less than 5000 salaries.
update   employees set  salary =salary+ (salary*10/100)  where salary <=5000
--8Display names of all departments along with only those employees (names) who work in any department
select  d.department_id, d.department_name ,d.manager_id, d.location_id, e.first_name from departments d inner join 
employees e on e.department_id=d.department_id

SELECT d.department_name, e.first_name AS employee_name
FROM departments d
INNER JOIN employees e ON d.department_id = e.department_id;
--9Create a view where we have year-wise, and designation wise number of employees hired in the company
create view year_wise as select count(*) from empolyees hire_date group by datepart(yyyy,hire_date,getdate());
--10Insert a record into Employee table using a parameterized stored procedure.
create proc emp @employee_id int ,@first_name varchar(100),@last_name varchar(100),@email varchar(100),@phone_number varchar(100),
@hire_date date,@job_id int ,@salary varchar(200),@commission_pct varchar(100),@manager_id varchar(100),

 As 
begin 
insert into employees(employee_id,first_name, last_name ,email,phone_number,hire_date) values(@employee_id, @first_name
,@last_name,@email,@phone_number,@hire_date)
end
exec emp @employee_id=208, @first_name='Ayesha',@last_name='AMra',@email='cvb',@phone_number='650.507.8922',@hire_date='1998-08-12'
-- maam shafaq queries 

 --1write a SQL query to find all those employees who work in department ID 80 or 40
 select * from employees where department_id in(80,40)
 select  e.employee_id ,e.first_name,e.last_name,e.email,e.phone_number ,d.department_id,d.department_name from employees e  left join 
 departments d on e.department_id=d.department_id  where d.department_id =80 or d.department_id=40 
 --2write a SQL query to calculate the average salary of employees for each job title.
 select e.employee_id,avg(salary) ,j.job_id , j.job_title from employees e left join jobs  j on e.job_id=j.job_id    
 
	--3add an attributes of credit card in employees table which must not accept values other than the formate
 --xx--xx-xxxx-xxxx-xxxx in the form of number only 
 alter table employees add  credit_card varchar(19)
 alter table employees add constraint credit_card  CHECK (credit_card LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
       AND credit_card NOT LIKE '%[^0-9-]%'
       AND credit_card NOT LIKE '%0d%0a%')
--4display manager name ,department name , the manager name should be a concatenated form of first name and last name
--same 
--5)Display employees who joined in the current year.
select *  from employees  where datepart(YYYY,hire_date)=year(getdate())
--6Display details of jobs in the descending order of the title
select * from jobs order by job_title desc
--8display which employees served in which department for how many months 
select datediff(mm,hire_date,getdate()) as total_month from employees 
--9 create a view which display the manager name of every department 
CREATE VIEW department_managers AS
SELECT d.department_id, e.first_name AS manager_name
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id; 
--10ncrease the salaries by 10% of those employees who are getting less than 5000 salaries same 
--11insert a record into employee table using a paramterized stored procdure-- same

--create a paramertized srored procedure which deletes employees record on the bases of 
--first_name , last_name and job_id
create proc emppta @ first_name varchar(100), @last_name varchar(200),@job_id varchar(100)
as 
begin 
delete from employees where first_name=@first_name or last_name=@last_name or job_id=@job_id 
end
exec emppta 'maryam','hidyat',67
--13Display employees where the first name or last name starts with S
select * from employees where  first_name like 's%' and  last_name like '%s'
--14Display job Title, the difference between minimum and maximum salaries for jobs with max salary
--in the range 10000 to 20000.
select job_title ,max_salary-min_salary difference from jobs where max_salary between 1000 and 20000
 

 --- mam shafaq 
 --1) Display details of employee with ID 150 or 160.
 select * from employees where employee_id =150 or  employee_id =160
 --2.Display details of jobs in the descending order of the title.
 select * from jobs order by job_title desc 
 --3.	Display department name and manager first name.
 select d.department_id , d.department_name ,m.manager_id,m.manager_name from departments d inner join manager m
 on d.department_id=m.manager_id
 --4Increase the salaries by 10% of those employees who are getting less than 5000 salaries 
 update   employees set  salary =salary+ (salary*10/100)  where salary <=5000
 --5Insert a record into employee table using a parameterized stored procedure
 create proc emp @employee_id int ,@first_name varchar(100) ,@last_name  varchar(100),@email varchar(100)
 as begin
 insert into employees (employee_id,first_name,last_name,email) values(@employee_id,@first_name,@last_name,
 @email)
 end
 exec emp 12,'Maryam','Ayesha','yty';
 --6Display employees where the first name or last name starts with S
 select * from employees where first_name like 's%' and last_name like 's%'
 --7.	Display employees who joined in the current year.
 select * from employees where datepart(yyyy,hire_date)=year(getdate())
 --8
 SELECT CONCAT(E.First_Name, ' ', E.Last_Name) AS ManagerName, D.Department_Name
FROM Employees AS E
JOIN Departments AS D ON E.Department_ID = D.Department_ID

 --9create a view which display the manager name of every department
 Create view  department_managers AS
select d.department_id, e.first_name  as manager_name
From departments d
JOIN employees e ON d.manager_id = e.employee_id;
--10.	Delete employees who are working in Marketing department
delete from employees where job_id='marketing_dep';
--11	
--a)Create a table with 2 character field and 2 numeric fields 
--.all constraints should be properly named.

create table emp1 (emp_id  int  , emp_salary  varchar(100) ,emp_name varchar(100) not null , emp_adress varchar(100) 
primary key(emp_id))
--b) Insert 3 records in the table
insert into emp1 (emp_id,emp_salary,emp_adress,emp_name) values (10,3000,'vcb','Ali'),(11,3800,'tcb','hammad'),
(12,4000,'xyz','asif')
--c)	Using the update command change a value for one of the records
update emp1 set emp_name='Ayesha' where emp_id=12


--1 Display the first name and join date of the employees who joined between 2002 and 2005.
select first_name , hire_date from employees where  datepart(yyyy,hire_date) =2002 or  datepart(yyyy,hire_date) =2005 
--2.	Display which employees served in which department for how many months
select datediff(mm,hire_date,getdate()) as totalmonth from employees 
--3.	Remove attribute of salary from employee table
alter  table employees drop column salary
--4.	Display first name, salary, commission pct, and hire date for employees with salary less than 10000.
select first_name,salary,commission_pct,hire_date from employees where salary <10000
--5.	Create a parameterized stored procedure which deletes employees record on the bases of first
--name last name and job title
create proc pro @first_name varchar(100),@last_name varchar(100), @job_id varchar(100) 
as begin 
delete from employees where  @first_name=first_name and @last_name=last_name and @job_id=job_id
end
exec pro 'joe','alex','IA2_Man'
--6.	The company has decided  to change primary key of employees to email attribute .considering the name of 
--primary key constraints as email_pk, you are decided to make this change 
alter table employee drop constraint PK_employee
alter table employee add constraint  email_PK primary key(email)

--7Insert a record in job table
insert into jobs ( job_id ,job_title,max_salary,min_salary) values ('IA3_MAN','programmer',8000,23000)
--8 Display the name and commission of all employees together with another column that
--shows their commission increased by 10%
select first_name , commission_pct,(commission_pct*10/100) as increase_comm from employees 
--9Create location table
create table location (id int , name varchar(100), adress varchar(100));
--10Display all the distinct job titles on which no employee is working at this time
SELECT DISTINCT Job_id
FROM Employees
WHERE Employee_ID NOT IN (
    SELECT DISTINCT Employee_ID
    FROM job_history
    WHERE  hire_date BETWEEN Start_Dat AND End_Date
)




--11change job ID of employee 110 to IT_PROG if the employee belongs to department
--10 and the existing job ID does not start with IT.
update  employees  set job_id='IT_PROG' where employee_id=110 and department_id=10

