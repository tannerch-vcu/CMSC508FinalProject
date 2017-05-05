create sequence Location_ID_seq
start with 1
maxvalue 1000000000000
increment by 1
nocycle;


create or replace view Locations as
select location_id, address1, address2, address3, city, state_code, zip_code, country_code from locations_list;


create or replace trigger New_Location 
instead of insert on Locations
Begin
insert into locations_list (Location_ID, address1, address2, address3, city, state_code, zip_code, country_code) values (Location_ID_seq.nextval, :new.address1, :new.address2, :new.address3, :new.city, :new.state_code, :new.zip_code, :new.country_code);
END;

