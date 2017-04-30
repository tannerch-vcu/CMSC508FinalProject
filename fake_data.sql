-- Brewery table
insert into Brewery (Brewery_ID, Brewery_Name) values (1, 'Dogwood');
insert into Brewery (Brewery_ID, Brewery_Name) values (2, 'Milwakee');
insert into Brewery (Brewery_ID, Brewery_Name) values (3, 'Budweighser');
insert into Brewery (Brewery_ID, Brewery_Name) values (4, 'Flying Dog');
insert into Brewery (Brewery_ID, Brewery_Name) values (5, 'Fish Dog');
insert into Brewery (Brewery_ID, Brewery_Name) values (6, 'Center Of The Galaxy');
-- /Brewery table

-- Beer table
insert into Beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (1, 'PBR', 'Pilsner', 0.71, 7, 'Red', 4);
insert into Beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (2, 'Warm Beer', 'Pilsner', 0.54, 43, 'Brown', 5);
insert into Beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (3, 'Pizza Beer', 'Ale', 0.24, 44, 'Yellow', 3);
insert into Beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (4, 'Sunset', 'Porter', 0.08, 63, 'Golden', 1);
insert into Beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (5, 'Monkey Beer', 'Red Ale', 0.66, 4, 'Red', 4);
insert into Beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (6, '90 Minute IPA', 'IPA', 0.55, 41, 'Maroon', 3);
insert into Beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (7, '120 Minute IPA', 'IPA', 0.08, 21, 'Maroon', 3);
insert into Beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (8, 'Numero Uno', 'Lager', 0.62, 45, 'Pale', 3);
insert into Beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (9, 'Apple Cider', 'Cider', 0.54, 34, 'Red', 6);
insert into Beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (10, 'Green Apple Cider', 'Cider', 0.51, 96, 'Green', 6);
-- /Beer table

-- Locations_List table
insert into Locations_List (Location_ID, Address1, Address2, Address3, City, State_Code, Zip_Code, Country_Code) values (1, '777 Main Street', '', '', 'Richmond', 'VA', '23220', 'US');
insert into Locations_List (Location_ID, Address1, Address2, Address3, City, State_Code, Zip_Code, Country_Code) values (2, '123 Maple Road', '', '', 'Chapel Hill', 'NC', '43223', 'US');
insert into Locations_List (Location_ID, Address1, Address2, Address3, City, State_Code, Zip_Code, Country_Code) values (3, '543 Pine Tree Street', '', '', 'Richmond', 'VA', '23220', 'US');
-- /Locations_List table

-- Provider table
insert into Provider (Provider_ID, Provider_Name, Location_ID) values (1, 'Johnson Store', '1');
insert into Provider (Provider_ID, Provider_Name, Location_ID) values (2, 'Pickle Farm', '2');
insert into Provider (Provider_ID, Provider_Name, Location_ID) values (3, 'Kroger', '3');
-- /Provider table

-- Provider_Phone table
insert into Provider_Phone (Provider_ID, Phone_Number, Phone_Name) values ('1', '8041231234', 'Office');
insert into Provider_Phone (Provider_ID, Phone_Number, Phone_Name) values ('1', '8888888880', 'Sales');
insert into Provider_Phone (Provider_ID, Phone_Number, Phone_Name) values ('2', '2982742333', 'Front Office');
insert into Provider_Phone (Provider_ID, Phone_Number, Phone_Name) values ('3', '3249293832', 'Green Room');
insert into Provider_Phone (Provider_ID, Phone_Number, Phone_Name) values ('3', '8889993339', 'Sales');
-- /Provider_Phone table

-- Brewery_Phone table
insert into Brewery_Phone (Brewery_ID, Phone_Number, Phone_Name) values ('1', '3838339393', 'Sales');
insert into Brewery_Phone (Brewery_ID, Phone_Number, Phone_Name) values ('2', '4445556666', 'Sales');
insert into Brewery_Phone (Brewery_ID, Phone_Number, Phone_Name) values ('3', '2543984398', 'Sales');
insert into Brewery_Phone (Brewery_ID, Phone_Number, Phone_Name) values ('3', '2598798989', 'Tours');
insert into Brewery_Phone (Brewery_ID, Phone_Number, Phone_Name) values ('4', '3294859822', 'Sales');
insert into Brewery_Phone (Brewery_ID, Phone_Number, Phone_Name) values ('5', '2987922298', 'Sales');
insert into Brewery_Phone (Brewery_ID, Phone_Number, Phone_Name) values ('6', '2982982982', 'Sales');
insert into Brewery_Phone (Brewery_ID, Phone_Number, Phone_Name) values ('6', '2982982982', 'that one guy');
-- /Brewery_Phone table

-- Sales table
insert into Sales (Provider_ID, Beer_ID, Start_Time, End_Time, Percentage_Change) values ('1', '1', to_date('2003/05/03 21:00:10', 'yyyy/mm/dd hh24:mi:ss'), to_date('2003/06/03 21:00:10', 'yyyy/mm/dd hh24:mi:ss'), 0.27);
insert into Sales (Provider_ID, Beer_ID, Start_Time, End_Time, Percentage_Change) values ('1', '2', to_date('2003/05/07 21:00:10', 'yyyy/mm/dd hh24:mi:ss'), to_date('2003/05/014 21:00:10', 'yyyy/mm/dd hh24:mi:ss'), 0.46);
insert into Sales (Provider_ID, Beer_ID, Start_Time, End_Time, Percentage_Change) values ('3', '3', to_date('2006/05/03 21:00:10', 'yyyy/mm/dd hh24:mi:ss'), to_date('2007/05/03 21:00:10', 'yyyy/mm/dd hh24:mi:ss'), 0.34);
-- /Sales table

-- Sells table
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('1', '1', 25, 23, 9.1, '1');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('1', '2', 34, 4, 11.6, '1');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('3', '3', 15, 5, 14.5, '1');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('1', '5', 35, 18, 12.0, '1');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('1', '4', 18, 10, 8.8, '0');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('2', '1', 22, 19, 16.7, '1');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('2', '2', 10, 21, 9.3, '0');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('2', '3', 14, 10, 12.3, '1');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('2', '6', 32, 10, 10.7, '1');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('3', '1', 15, 6, 16.6, '1');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('3', '5', 27, 6, 17.0, '1');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('3', '4', 16, 23, 12.4, '0');
insert into Sells (Provider_ID, Beer_ID, Size_Sold, Quantity, Price, In_Stock) values ('3', '6', 21, 9, 9.5, '1');
-- /Sells table

-- Event table
insert into Event (Event_ID, Location_ID, Start_Time, End_Time) values (1, '1', to_date('2003/05/03 10:00:10', 'yyyy/mm/dd hh24:mi:ss'), to_date('2003/05/03 16:00:10', 'yyyy/mm/dd hh24:mi:ss'));
insert into Event (Event_ID, Location_ID, Start_Time, End_Time) values (2, '2', to_date('2004/05/03 10:00:10', 'yyyy/mm/dd hh24:mi:ss'), to_date('2004/05/03 16:00:10', 'yyyy/mm/dd hh24:mi:ss'));
-- /Event table

-- Event_Beer table
insert into Event_Beer (Event_ID, Provider_ID, Beer_ID) values ('1', '1', '1');
insert into Event_Beer (Event_ID, Provider_ID, Beer_ID) values ('1', '1', '5');
insert into Event_Beer (Event_ID, Provider_ID, Beer_ID) values ('2', '2', '3');
insert into Event_Beer (Event_ID, Provider_ID, Beer_ID) values ('2', '3', '6');
-- /Event_Beer table

-- Users table
insert into Users (Email, User_Name, Password) values ('joe@joe.com', 'joejoejoe', '1234');
insert into Users (Email, User_Name, Password) values ('user1@kmail.com', 'user2', 'password1');
-- /Users table

-- Favorite table
insert into Favorite (Email, Beer_ID) values ('joe@joe.com', '1');
insert into Favorite (Email, Beer_ID) values ('joe@joe.com', '2');
insert into Favorite (Email, Beer_ID) values ('joe@joe.com', '6');
insert into Favorite (Email, Beer_ID) values ('user1@kmail.com', '10');
insert into Favorite (Email, Beer_ID) values ('user1@kmail.com', '8');
insert into Favorite (Email, Beer_ID) values ('user1@kmail.com', '3');
-- /Favorite table

-- Transaction table
insert into Transaction (Email, Transaction_Time, Beer_ID, Size_Sold, Quantity, Provider_ID, Price) values ('joe@joe.com', to_date('2003/08/03 16:00:10', 'yyyy/mm/dd hh24:mi:ss'), '1', '7', '8', '1', '4');
insert into Transaction (Email, Transaction_Time, Beer_ID, Size_Sold, Quantity, Provider_ID, Price) values ('joe@joe.com', to_date('2003/07/03 16:00:10', 'yyyy/mm/dd hh24:mi:ss'), '2', '7', '8', '2', '7');
insert into Transaction (Email, Transaction_Time, Beer_ID, Size_Sold, Quantity, Provider_ID, Price) values ('user1@kmail.com', to_date('2003/09/03 16:00:10', 'yyyy/mm/dd hh24:mi:ss'), '2', '7', '8', '2', '7');
insert into Transaction (Email, Transaction_Time, Beer_ID, Size_Sold, Quantity, Provider_ID, Price) values ('user1@kmail.com', to_date('2003/01/03 16:00:10', 'yyyy/mm/dd hh24:mi:ss'), '2', '7', '8', '2', '7');
-- /Transaction table

-- Trial_Users table
insert into Trial_Users (Email, End_Date) values ('joe@joe.com', to_date('2012/08/03 16:00:10', 'yyyy/mm/dd hh24:mi:ss'));
-- /Trial_Users table

-- Pro_Users table
insert into Pro_Users (Email, Payment_Processor_Token, Last_Payment_Time) values ('user1@kmail.com', 'wa8444nyco9m', to_date('2016/01/03 16:00:10', 'yyyy/mm/dd hh24:mi:ss'));
-- /Pro_Users table

