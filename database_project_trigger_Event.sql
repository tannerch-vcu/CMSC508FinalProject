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

