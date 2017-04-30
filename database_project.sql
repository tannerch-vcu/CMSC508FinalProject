create table States(
State_Code varchar2(2) not Null,
State_Name varchar2(25) not Null,
primary key (State_Code));

create table Countries(
Country_Code varchar2(2) not Null,
Country_Name varchar2(25) not Null,
primary key (Country_Code));

create table Brewery(
Brewery_ID number(20) not Null, 
Brewery_Name varchar2(25) not Null, 
primary key (Brewery_ID),
Constraint Brewery_Brewery_ID_low_end check (0<Brewery_ID));

create table Beer(
Beer_ID number(20) not Null, 
Beer_Name varchar2(25) not Null, 
Type varchar2(25), 
ABV number(2,2), 
IBU number(4),
Color varchar2(25), 
Brewery_ID number(20) not Null, 
primary key(Beer_ID),
foreign key(Brewery_ID) references Brewery,
Constraint ABV_check_low_end check (0<=ABV),
Constraint ABV_check_high_end check (ABV<=100),
Constraint IBU_check_low_end check (0<=IBU),
Constraint IBU_check_high_end check (IBU<=100),
Constraint Beer_Beer_ID_low_end check (0<Beer_ID),
Constraint Beer_Brewery_ID_low_end check (0<Brewery_ID));

create table Locations_List(
Location_ID number(20) not Null, 
Address1 varchar2(25), 
Address2 varchar2(25), 
Address3 varchar2(25), 
City varchar2(25), 
State_Code varchar2(2) references States, 
Zip_Code varchar2(5), 
Country_Code varchar2(2) references Countries,  
primary key (Location_ID),
Constraint Location_Location_ID_low_end check (0<Location_ID));

create table Provider(
Provider_ID number(20) not Null, 
Provider_Name varchar2(25),
Location_ID number(20),
primary key (Provider_ID),
foreign key (Location_ID) references Locations_List,
Constraint Provider_Provider_ID_low_end check (0<Provider_ID),
Constraint PRovider_Location_ID_low_end check (0<Location_ID));

create table Provider_Phone(
Provider_ID number(20) not Null, 
Phone_Number varchar2(11) not Null, 
Phone_Name varchar2(25),
Constraint P_Phone_Provider_ID_low_end check (0<Provider_ID));

create table Brewery_Phone(
Brewery_ID number(20) not Null, 
Phone_Number varchar2(11) not Null, 
Phone_Name varchar2(25),
Constraint B_Phone_Brewery_ID_low_end check (0<Brewery_ID));

create table Sales(
Provider_ID number(20) not Null, 
Beer_ID number(20) not Null, 
Start_Date date not Null,
End_Date date not Null,
Percentage_Change number(2,2) not Null,
foreign key (Provider_ID) references Provider,
foreign key (Beer_ID) references Beer,
Constraint Percent_Change_low_end check (-100<=Beer_ID),
Constraint Percent_Change_high_end check (Beer_ID<=100));

create table Sells(
Provider_ID number(20) not Null, 
Beer_ID number(20) not Null, 
Size_Sold number(8) not Null, 
Quantity number(8) not Null, 
Price number(4,2), 
In_Stock number(1) not Null, 
primary key (Provider_ID,Beer_ID),
Constraint Sells_Provider_ID_low_end check (0<Provider_ID),
Constraint Sells_Beer_ID_low_end check (0<Beer_ID),
Constraint Size_Sold_low_end check (0<=Size_Sold),
Constraint Size_Sold_high_end check (1000>=Size_Sold),
Constraint Quantity_low_end check (0<=Quantity),
Constraint Quantity_high_end check (1000>=Quantity),
Constraint Price_low_end check (0<=Price),
Constraint Price_high_end check (1000>=Price));

create table Event(
Event_ID number(20) not Null, 
Location_ID number(20), 
Start_Date date not Null,
End_Date date not Null,
primary key(Event_ID),
foreign key (Location_ID) references Locations_List,
Constraint Event_Event_ID_low_end check (0<Event_ID),
Constraint Event_Location_ID_low_end check (0<Location_ID));

create table Event_Beer(
Event_ID number(20) not Null, 
Provider_ID number(20) not Null, 
Beer_ID number(20) not Null, 
foreign key (Event_ID) references Event,
foreign key (Provider_ID) references Provider,
foreign key (Beer_ID) references Beer,
primary key(Event_ID, Provider_ID, Beer_ID),
Constraint Event_Beer_Event_ID_low_end check (0<Event_ID),
Constraint Event_Beer_Provider_ID_low_end check (0<Provider_ID),
Constraint Event_Beer_Beer_ID_low_end check (0<Beer_ID));

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
primary key (Provider_ID, Day_Of_The_Week),
Constraint H_O_O_Provider_ID_low_end check (0<Provider_ID),
Constraint Day_Of_The_Week_low_end check (1<=Day_Of_The_Week),
Constraint Day_Of_The_Week_high_end check (7>=Day_Of_The_Week));

create table Favorite(
Email varchar2(40) not Null, 
Beer_ID number(20) not Null, 
primary key(Email, Beer_ID),
Constraint Favorite_Beer_ID_low_end check (0<Beer_ID));

create table Transaction(
Email varchar2(40) not Null, 
Transaction_Date date not Null,
Beer_ID number(20) not Null, 
Size_Sold number(4) not Null, 
Quantity number(4) not Null, 
Provider_ID number(20) not Null, 
Price number(6,2), 
primary key(Email, Transaction_Date, Beer_ID, Size_Sold, Quantity),
foreign key(Beer_ID) references Beer,
Constraint Tr_Beer_ID_low_end check (0<Beer_ID),
Constraint Tr_Provider_ID_low_end check (0<Provider_ID),
Constraint Tr_Size_Sold_low_end check (0<=Size_Sold),
Constraint Tr_Size_Sold_high_end check (1000>=Size_Sold),
Constraint Tr_Quantity_low_end check (0<=Quantity),
Constraint Tr_Quantity_high_end check (1000>=Quantity),
Constraint Tr_Price_low_end check (0<=Price),
Constraint Tr_Price_high_end check (1000>=Price));

create table Trial_Users(
Email varchar2(40) not Null, 
End_Date date not Null, 
primary key(Email, End_Date),
foreign key (Email) references Users);

create table Pro_Users(
Email varchar2(40) not Null, 
Payment_Processor_Token varchar2(64) not Null, 
Last_Payment_date date,
primary key(Email, Payment_Processor_Token, Last_Payment_Date),
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