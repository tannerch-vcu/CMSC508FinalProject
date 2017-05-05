create sequence Beer_ID_seq
start with 1
maxvalue 1000000000000
increment by 1
nocycle;

create or replace view Beers as
select be.beer_id, be.Beer_name, be.type, be.ABV, be.IBU, be.Color, be.brewery_ID from beer be;

create or replace trigger New_Beer
instead of insert on Beers
Begin
insert into beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (Beer_ID_seq.nextval, :new.Beer_Name, :new.type, :new.ABV, :new.IBU, :new.Color, :new.Brewery_ID);
END;
/
create sequence Brewery_ID_seq
start with 1
maxvalue 1000000000000
increment by 1
nocycle;

create or replace view Breweries as
select brewery_id, brewery_name from brewery;

create or replace trigger New_Brewery
instead of insert on Breweries
Begin
insert into brewery (Brewery_ID, Brewery_Name) values (Brewery_ID_seq.nextval, :new.Brewery_Name);
END;
/
create sequence Event_ID_seq
start with 1
maxvalue 1000000000000
increment by 1
nocycle;

create or replace view Events as
select Event_id, Location_id, Start_date, End_date from Event;


create or replace trigger New_Event
instead of insert on Events
Begin
insert into event (Event_id, Location_id, Start_date, End_date) values (Event_ID_seq.nextval, :new.location_id, :new.start_date, :new.end_date);
END;
/
create sequence Location_ID_seq
start with 1
maxvalue 1000000000000
increment by 1
nocycle;


create or replace view b_Locations as
select location_id, address1, address2, address3, city, state_code, zip_code, country_code from locations_list;


create or replace trigger New_Location
instead of insert on b_Locations
Begin
insert into locations_list (Location_ID, address1, address2, address3, city, state_code, zip_code, country_code) values (Location_ID_seq.nextval, :new.address1, :new.address2, :new.address3, :new.city, :new.state_code, :new.zip_code, :new.country_code);
END;
/
create sequence Provider_ID_seq
start with 1
maxvalue 1000000000000
increment by 1
nocycle;

create or replace view Providers as
select provider_id, provider_name, location_id from provider;


create or replace trigger New_Provider
instead of insert on providers
Begin
insert into provider (Provider_ID, Provider_Name, Location_id) values (Provider_ID_seq.nextval, :new.Provider_Name, :new.location_id);
END;
/




