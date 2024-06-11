create database WebServiceDB
use WebServiceDB

create table Emp
(
id int primary key identity,
name varchar(50),
address varchar(50),
age int,
country int,
state int
)


create table Country
(
cid int primary key identity,
cname varchar(50)
)

create table State
(
sid int primary key identity,
cid int,
sname varchar(50)
)

create procedure sp_Country
as
begin
select * from Country
end


create proc sp_State
@cid int
as
begin
select * from State where cid=@cid
end

insert into State(cid,sname)values(1,'Uttar Pradesh'),(1,'Delhi'),(1,'Haryana')
insert into State(cid,sname)values(2,'Ratnapura'),(2,'Galle'),(2,'Badulla')
insert into State(cid,sname)values(3,'California'),(3,'Texas'),(3,'Florida')

create proc sp_Emp
@mode int=0,
@id int=0,
@name varchar(50)=null,
@address varchar(50)=null,
@age int=0,
@country int=0,
@state int=0
as
begin
if(@mode = 1)
begin
insert into Emp(name,address,age,country,state)values(@name,@address,@age,@country,@state)
end
if(@mode = 2)
begin
select * from Emp -- join Country on Emp.country = Country.cid join State on Emp.state = State.sid
end
if(@mode = 3)
begin
delete Emp where id=@id
end
if(@mode = 4)
begin
select * from Emp where id=@id
end
if(@mode = 5)
begin
update Emp set name=@name,address=@address,age=@age,country=@country,state=@state where id=@id
end
end
