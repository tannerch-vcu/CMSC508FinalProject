create or replace view Breweries as
select brewery_name from brewery;

create or replace trigger New_Brewery 
instead of insert on Breweries
Begin
insert into brewery (Brewery_ID, Brewery_Name) values (Brewery_ID_seq.nextval, :new.Brewery_Name);
END;