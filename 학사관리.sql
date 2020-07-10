create table professors(
pcode char(3) primary key,
pname varchar(15) not null,
pdept varchar(30),
hiredate date not null,
title varchar(15),
salary int default 0
);

desc professors;
drop table professors;
drop table students;
drop table courses;
drop table enrollments;

create table students(
scode char(8) primary key,
sname varchar(15),
sdept varchar(30),
year char(1)  default 1 not null,
birthday date,
advisor char(3),
foreign key (advisor) references professors(pcode)
);

desc students;

create table courses(
lcode char(4),
lname varchar(30),
hours int,
room  char(3),
instructor char(3),
capacity int,
persons int,
primary key(lcode),
foreign key (instructor) references professors(pcode)
);

desc courses;

create table enrollments(
lcode char(4),
scode char(8),
edate date,
grade int default 0,
primary key(lcode, scode),
foreign key(lcode) references courses(lcode),
foreign key(scode) references students(scode)
);

desc enrollments;

drop table enrollments;

INSERT INTO Professors(PCode, PName, pDept, HireDate, Title, Salary) VALUES('221','�̺���','����','75/04/03','������',3000000);
INSERT INTO Professors(PCode, PName, pDept, HireDate, Title, Salary) VALUES('228','���籤','����','91/09/19','�α���',2500000);
INSERT INTO Professors(PCode, PName, pDept, HireDate, Title, Salary) VALUES('311','������','����','94/06/09','�α���',2300000);
INSERT INTO Professors(PCode, PName, pDept, HireDate, Title, Salary) VALUES('509','����ȯ','����','92/10/14','������',2000000);

select*from enrollments;

INSERT INTO Students(Scode, Sname, sDept, Year, Birthday, Advisor) VALUES('92414029','������','����','3','73/10/06','228');
INSERT INTO Students(Scode, Sname, sDept, Year, Birthday, Advisor) VALUES('92414033','��â��','����','4','73/10/26','221');
INSERT INTO Students(Scode, Sname, sDept, Year, Birthday, Advisor) VALUES('92514009','������','����','4','73/11/16','311');
INSERT INTO Students(Scode, Sname, sDept, Year, Birthday, Advisor) VALUES('92514023','������','����','4','73/08/29','311');
INSERT INTO Students(Scode, Sname, sDept, Year, Birthday, Advisor) VALUES('92454018','�̿���','����','3','74/09/30','509');
INSERT INTO Students(Scode, Sname, sDept, Year, Birthday, Advisor) VALUES('95454003','���翵','����','4','76/02/06','509');
INSERT INTO Students(Scode, Sname, sDept, Year, Birthday, Advisor) VALUES('95414058','������','����','4','76/03/12','221');
INSERT INTO Students(Scode, Sname, sDept, Year, Birthday, Advisor) VALUES('96414404','�����','����','3','77/12/22','228');

INSERT INTO Courses(LCode, Lname, Hours, Room, Instructor, Capacity, Persons) VALUES('C301','����ó����', 3 ,'506','221', 100, 80);
INSERT INTO Courses(LCode, Lname, Hours, Room, Instructor, Capacity, Persons) VALUES('C401','�����ͺ��̽�', 3,'414','221', 80, 80);
INSERT INTO Courses(LCode, Lname, Hours, Room, Instructor, Capacity, Persons) VALUES('C421','�˰���', 3 ,'510','228', 80, 72);
INSERT INTO Courses(LCode, Lname, Hours, Room, Instructor, Capacity, Persons) VALUES('C312','�ڷᱸ��', 2 ,'510','228', 100, 60);
INSERT INTO Courses(LCode, Lname, Hours, Room, Instructor, Capacity, Persons) VALUES('E221','��ȸ��', 3 ,'304','311', 100, 80);
INSERT INTO Courses(LCode, Lname, Hours, Room, Instructor, Capacity, Persons) VALUES('A109','�ѱ��ǰ��๮ȭ', 2,'101','509', 120, 36);

INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C401','92414033','98/03/02',85);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C301','92414033','98/03/02',80);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C421','92414033','98/03/02', 0);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C401','95414058','98/03/03',90);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C312','95414058','98/03/03',80);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C401','92514023','98/03/03',70);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C301','92414029','98/03/03',90);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C421','92414029','98/03/03',0);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C312','92414029','98/03/03',70);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('E221','92414029','98/03/03',75);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('A109','92414029','98/03/03',90);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C301','92514009','98/03/03',70);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('E221','92514009','98/03/03',85);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C301','96414404','98/03/04',75);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('C312','92454018','98/03/04',90);
INSERT INTO Enrollments(Lcode, Scode, Edate, Grade) VALUES('A109','95454003','98/03/05',85);

commit;
--���� 6������ ����
select*from professors;

select  pname, dept, title from professors;

--distinct�� �ߺ� ����
select distinct(dept) from professors;

select sname, scode, birthday from students where dept='����';

select*from professors where hiredate < '1993/03/01';

select*from students where advisor <> '221';

Select Sname,Dept,Year from Students where Dept in ('����', '����');

select s.sname, s.dept, p.pname, p.dept
from students s, professors p
where s.advisor = p.pcode;

/* ����� �л����� �й�, �л���, ������������ ���*/
select s.scode, s.sname, p.pname
from students s ,professors p
where s.dept='����' and s.advisor=p.pcode;

/* ����ó������ �����ϴ� ������ ������, �����а��� ��� */
select p.pname, p.dept, c.lcode
from professors p, courses c
where c.lname='����ó����' and c.instructor=p.pcode;
/* ����ó������ ������û�� �л����� �й�, �л���, ������ ��� */
select s.scode, s.sname, e.grade
from courses c, students s, enrollments e
where c.lname='����ó����' and e.scode=s.scode and e.lcode=c.lcode;
/* ������ �л��� ������û�� ������� �����ڵ�, �����, ������ ��� */
select e.lcode, c.lname, e.grade
from students s, enrollments e, courses c
where s.sname='������' and e.scode=s.scode and e.lcode=c.lcode;
/* �̺��� ������ �����ϴ� ���µ��� ���¹�ȣ, ���¸� ��� */
select c.lcode, c.lname, p.pname
from courses c, professors p
where p.pname='�̺���' and c.instructor=p.pcode;
/* ����ó������ ������û�� �л����� ������ 90�� �̻��� �л����� �й�, �л��� */
select e.grade, s.scode, s.sname, c.lname
from courses c, students s, enrollments e
where c.lname='����ó����' and e.scode=s.scode and e.grade >= 90;
/* ������ �л��� ������û�� ������� ������ 90���̻��� ������ ���¹�ȣ, ���¸� */
select s.sname, e.grade, c.lcode, c.lname
from students s, enrollments e, courses c
where s.sname='������' and c.lcode=e.lcode and e.scode=s.scode and e.grade >=90;


select s.*, p.* from students s, professors p where s.advisor=p.pcode;

select s.*, s.dept sdept, p.*, p.dept pdept from students s, professors p where s.advisor=p.pcode

create view sview as
(select scode,sname,s.dept sdept,birthday,pname,p.dept pdept from students s, professors p where s.advisor=p.pcode);

create view sview as 
(select scode,sname,s.dept sdept,birthday,pname,p.dept pdept from students s, professors p where s.advisor=p.pcode);

select*from sview where scode like '%%';

create view cview as
(select c.lcode, c.lname, c.room, p.pname, p.dept
from courses c, professors p 
where p.pcode=c.instructor);

/*1.�������̺� view����*/--���� �̸��� Į���� ������ ������ �༭ ����
create view view_students as
(select s.scode,s.dept sdept,s.year,s.birthday,s.sname,p.pname,p.dept pdept
from students s,professors p
where s.advisor=p.pcode);

/*2.�������̺� view����*/
create view view_courses as
(select c.lcode,c.lname,c.room,p.pname,p.dept
from courses c,professors p
where c.instructor=p.pcode);

/*3.�������̺� view����*/
create view view_enrollments as
(select c.lcode,c.lname,s.scode,s.sname,e.edate,e.grade
from courses c,students s,enrollments e
where c.lcode=e.lcode and s.scode=e.scode);

select*from view_students;

drop view cview;

commit;

select*from courses;

select*from students;

select*from professors;

select*from enrollments;

