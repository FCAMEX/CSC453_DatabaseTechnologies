--1

Select Fname, Minit, Lname from Employee where ssn in (select essn from Works_On where pno in (select pnumber from Project));


--2 

select d.dnumber, d.dname, avg(s.salary) from Department d, employee s 
where d.dnumber = s.dno 
group by d.dnumber, d.dname 
order by d.dnumber asc;

--3 

select Fname, Minit, Lname from Employee, Department
where employee.ssn = department.mgr_ssn
minus
select Fname, Minit, Lname from Employee, Dependent
where employee.ssn = Dependent.essn;

--4

Select Fname, Minit, Lname from Employee where dno in (

Select dno from Employee where salary = (select min(salary) from employee)
);


--5

Select Dname, Count(distinct employee.ssn), Count(Dependent.essn)
from Employee Inner Join Department on Employee.dno = department.dnumber
Left Join Dependent on Employee.ssn = dependent.essn
Group by Dname;

--6

Select Fname, Minit, Lname, salary from Employee where salary >
(Select max(salary) from employee) -20000;
