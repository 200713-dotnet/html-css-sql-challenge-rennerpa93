use master;
GO

drop database EmployeeCustomerDb;
GO

-------

create database EmployeeCustomerDb;
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