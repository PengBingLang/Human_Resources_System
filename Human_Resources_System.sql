#建立数据库#
create database Human_Resources_System;
use Human_Resources_System;


#职称表#
create table rankTab
(
rankID int primary key,
rankName varchar(50) not null,
rankSalary double not null default 0
);
select * from rankTab;
insert into rankTab values
(0,'管理员',0),(1,'实习',500),(2,'职员',1000),(3,'部门经理',3000);

#部门表#
create table departmentTab
(
departmentID int primary key,
departmentName varchar(50) not null
);
select * from departmentTab;
insert into departmentTab values
(1,'技术部'),(2,'人事部'),(3,'行政部');

#员工信息表#
create table employeeInfoTab
(
employeeNumber int primary key,
employeePwd varchar(50) not null,
employeeName varchar(50) not null,
employeeID varchar(50) not null,
employeeGender enum('男','女') not null,
employeeTel varchar(50) not null,
employeeAddress varchar(50) not null,
employeeOutTime date not null,
rankID int not null default 1,
departmentID int not null,
constraint foreign key(rankID) references rankTab(rankID),
constraint foreign key(departmentID) references departmentTab(departmentID)
);
select * from employeeInfoTab;
insert into employeeInfoTab values
(0,'123','管理员','admin','男','110','武汉','2017-01-01',0,1),
(2017010101,'123','张三','421124','女','170','武汉','2017-01-01',1,2),
(2017010102,'123','李四','421124','男','171','武汉','2017-01-01',2,2);

#根据个人信息查询密码#
select employeePwd from employeeInfoTab where
employeeNumber='0' and employeeName='管理员' and employeeID='admin' and
employeeGender='男' and employeeTel='110' and employeeOutTime='2017-01-01';

#考勤数据表#
create table attendanceInfoTab
(
attendanceInfoID int primary key auto_increment,
employeeNumber int not null,
constraint foreign key(employeeNumber) references employeeInfoTab(employeeNumber),
attendanceDate datetime not null,
attendanceType enum('上班签到','下班签到') not null
);
Select * from attendanceInfoTab;
insert into attendanceInfoTab(employeeNumber,attendanceDate,attendanceType) values
(2017010101,'2017-01-01 08:00:00','上班签到'),
(2017010101,'2017-01-01 16:00:00','下班签到');
insert into attendanceInfoTab(employeeNumber,attendanceDate,attendanceType) values
(0,'2017-01-01 08:00:00','上班签到'),
(0,'2017-01-01 16:00:00','下班签到');

#查询指定日期区间的签到信息#
select DATE_FORMAT(attendanceDate,'%Y-%m-%d %H:%i:%s') as attendanceDate from attendanceInfoTab where
employeeNumber='0' and attendanceDate>='2017-01-01 00:00:00' and 
attendanceDate<='2017-01-09 23:59:59' and attendanceType='上班签到';

#考勤统计表#
create table attendanceCountTab
(
attendanceCountID int primary key auto_increment,
employeeNumber int not null,
constraint foreign key(employeeNumber) references employeeInfoTab(employeeNumber),
countBegin date not null,
countEnd date not null,
countLate int not null,
countLackTime int not null,
countAttendance int not null,
countLeave int not null,
countPaidLeave int not null default 0,
totalAttendance int not null,
noAttend int not null
);
Select * from attendanceCountTab;

#测试信息#
insert into attendanceCountTab values(1,0,'2016-12-01','2016-12-31',1,2,20,2,0,25,0);

#考勤数据查询#
select e.employeeNumber,e.employeeName,d.departmentName,DATE_FORMAT(a.countBegin,'%Y-%m-%d') as countBegin,
DATE_FORMAT(a.countEnd,'%Y-%m-%d') as countEnd,a.countLate,a.countLackTime,a.countAttendance,a.countLeave,a.countPaidLeave,a.totalAttendance 
from attendanceCountTab as a,employeeInfoTab as e,departmentTab as d 
where a.employeeNumber=e.employeeNumber and e.departmentID=d.departmentID;

#请假表#
create table leaveTab
(
	leaveID int primary key auto_increment ,
    employeeNumber int not null,
		constraint foreign key(employeeNumber) references employeeInfoTab(employeeNumber),
    dateBging date not null,
    dateEnd date not null,
    leaveReason varchar(50) not null,
    leaveType enum('普通请假','带薪休假') not null default '普通请假'
);
Select * from leaveTab;
insert into leaveTab values
(1,2017010102,'2017-01-02','2017-01-03','病假','普通请假'),
(2,2017010102,'2017-01-04','2017-01-05','探亲假','带薪休假');

#查询与指定日期区间有重合的请假记录#
select * from leaveTab where dateEnd>'2017-01-03' and dateBging>'2017-01-04';

#工资信息表#
create table salaryInfoTab(
	salaryInfo int primary key auto_increment,
    attendanceCountID int not null,
		constraint foreign key(attendanceCountID) references attendanceCountTab(attendanceCountID),
    basicSalary double not null,
    houseFund double not null,
    pension double not null,
    health double not null,
    unemployment double not null,
    reimbursement double not null,
    bonus double not null,
    totalSalary double not null
);
select * from salaryInfoTab;

#测试数据#
insert into salaryInfoTab values(1,1,2000.0,-100.0,-100.0,-100.0,-100.0,200.0,200.0,2001.0);

#工资查询视图#
select a.employeeNumber,DATE_FORMAT(countBegin,'%Y-%m-%d') as countBegin,DATE_FORMAT(countEnd,'%Y-%m-%d') as countEnd,
countLate,countLackTime,countLeave,countPaidLeave,countAttendance,totalAttendance,basicSalary,
rankSalary,houseFund,pension,health,unemployment,reimbursement,bonus,totalSalary 
from attendanceCountTab as a,salaryInfoTab as s,employeeInfoTab as e,rankTab as r where 
(a.attendanceCountID=s.attendanceCountID and a.employeeNumber=e.employeeNumber and e.rankID=r.rankID) and a.employeeNumber=0;


#通知表#
create table informTab
(
informID int primary key auto_increment,
employeeNumber int not null,
constraint foreign key(employeeNumber) references employeeInfoTab(employeeNumber),
informTime date not null,
informValidityEnd date not null,
informTitle varchar(50),
informInfo varchar(50) not null
);
select * from informTab;
insert into informTab(employeeNumber,informTime,informValidityEnd,informTitle,informInfo) values
(0,'2015-01-01','2016-03-01','玩','2017年3月1日全体员工春游，上午8点集合'),
(2017010101,'2017-01-02','2017-02-05','体检','2017年2月5日全体员工体检，上午8点集合');

#有效期大于今天的通知#
select employeeInfoTab.employeeName,DATE_FORMAT(informTab.informTime,'%Y-%m-%d') as informTime,
DATE_FORMAT(informTab.informValidityEnd,'%Y-%m-%d') as informValidityEnd,informTab.informTitle,informTab.informInfo 
from informTab join employeeInfoTab on informTab.employeeNumber = employeeInfoTab.employeeNumber
where informTab.informValidityEnd > now();

select DATE_FORMAT(now(),'%Y-%m-%d');#当前系统时间#


drop database Human_Resources_System;
drop TABLE IF EXISTS informTab;