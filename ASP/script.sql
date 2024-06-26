USE [ASPCRUD]
GO
/****** Object:  Table [dbo].[City]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[sttid] [int] NULL,
	[cname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[cntid] [int] IDENTITY(1,1) NOT NULL,
	[cntname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cntid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[gender] [int] NULL,
	[age] [int] NULL,
	[mobno] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[jobprofile] [int] NULL,
	[country] [int] NULL,
	[state] [int] NULL,
	[city] [int] NULL,
	[photo] [varchar](50) NULL,
	[subject] [int] NULL,
	[skills] [varchar](50) NULL,
	[comment] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobProfile]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobProfile](
	[jobid] [int] IDENTITY(1,1) NOT NULL,
	[jobname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[jobid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[jobid] [int] NULL,
	[sname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[sttid] [int] IDENTITY(1,1) NOT NULL,
	[cntid] [int] NULL,
	[sttname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sttid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Emp]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Emp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[mobno] [bigint] NULL,
	[gender] [int] NULL,
	[jp] [int] NULL,
	[skl] [nvarchar](50) NULL,
	[prof] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[age] [int] NULL,
	[country] [int] NULL,
	[state] [int] NULL,
	[city] [int] NULL,
	[comment] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_JP]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_JP](
	[jpid] [int] IDENTITY(1,1) NOT NULL,
	[jpname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[jpid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Skl]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Skl](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[jpid] [int] NULL,
	[sname] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (1, 1, N'New Delhi')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (2, 1, N'Mehrauli')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (3, 1, N'Firozabad')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (4, 2, N'Kanpur')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (5, 2, N'Lucknow')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (6, 2, N'Ayodhya')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (7, 3, N'Ahmedabad')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (8, 3, N'Surat')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (9, 3, N'Vadodara')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (10, 4, N'Shaoxing and Jinhua')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (11, 4, N'Zhejiang')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (12, 4, N'Jiaxing and Huzhou')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (13, 5, N'Wenchang')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (14, 5, N'Sansha')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (15, 5, N'Qionghai')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (16, 6, N'Anqing')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (17, 6, N'Bengbu')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (18, 6, N'Hefei')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (19, 7, N'Los Angeles')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (20, 7, N'San Diego')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (21, 7, N'San Jose')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (22, 8, N'Houston')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (23, 8, N'San Antonio')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (24, 8, N'Dallas')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (25, 9, N'Jacksonville')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (26, 9, N'Miami')
INSERT [dbo].[City] ([cid], [sttid], [cname]) VALUES (27, 9, N'Tampa')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([cntid], [cntname]) VALUES (1, N'India')
INSERT [dbo].[Country] ([cntid], [cntname]) VALUES (2, N'China')
INSERT [dbo].[Country] ([cntid], [cntname]) VALUES (3, N'USA')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([id], [name], [gender], [age], [mobno], [email], [password], [jobprofile], [country], [state], [city], [photo], [subject], [skills], [comment]) VALUES (1, N'Gulshan Singh Kumar', 1, 26, N'09911065342', N'gulshankumar.mailid01@gmail.com', N'', 1, 1, 1, 1, N'638478337953339943MyPhoto.jpeg', NULL, N'C#,SQL Server', N'Hello')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[JobProfile] ON 

INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (1, N'.Net')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (2, N'Java Script')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (3, N'MySql')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (4, N'React')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (5, N'Xamarin')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (6, N'Azure')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (7, N'Java')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (8, N'Jira')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (9, N'Go')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (10, N'TypeScript')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (11, N'Swift')
INSERT [dbo].[JobProfile] ([jobid], [jobname]) VALUES (12, N'Angular')
SET IDENTITY_INSERT [dbo].[JobProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (1, 1, N'C#')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (2, 1, N'SQL Server')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (3, 1, N'ASP.NET MVC')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (4, 2, N'HTML & CSS')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (5, 2, N'Node JS')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (6, 2, N'JQuery')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (7, 3, N'Execution skills')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (8, 3, N'Database management')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (9, 3, N'OLAP skills')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (10, 4, N'HTML + CSS')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (11, 4, N'JSX')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (12, 4, N'JavaScript Fundamentals + ES6')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (13, 5, N'HTML + CSS')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (14, 5, N'JSX')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (15, 5, N'JavaScript Fundamentals + ES6')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (16, 6, N'Xaml')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (17, 6, N'.NET/C#')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (18, 6, N'wpf and wcf')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (19, 7, N'testing')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (20, 7, N'security')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (21, 7, N'development and deployment')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (22, 8, N'OOP Concepts')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (23, 8, N'Object-Oriented Programming Concepts')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (24, 8, N'Java Build Tools')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (25, 9, N'Manage Atlassian')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (26, 9, N'Build and configure')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (27, 9, N'Configure Dashboards')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (28, 10, N'Experience with scripting')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (29, 10, N'design patterns')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (30, 10, N'Javascript, SOAP, REST Webservices')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (31, 11, N'OOPS Concept')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (32, 11, N'Objective-C')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (33, 11, N'Swift, Xcode, and Cocoa Touch')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (34, 12, N'Angular CLI')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (35, 12, N'TypeScript')
INSERT [dbo].[Skills] ([sid], [jobid], [sname]) VALUES (36, 12, N'Empathy')
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([sttid], [cntid], [sttname]) VALUES (1, 1, N'Delhi')
INSERT [dbo].[State] ([sttid], [cntid], [sttname]) VALUES (2, 1, N'Uttar Pradesh')
INSERT [dbo].[State] ([sttid], [cntid], [sttname]) VALUES (3, 1, N'Gujrat')
INSERT [dbo].[State] ([sttid], [cntid], [sttname]) VALUES (4, 2, N'Zhejiang')
INSERT [dbo].[State] ([sttid], [cntid], [sttname]) VALUES (5, 2, N'Hainan')
INSERT [dbo].[State] ([sttid], [cntid], [sttname]) VALUES (6, 2, N'Anhui')
INSERT [dbo].[State] ([sttid], [cntid], [sttname]) VALUES (7, 3, N'California')
INSERT [dbo].[State] ([sttid], [cntid], [sttname]) VALUES (8, 3, N'Texas')
INSERT [dbo].[State] ([sttid], [cntid], [sttname]) VALUES (9, 3, N'Florida')
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Emp] ON 

INSERT [dbo].[tbl_Emp] ([id], [name], [mobno], [gender], [jp], [skl], [prof], [email], [password], [age], [country], [state], [city], [comment]) VALUES (1, N'Gulshan Kumar', 8178204884, 1, 1, N'Html,C#,Sql,.Net Core', N'638487200488306376MyPhoto.jpeg', N'gulshankumar.mailid01@gmail.com', N'Gulshan@123', 28, 1, 1, 1, N'Test Code')
INSERT [dbo].[tbl_Emp] ([id], [name], [mobno], [gender], [jp], [skl], [prof], [email], [password], [age], [country], [state], [city], [comment]) VALUES (2, N'Ankit', 9911065342, 1, 2, N'Html,Php,Laravel', N'638487201008663600Profile.jpg', N'gulshankumar.mailid01@gmail.com', N'', 28, 1, 1, 2, N'Test')
INSERT [dbo].[tbl_Emp] ([id], [name], [mobno], [gender], [jp], [skl], [prof], [email], [password], [age], [country], [state], [city], [comment]) VALUES (3, N'Ankit', 9911065342, 1, 2, N'Html,Laravel', N'638487202587979758Profile.jpg', N'gulshankumar.mailid01@gmail.com', N'', 27, 1, 1, 1, N'Test')
INSERT [dbo].[tbl_Emp] ([id], [name], [mobno], [gender], [jp], [skl], [prof], [email], [password], [age], [country], [state], [city], [comment]) VALUES (4, N'Gulshan Singh Kumar', 9911065342, 1, 1, N'Html,C#', N'638487204195058477Profile.jpg', N'gulshankumar.mailid01@gmail.com', N'FYF@134542', 23, 1, 1, 2, N'Tsewer')
SET IDENTITY_INSERT [dbo].[tbl_Emp] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_JP] ON 

INSERT [dbo].[tbl_JP] ([jpid], [jpname]) VALUES (1, N'.Net')
INSERT [dbo].[tbl_JP] ([jpid], [jpname]) VALUES (2, N'Php')
INSERT [dbo].[tbl_JP] ([jpid], [jpname]) VALUES (3, N'Python')
INSERT [dbo].[tbl_JP] ([jpid], [jpname]) VALUES (4, N'React')
SET IDENTITY_INSERT [dbo].[tbl_JP] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Skl] ON 

INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (1, 1, N'Html')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (2, 1, N'C#')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (3, 1, N'Sql')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (4, 1, N'.Net')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (5, 1, N'.Net Core')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (6, 1, N'.Net Core Mvc')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (7, 2, N'Html')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (8, 2, N'Css')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (9, 2, N'Php')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (10, 2, N'Laravel')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (11, 2, N'WordPress')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (12, 2, N'Sql')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (13, 3, N'Python')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (14, 3, N'Machine Learning and AI')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (15, 3, N'Deep Learning')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (16, 3, N'Data Science')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (17, 3, N'Core Python')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (18, 3, N'Analytical skills')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (19, 4, N'Html + Css')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (20, 4, N'JavaScript Fundamentals + ES6')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (21, 4, N'JSX')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (22, 4, N'Git')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (23, 4, N'Node + npm')
INSERT [dbo].[tbl_Skl] ([sid], [jpid], [sname]) VALUES (24, 4, N'Redux')
SET IDENTITY_INSERT [dbo].[tbl_Skl] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_Emp]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Emp]
@mode int=0,
@id int=0,
@name varchar(50)=null,
@email varchar(50)=null,
@password varchar(50)=null,
@mobno bigint=0,
@gender int=0,
@jp int=0,
@skl nvarchar(150)=0,
@prof varchar(50)=0,
@age int=0,
@country int=0,
@state int=0,
@city int=0,
@comment varchar(50)=null
as
begin
if(@mode=1)
begin
insert into tbl_Emp(name, mobno, gender, jp, skl, prof, email, password, age, country, state, city, comment)values(@name, @mobno, @gender, @jp, @skl, @prof, @email, @password, @age, @country, @state, @city, @comment)
end
if(@mode=2)
begin
select * from tbl_Emp join tbl_JP on tbl_Emp.jp = tbl_JP.jpid
join Country on tbl_Emp.country = Country.cntid
join State on tbl_Emp.state = State.sttid
join City on tbl_Emp.city = City.cid
end
if(@mode=3)
begin
delete from tbl_Emp where id=@id
end
if(@mode=4)
begin
select * from tbl_Emp where id=@id
end
if(@mode=5)
begin
update tbl_Emp set name=@name, mobno=@mobno, gender=@gender, jp=@jp, skl=@skl, prof=@prof, email=@email, password=@password, age=@age, country=@country, state=@state, city=@city, comment=@comment where id=@id
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Employee]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Employee]
@mode int=0,
@id int=0,
@cntid int=0,
@sttid int=0,
@jobid int=0,
@name varchar(50)=null,
@gender int=0,
@age int=0,
@mobno varchar(50)=null, 
@email varchar(50)=null,
@password varchar(50)=null,
@jobprofile int=0,
@country int=0,
@state int=0,
@city int=0,
@photo varchar(50)=null,
@skills varchar(50)=null,
@comment varchar(50)=null
as
begin
if(@mode=1)
begin
insert into Employee(name,gender,age,mobno,email,password,jobprofile,country,state,city,photo,skills,comment)values(@name,@gender,@age,@mobno,@email,@password,@jobprofile,@country,@state,@city,@photo,@skills,@comment)
end
if(@mode=2)
begin
select * from Employee join Country on Employee.country=Country.cntid join State on Employee.state=State.sttid join City on Employee.city=City.cid join JobProfile on Employee.jobprofile=JobProfile.jobid
end
if(@mode=3)
begin
select * from Employee where id=@id
end
if(@mode=4)
begin
update Employee set name=@name,gender=@gender,age=@age,mobno=@mobno,email=@email,password=@password,jobprofile=@jobprofile,country=@country,state=@state,city=@city,photo=@photo,skills=@skills,comment=@comment where id=@id
end
if(@mode=5)
begin
select * from Jobprofile
end
if(@mode=6)
begin
select * from Jobprofile
end
if(@mode=7)
begin
delete from Employee where id=@id
end
if(@mode=8)
begin
select * from country
end
if(@mode=9)
begin
select * from state where cntid=@cntid
end
if(@mode=10)
begin
select * from city where sttid=@sttid
end
if(@mode=11)
begin
select * from Skills where jobid=@jobid
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_JP]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_JP]
@jpid int=0,
@jpname varchar(50)=null
as
begin
select * from tbl_JP
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Skl]    Script Date: 4/14/2024 7:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_Skl]
@jpid int=0,
@jpname varchar(50)=null
as
begin
select * from tbl_Skl where jpid=@jpid
end

GO
