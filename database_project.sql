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
Start_Date date not Null,
Start_Time timestamp not Null,
End_Date date not Null,
End_Time timestamp not Null,
Percentage_Change number(2,2) not Null,
foreign key (Provider_ID) references Provider,
foreign key (Beer_ID) references Beer);

create table Sells(
Provider_ID number(20) not Null, 
Beer_ID number(20) not Null, 
Size_Sold number(8) not Null, 
Quantity number(8) not Null, 
Price number(4,2), 
In_Stock number(1) not Null, 
primary key (Provider_ID,Beer_ID));

create table Event(
Event_ID number(20) not Null, 
Location_ID number(20), 
Start_Date date not Null,
Start_Time timestamp not Null,
End_Date date not Null,
End_Time timestamp not Null,
primary key(Event_ID),
foreign key (Location_ID) references Locations_List);

create table Event_Beer(
Event_ID number(20) not Null, 
Provider_ID number(20) not Null, 
Beer_ID number(20) not Null, 
foreign key (Event_ID) references Event,
foreign key (Provider_ID) references Provider,
foreign key (Beer_ID) references Beer,
primary key(Event_ID, Provider_ID, Beer_ID));

create table Users(
Email varchar2(40) not Null, 
User_Name varchar2(40) not Null, 
Password varchar2(64) not Null, 
primary key(Email));

create table Hours_Of_Operation(
Provider_ID number(20) not Null, 
Day_Of_The_Week number(7) not Null, 
Open_Time timestamp not Null, 
Close_Time timestamp not Null, 
primary key (Provider_ID, Day_Of_The_Week));

create table Favorite(
Email varchar2(40) not Null, 
Beer_ID number(20) not Null, 
primary key(Email, Beer_ID));

create table Transaction(
Email varchar2(40) not Null, 
Transaction_Date date not Null,
Transaction_Time timestamp not Null,
Beer_ID number(20) not Null, 
Size_Sold number(4) not Null, 
Quantity number(4) not Null, 
Provider_ID number(20) not Null, 
Price number(6,2), 
primary key(Email, Transaction_Date, Transaction_Time, Beer_ID, Size_Sold, Quantity),
foreign key(Beer_ID) references Beer);

create table Trial_Users(
Email varchar2(40) not Null, 
End_Date date not Null, 
primary key(Email, End_Date),
foreign key (Email) references Users);

create table Pro_Users(
Email varchar2(40) not Null, 
Payment_Processor_Token varchar2(64) not Null, 
Last_Payment_date date,
Last_Payment_Time timestamp,
primary key(Email, Payment_Processor_Token, Last_Payment_Date, Last_Payment_Time),
foreign key(Email) references Users);

drop table Pro_Users cascade constraints;
drop table Trial_Users cascade constraints;
drop table Transaction cascade constraints;
drop table Favorite cascade constraints;
drop table Hours_Of_Operation cascade constraints;
drop table Users cascade constraints;
drop table Event_Beer cascade constraints;
drop table Event cascade constraints;
drop table Sells cascade constraints;
drop table Sales cascade constraints;
drop table Brewery_Phone cascade constraints;
drop table Provider_Phone cascade constraints;
drop table Provider cascade constraints;
drop table Locations_List cascade constraints;
drop table Beer cascade constraints;
drop table Brewery cascade constraints;