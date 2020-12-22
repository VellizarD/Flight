create database FlightsDB

create table Users(
User_id int identity(0,1) primary key,
FirstName varchar(30) not null,
LastName varchar(30) not null,
PhoneNumber varchar(10) not null unique,
Nationality varchar(20)
)

create table Flights(
FlightNumber varchar(6) not null primary key,
DepartureLocation varchar(20) not null,
Destination varchar(20) not null,
DepartureDate varchar(10) not null,
DepartureTime varchar(10) not null,
TotalSeats int not null,
)

create table User_Flight(
User_id int foreign key references Users(User_id) on delete cascade,
FlightNumber varchar(6) foreign key references Flights(FlightNumber) on delete cascade,
Class varchar not null,
Extra varchar,
primary key(User_id, FlightNumber)
)

ALTER trigger [dbo].[OnNewTicketAdded] on [dbo].[User_Flight]
after insert
as begin 
declare @number as varchar(6) = (select FlightNumber from inserted)
update Flights set TotalSeats = TotalSeats - 1 where FlightNumber = @number
end

ALTER trigger [dbo].[OnTicketDeleted] on [dbo].[User_Flight]
after delete
as begin
declare @number as varchar(6) = (select FlightNumber from deleted)
update Flights set TotalSeats = TotalSeats + 1 where FlightNumber = @number
end

Dummy Data for table users:
insert into Users values
('Peter','Jack','0000087903','German'),
('Peter','Morty','0000061879','Chinese'),
('Mark','Hunter','0000060043','English'),
('Morty','Peter','0000074424','Belgian'),
('Peter','Victoria','0000048216','Bulgarian'),
('Johnatan','Lucas','0000019350','Belgian'),
('Jack','Johnatan','0000079053','Greek'),
('Marcus','Peter','0000059185','Japanese'),
('Johnatan','Lora','0000093126','Italian'),
('Morty','Peter','0000029848','Belgian'),
('Jack','Daniel','0000089763','Nigerian'),
('Johnatan','John','0000083218','American'),
('Maria','Maria','0000017953','Romanian'),
('Chad','Victoria','0000045427','English'),
('Morty','Marcus','0000099494','Japanese'),
('Chad','Mark','0000092051','Serbian'),
('Victoria','Mark','0000024417','Bulgarian'),
('Karen','Johnatan','0000079444','American'),
('Hunter','Bella','0000013974','Serbian'),
('Susan','Peter','0000063010','Romanian'),
('John','Morty','0000052676','Romanian'),
('Hunter','Susan','0000093760','Hungarian'),
('Jacob','Morty','0000056577','Italian'),
('Hunter','Jack','0000019879','German'),
('Daniel','Jack','0000099018','American'),
('Chad','Chad','0000079076','Romanian'),
('Victoria','Susan','0000071747','French'),
('Jack','Hunter','0000099208','English'),
('Peter','Chad','0000021769','Bulgarian'),
('Marcus','Peter','0000026981','Italian')

Dummy Data for table Flights:
insert into Flights values ('wek365','Tokyo','London','2021-10-9','9:52',12,'  '),
('yv00xz','Vienna','Moscow','2021-11-12','3:49',122,'  '),
('c7vi0k','Ankara','Tokyo','2021-10-6','20:18',93,'  '),
('z4pr58','Sofia','Paris','2021-5-20','2:38',22,'  '),
('q6r0t2','Paris','Tokyo','2021-2-22','4:31',44,'  '),
('k6s1jh','Athens','London','2021-1-26','15:39',89,'  '),
('o8bzsg','Moscow','Berlin','2021-4-0','7:57',68,'  '),
('qzkbyk','Belgrade','Belgrade','2021-4-22','20:17',78,'  '),
('l5hqf1','Paris','Warsaw','2021-11-27','5:38',107,'  '),
('63tq8n','Moscow','Bukurest','2021-5-1','12:4',85,'  '),
('zrvp1a','Mexico','Athens','2021-5-22','4:57',30,'  '),
('zoxdah','Mexico','Athens','2021-8-25','23:19',33,'  '),
('llqsan','Rome','Bukurest','2021-4-8','4:57',24,'  '),
('tva0oh','Sofia','Bukurest','2021-12-13','10:42',128,'  '),
('hziyoz','Tokyo','Berlin','2021-12-4','14:44',73,'  '),
('xira2y','Warsaw','Sofia','2021-12-1','22:28',29,'  '),
('p8xid4','Rome','Moscow','2021-3-21','1:35',73,'  '),
('4c5r2n','Berlin','Vienna','2021-9-14','23:39',148,'  '),
('fzxc7a','Bukurest','London','2021-1-12','1:36',48,'  '),
('axhdeb','Warsaw','Belgrade','2021-0-12','14:49',97,'  '),
('2k13sf','Moscow','Moscow','2021-7-0','4:40',100,'  '),
('cbntpz','Rome','Sofia','2021-6-21','23:37',83,'  '),
('5ngpnp','Tokyo','Paris','2021-11-6','3:0',69,'  '),
('gfv39n','Warsaw','London','2021-3-12','16:0',49,'  '),
('kqw5ea','Tokyo','Paris','2021-6-22','1:23',2,'  '),
('tbpyep','Sofia','Tokyo','2021-9-16','21:17',2,'  '),
('sr0feg','Ankara','Sofia','2021-5-13','14:49',123,'  '),
('xeizys','Athens','Ankara','2021-9-16','9:34',6,'  '),
('lfwaoj','Belgrade','Belgrade','2021-6-10','12:44',88,'  '),
('sea011','London','Mexico','2021-9-16','23:46',138,'  ')