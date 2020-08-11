use master;
GO

drop database EmployeeCustomerDb;
GO

-------

create database EmployeeCustomerDb;
go

use EmployeeCustomerDb;
go

create schema Employee;
go

create table Employee.Employee
(
  ID int not null identity(1,1) primary key,
  FirstName varchar(100) null,
  LastName varchar(100) null,
  SSN varchar(11) null,
  DeptID int null
);

create table Employee.EmpDetails
(
  ID int not null identity(1,1) primary key,
  EmployeeID int not null,
  Salary money null,
  Address_1 VARCHAR(255) null,
  Address_2 VARCHAR(255) null,
  City varchar(100) null,
  State varchar(50) null,
  Country varchar(100) null
);

create table Employee.Department
(
  ID int not null identity(1,1) primary key,
  Name varchar(255) null,
  Location varchar(255) null
);

go

alter table Employee.Employee
  add constraint FK_DeptID foreign key (DeptID) references Employee.Department (ID);

alter table Employee.EmpDetails
  add constraint FK_EmployeeID foreign key (EmployeeID) references Employee.Employee (ID);


--------

insert into Employee.Department(Name, Location)
  values('Dept 1', 'Michigan');
insert into Employee.Department(Name, Location)
  values('Dept 2', 'Texas');
insert into Employee.Department(Name, Location)
  values('Marketing', 'Virginia');

insert into Employee.Employee(FirstName, LastName, SSN, DeptID)
  values('Patrick','Parker','123456789',1);
insert into Employee.Employee(FirstName, LastName, SSN, DeptID)
  values('Kevin','Parker','123456781',2);
insert into Employee.Employee(FirstName, LastName, SSN, DeptID)
  values('Joe','Shmoe','123456782',3);
insert into Employee.Employee(FirstName, LastName, SSN, DeptID)
  values('Tina','Smith','123456789',3);

insert into Employee.EmpDetails(EmployeeID, Salary, Address_1, Address_2, City, State, Country)
  values(1,50000,'Address','Address Again','Chicago','Illinois','United States');
insert into Employee.EmpDetails(EmployeeID, Salary, Address_1, Address_2, City, State, Country)
  values(2,50000,'Address','Address Again','Chicago','Illinois','United States');
insert into Employee.EmpDetails(EmployeeID, Salary, Address_1, Address_2, City, State, Country)
  values(3,50000,'Address','Address Again','Chicago','Illinois','United States');
insert into Employee.EmpDetails(EmployeeID, Salary, Address_1, Address_2, City, State, Country)
  values(3,50000,'Address','Address Again','Chicago','Illinois','United States');
go

--------
Select * from Employee.Employee;

Select * from Employee.Employee
  where DeptID=3;

Update Employee.EmpDetails
  set Salary = 90000
  where ID=4;