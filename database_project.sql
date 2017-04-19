create table Brewery(
Brewery_ID number(20) not Null, 
Brewery_Name varchar2(25) not Null, 
primary key (Brewery_ID));

create table Beer(
Beer_ID number(20) not Null, 
Beer_Name varchar2(25) not Null, 
Type varchar2(25), 
ABV number(2,2), 
IBU number(4),
Color varchar2(25), 
Brewery_ID number(20) not Null, 
primary key(Beer_ID),
foreign key(Brewery_ID) references Brewery);

create table Locations_List(
Location_ID number(20) not Null, 
Address1 varchar2(25), 
Address2 varchar2(25), 
Address3 varchar2(25), 
City varchar2(25), 
State_Code varchar2(2), 
Zip_Code varchar2(5), 
Country_Code varchar2(2),  
primary key (Location_ID));

create table Provider(
Provider_ID number(20) not Null, 
Provider_Name varchar2(25),
Location_ID number(20),
primary key (Provider_ID),
foreign key (Location_ID) references Locations_List);

create table Provider_Phone(
Provider_ID number(20) not Null, 
Phone_Number varchar2(11) not Null, 
Phone_Name varchar2(25));

create table Brewery_Phone(
Brewery_ID number(20) not Null, 
Phone_Number varchar2(11) not Null, 
Phone_Name varchar2(25));

create table Sales(
Provider_ID number(20) not Null, 
Beer_ID number(20) not Null, 
Start_Date_And_Time datetime not Null, 
End_Date_And_Time datetime not Null, 
Percentage_Change number(2,2) not Null,
foreign key (Provider_ID) references Provider,
foreign key (Beer_ID) references Beer);

create table Sells(
Provider_ID number(20) not Null, 
Beer_ID number(20) not Null, 
Size_Sold number(8) not Null, 
Quantity number(8) not Null, 
Price number(4,2), 
In_Stock boolean not Null, 
primary key (Provider_ID,Beer_ID));

create table Event(
Event_ID number(20) not Null, 
Location_ID number(20), 
Start_Date_And_Time datetime, 
End_Date_And_Time datetime, 
primary key(Event_ID, Location_ID),
foreign key (Location_ID) references Locations_List);

create table Event_Beer(
Event_ID number(20) not Null, 
Provider_ID number(20) not Null, 
Beer_ID number(20) not Null, 
primary key(Event_ID, Provider_ID, Beer_ID),
foreign key (Event_ID) references Event,
foreign key (Provider_ID) references Provider,
foreign key (Beer_ID) references Beer);

create table Users(
Email varchar2(40) not Null, 
User_Name varchar2(40) not Null, 
Password varchar2(64) not Null, 
primary key(Email));

create table Hours_Of_Operation(
Provider_ID number(20) not Null, 
Day_Of_The_Week number(7) not Null, 
Open_Time datetime not Null, 
Close_Time datetime not Null, 
primary key (Provider_ID, Day_Of_The_Week));

create table Favorite(
Email varchar2(40) not Null, 
Beer_ID number(20) not Null, 
primary key(Email, Beer_ID));

create table Transaction(
Email varchar2(40) not Null, 
Date_And_Time datetime not Null, 
Beer_ID number(20) not Null, 
Size_Sold number(4) not Null, 
Quantity number(4) not Null, 
Provider_ID number(20) not Null, 
Price number(6,2), 
primary key(Email, Date_And_Time, Beer_ID, Size, Quantity),
foreign key(Beer_ID) references Beer);

create table Trial_Users(
Email varchar2(40) not Null, 
End_Date datetime not Null, 
primary key(Email, End_Date),
foreign key (Email) references Users);

create table Pro_Users(
Email varchar2(40) not Null, 
Payment_Processor_Token varchar2(64) not Null, 
Last_Payment_Date_And_Time datetime, 
primary key(Email, Payment_Processor_Token, Last_Payment_Date_And_Time),
foreign key(Email) references Users);

drop table Pro_Users;
drop table Trail_Users;
drop table Transation;
drop table Favorite;
drop table Hours_Of_Operation;
drop table Users;
drop table Event_Beer;
drop table Event;
drop table Sells;
drop table Sales;
drop table Brewery_Phone;
drop table Provider_Phone;
drop table Provider;
drop table Locations_List;
drop table Beer;
drop table Brewery;