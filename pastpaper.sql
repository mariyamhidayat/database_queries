-- creat  a location table 

create table location (id int , name varchar(100), adress varchar(100));
--insert a record in a job table 
insert into jobs(job_id,job_title,max_salary,min_salary) values (24,'programmer',5000,10000)
--remove an attribute of salary from employees table 
alter  table employees drop column salary 
select* from manager
-- create a view  which displays the manager name of every department 
create view  manager_view as select manager_name from manager 
select * from manager_view

--increase the 10%  in the salaries of those employees who belong to computer science 
update   employees set  salary =salary+ (salary*10/100)  where job_id='IT_PROG';
--display which employees served in which department for how many 
select datediff(mm,hire_date,getdate()) from employees 

--Add an attribute of credit card in empolyees table in which must not accept walues an onther than the format
--xxxx-xxxx-xxxx-xxxx in the form of numbers only 

 
ALTER TABLE employees
ADD credit_card VARCHAR(19)
ALTER TABLE employees
ADD CONSTRAINT credit_card
CHECK (credit_card LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
       AND credit_card NOT LIKE '%[^0-9-]%'
       AND credit_card NOT LIKE '%0d%0a%') 
--display the name and the commission of all the employees together with onther column that shows in their 
-- commission increased by 10% 
select first_name ,commission_pct ,(commission_pct*10/100) as increase_com from employees 
select first_name, commission_pct ,((commission_pct - 100) / 100.0) * 100 AS commission_increase from employees
select * from departments 

--joins query 
select * from employees
select * from jobs
-- inner join(display the all data of two tables)
select * from employees as e inner join jobs  as j on e.job_id=j.job_id -- e and j alies name 

 select e.employee_id,e.first_name,e.phone_number, j.job_id,j.job_title,j.max_salary  from employees as e
 inner join jobs  as j on  e.job_id=j.job_id where j.job_id='ST_MAN'
 -- left join (the left join return the all records from left table and matched the records from the right table 
 select * from employees as e left join jobs  as j on e.job_id=j.job_id  order by e.first_name
 -- right join 
 select * from employees as e right join jobs  as j on e.job_id=j.job_id  
 where e.salary >4000
 -- cross join  
  select * from employees as e cross join jobs  as j
  select e.first_name  ,j.job_title as title from employees as e cross join jobs as j 



  alter table employees add credit_card varchar(100)
  alter table employee add constraint credit_card check ( credit_card like ('[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
  and credit_card not like ('%[^0-9-]%') and credit_card not like ('%0d%0a'))