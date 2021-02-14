select * from department
------------------------
select * from employee
-------------------------
select empNo,fname,lname
from employee
where fname = 'Kate'
--------------------------
select fname+lname as 'Full Name',salary,salary+(salary*10)/100 as N'tăng salary'
from employee
--------------------------
select fname,lname,hireDate
from employee
where year(hireDate)= 1981 
order by lname asc
----------------------------
select departmentName,avg(salary) as N'trung bình lương',max(salary) as 'max lương',min(salary) as 'min lương'
from employee inner join department on employee.departmentNo=department.departmentNo
group by departmentName
-----------------------------
select departmentNo,count(departmentNo) as N'số người trong phòng'
from employee 
group by departmentNo
-----------------------------
select department.departmentNo,departmentName,fname+lname as 'Full Name',job,salary
from employee inner join department on employee.departmentNo=department.departmentNo
-----------------------------
select employee.departmentNo,count(*)AS 'Tongnguoi'
into SoNguoi
from employee
group by employee.departmentNo

select department.departmentNo,department.departmentName,department.location,SoNguoi.Tongnguoi
from department inner join SoNguoi on department.departmentNo=SoNguoi.departmentNo

