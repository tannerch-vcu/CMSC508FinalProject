create sequence Beer_ID_seq
start with 1
maxvalue 1000000000000
increment by 1
nocycle;

create or replace view Beers as
select be.beer_id, be.Beer_name, be.type, be.ABV, be.IBU, be.Color, br.brewery_name, br.brewery_ID from beer be join brewery br on (be.brewery_id = br.brewery_id);

create or replace trigger New_Beer 
instead of insert on Beers
Begin
insert into beer (Beer_ID, Beer_Name, Type, ABV, IBU, Color, Brewery_ID) values (Beer_ID_seq.nextval, :new.Beer_Name, :new.type, :new.ABV, :new.IBU, :new.Color, :new.Brewery_ID);
END;

