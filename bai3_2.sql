select * from students
---------------------
select * from students
where class = 'AV1' 
-----------------------
update students set class = 'AV2'
where studentID = 'AV0807012'
-------------------------
select subjectID, count(subjectID) as N'số sinh viên'
from mark
group by subjectID
---------------------------
select * 
from students
where class = 'AV2'
order by studentName asc
---------------------------------
select students.studentID,studentName 
from students inner join mark on students.studentID=mark.studentID
where subjectID = 'S001' and theory <10 and date ='06/05/2008'
-----------------------------------
select count(mark.studentID) as' tong so sinh vien'
from mark
where subjectID = 'S001' and theory <10
---------------------------------
select * 
from students
where class = 'AV1' and dateofBirth > '01/01/1980'
-----------------------------------
delete from mark
where studentID = 'AV0807011'

delete from students
where studentID = 'AV0807011'
--------------------------------

select students.studentID,studentName,subjectName,theory,practical,date
from students inner join mark on students.studentID=mark.studentID inner join subjects on mark.subjectID=subjects.subjectID
where subjects.subjectID ='S001' and date = '06/05/2008'