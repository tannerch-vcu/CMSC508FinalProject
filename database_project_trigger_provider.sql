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

