Create Table Workers(
id int not null,
name nchar(50) not null,
Birthday date not null,
BeginningOfWork date not null,
primary key(id));
insert into Workers(id,name,Birthday,BeginningOfWork)
values(001,'Hasan','2002/1/16','2021/9/4'),
(002,'Camila','2003/7/30','2021/9/26'),
(003,'Jaeda','1998/9/22','2021/10/18'),
(004,'Marah','2003/10/29','2021/12/7'),
(005,'Yosef','2002/2/28','2022/1/1');
--select*from Workers;
--update Workers
--set BeginningOfWork='2022/1/16'
--where id=004;

Create table WorkerDetalis(
id int not null,
name nchar(50) not null,
City nchar(50) not null,
Adress nchar(50) not null,
PostalCode nchar(10) not null,
foreign key(id) references Workers(id)
);
insert into WorkerDetalis(id,name,City,Adress,PostalCode)
values(001,'Hasan','Tamra','Al-Tayar','30811'),
(002,'Camila','Bat-Yam','hrav-abaed','59100'),
(003,'Marah','Tamra','Alkhale','30811'),
(004,'Jaeda','Nin','Nin-ST-1','19320'),
(005,'Yosef','Baqa al-Gharbiyye','Alkuds St 29','30100');
--select*from WorkerDetalis;
--update WorkerDetalis
--set City='Ramat-Gan',Adress='nbe-yashoh-St-43',PostalCode='52242'
--where id=001;
Create Table Admins(
id int not null,
Name nchar(50) not null,
PlatoonName nchar(50) not null,
PlatoonID  int not null,
primary key(PlatoonID)
);
--drop table Admins;
insert into Admins(id,Name,PlatoonName,PlatoonID)
values(212530711,'Hasan','Phone accessories',001),
(214422073,'Camila','LapTop accessories',002),
(213914385,'Marah','Home accessories',003),
(207922071,'Jaeda','Electric',004),
(213754674,'Yosef','Gaming accessories',005);

select*from Admins;
drop table Platoon;
create table Platoon(
PlatoonID int not null,
PlatoonName nchar(50) not null,
Admins nchar(50) not null,
primary key(PlatoonID),
 foreign key(PlatoonID) references Admins(Platoonid),
 foreign key(PlatoonID) references workers(id)
);
drop table Platoon;
insert into Platoon(PlatoonID,PlatoonName,Admins)
values(001,'Phone accessories','Hasan'),
(002,'LapTop accessories','Camila'),
(003,'Marah','Home accessories'),
(004,'Jaeda','Electric'),
(005,'Yosef','Gaming accessories');


Create Table Produect(
ProdectID nchar(50)not null,
ProduectName nchar(50) not null,
--AAPPC At any Platoon The Produect Was Creater
primary key(ProdectID),
AAPPC int not null,
foreign key(AAPPC) references Platoon(PlatoonID)
);
drop table Produect;
insert into Produect(ProdectID,ProduectName,AAPPC)
values(10201,'AirPods',001),
(10202,'SmartWatch',001),
(10203,'Cases',001),
(10204,'Screen Mirror',001),
(10205,'Charger',001),
(10301,'BackBag for Laptop',002),
(10302,'Laptop Battery',002),
(10303,'Type C to USB Port',002),
(10304,'LapTop Fast Charger',002),
(10305,'MultyScreen',002),
(10401,'DeskTop',003),
(10402,'Closet',003),
(10403,'Chair',003),
(10404,'Table',003),
(10405,'shelfs',003),
(10501,'TV',004),
(10502,'AirConder',004),
(10503,'Electric Fireplace',004),
(10504,'Fridge',004),
(10505,'Camera',004),
(10601,'Pc Gaming',005),
(10602,'Consels',005),
(10603,'Gaming KeyBoard',005),
(10604,'Mouse',005),
(10605,'Gaming Chair',005);
select*from Produect;


Create Table Delivery(
ServiceID int not null,
CustumerID int not null,
DeliveryDate date not null,
OrderID nchar(50)not null,
primary key(CustumerID),
foreign key(OrderID) references produect(ProdectID)
);
drop table Delivery;
insert into Delivery(ServiceID,CustumerID,DeliveryDate,OrderID)
values(32221,1,'2022/2/16',10501),
(34213,02,'2022/3/31',10303),
(52134,03,'2022/1/31',10202),
(76231,04,'2022/2/14',10201),
(56214,05,'2022/6/13',10503);

drop table Invoicing
Create table Invoicing(
InvoicingID int not null,
InvoicingDate Date not null,
Price nchar(50) not null,
ChekOut Date not null,
foreign key(InvoicingID) references Delivery(CustumerID)
);
insert into Invoicing(InvoicingID,InvoicingDate,Price,ChekOut)
Values(001,'2022/01/16','500$','2022/01/19'),
(002,'2022/2/22','200$','2022/02/25'),
(003,'2022/1/10','150$','2022/01/13'),
(004,'2022/1/31','100$','2022/02/02'),
(005,'2022/6/13','55$','2022/6/16');
select*From Invoicing;
drop table Customer;
Create Table Customer(
id int not null,
Name nchar(50) not null,
Email nvarchar(max) not null,
Phone nchar(50) not null,
primary key(id),
foreign key (id) references Delivery(CustumerID)
);
insert into Customer(id,name,Email,Phone)
values(001,'Hasan','HasanTayar1602@Gmail.com','0524802045'),
(002,'Camila','Katkota@gmail.com','0538262271'),
(003,'Jaeda','Jaeda@Yahoo.com','0533304059'),
(004,'Marah','Marah@hotmail.com','0528782880'),
(005,'Yosef','Yosesf@queizl.com','0432354768');
drop table Customer;
Create Table CustomerDetails(
id int not null,
PostalCode int not null,
Adress nchar(50) not null,
HouseNUM nchar(50),
City nchar(50) not null,
foreign key(id) references Customer(id)
);
insert into CustomerDetails(id,PostalCode,Adress,HouseNUM,City)
values(001,30811,'Al-Tayar','32','Tamra'),
(002,59100,'Hrav avadem','40','Batyam'),
(003,19320,'Nin st1','2','nin'),
(004,52242,'Nbe Yashoh 43','43','RamatGan'),
(005,19320,'NIn St2','4','Nin');
update CustomerDetails
set Adress='Al-bek'
where id=001;
--The Customer Has Change Here Adress
update Admins
set PlatoonName= 'Enginer'
Where PlatoonID=003;
--The Admin Get a upgradedd for new Platoon
select PlatoonName,PlatoonID
from Admins;
delete from CustomerDetails where id=001;
--to Delte Details For CUstmer
select*from Produect
inner join Delivery on  Delivery.OrderID= Produect.ProdectID;
--show all details for 2 tables
select *
from Produect
right join Delivery on Delivery.OrderID=Produect.ProdectID;
/*uses Delivery as the main table and compares it with Delivery, it shows all the coloumns and the
details from Delivery that are available in Produect when OrderID=ProdectID*/
select *
from Admins
left join Workers on Admins.id=Workers.name;
/*uses admins as the main table and shows everycloumn, details are showed on condition that Admins=Workers*/
select top 3 Price
from Invoicing;
--its showing The top 3 Prices in Invoicing
select InvoicingID,Price
from Invoicing 
order by InvoicingID asc;
--showing the prices from the biggest to samller
select *,DATEDIFF (MONTH,Birthday,BeginningOfWork) as MonthsLasting
from Workers
select *
from Produect 
where AAPPC in (2)
--show every prodect the creature in 2'
select * 
from Produect
where ProdectID between 10402 and 10502
--show every  prodect that his id bettwen 10402 to 10502
