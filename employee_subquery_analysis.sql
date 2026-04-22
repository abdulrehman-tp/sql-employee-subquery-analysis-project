use basic_project;

create table emp_salary(
emp_id int primary key,
emp_name varchar(50),
department varchar(50),
salary int);
insert into emp_salary(emp_id, emp_name, department, salary) values
(1,'Ali','IT',60000),
(2,'Sara','HR',45000),
(3,'John','IT',70000),
(4,'Ayesha','Finance',65000),
(5,'David','IT',72000),
(6,'Fatima','HR',48000),
(7,'Ahmed','Finance',55000),
(8,'Zara','IT',68000),
(9,'Usman','Marketing',50000),
(10,'Noah','Marketing',52000),
(11,'Liam','IT',71000),
(12,'Olivia','HR',46000),
(13,'Ethan','Finance',58000),
(14,'Sophia','IT',69000),
(15,'Mason','Marketing',51000),
(16,'Isabella','HR',47000),
(17,'Lucas','Finance',62000),
(18,'Mia','IT',73000),
(19,'Logan','Marketing',54000),
(20,'Amelia','HR',49000),
(21,'James','Finance',66000),
(22,'Charlotte','IT',75000),
(23,'Benjamin','Marketing',53000),
(24,'Harper','HR',48000),
(25,'Elijah','IT',77000),
(26,'Evelyn','Finance',61000),
(27,'Alexander','Marketing',55000),
(28,'Abigail','HR',50000),
(29,'Daniel','IT',72000),
(30,'Emily','Finance',64000),
(31,'Matthew','IT',68000),
(32,'Avery','Marketing',52000),
(33,'Joseph','Finance',59000),
(34,'Ella','HR',47000),
(35,'Samuel','IT',76000),
(36,'Scarlett','Marketing',56000),
(37,'David Jr','Finance',63000),
(38,'Victoria','HR',49000),
(39,'Carter','IT',70000),
(40,'Aria','Marketing',54000),
(41,'Wyatt','Finance',60000),
(42,'Grace','HR',48000),
(43,'Jayden','IT',71000),
(44,'Chloe','Marketing',55000),
(45,'Luke','Finance',62000),
(46,'Lily','HR',47000),
(47,'Henry','IT',74000),
(48,'Hannah','Marketing',53000),
(49,'Sebastian','Finance',65000),
(50,'Nora','HR',46000);


-- Project Questions -> Analyst Level

-- 1. Show department with highest average salary

select department, avg(salary) as a from emp_salary
group by  department
order by a desc limit 1;

-- 2. second highest salary (interview favorite)?

select * from emp_salary
where salary < (select max(salary) as ms from emp_salary)
order by salary desc limit 1 ;

-- 3. Show employees earning more than IT department average 

select * from emp_salary where salary >
(select avg(salary) from emp_salary where department = "IT");

-- 4. Show employees earning less than HR department average
select * from emp_salary where salary <
(select avg(salary) from emp_salary where department = "HR");

-- 5. Show employees whose salary is equal to second highest salary

select * from emp_salary  where salary =
(select max(salary ) from emp_salary where salary <
(select max(salary) from emp_salary));

-- 6. Show employees who earn more than overall average but less than max salary

select * from emp_salary 
where salary > (select avg(salary) from emp_salary)
and salary <(select max(salary) from emp_salary);

-- 7.Show employees earning more than THEIR department average

select * from emp_salary e 
where salary > ( select avg(salary) from emp_salary a
 where  a.department = e.department);

-- 8. Show employees who are HIGHEST paid in their department

select * from emp_salary e 
where salary = (select max(salary) from emp_salary
where department = e.department);

-- 9. Show department with highest average salary

select department, avg(salary) e from emp_salary 
group by department
order by e desc limit 1;

 -- 10. Show departments where average salary is greater than overall average salary

select department, avg(salary) as avgs from emp_salary
group by department
having avgs > (select avg(salary) from emp_salary)
order by avgs desc;
 
-- 11. Show employees whose salary is greater than ALL employees in HR department

select * from emp_salary 
where salary > all (select salary from emp_salary
where department = "HR");


-- 12 Show employees whose salary is less than ANY employee in IT department

select * from emp_salary
where salary < any (select salary from emp_salary
where department = "IT" );




