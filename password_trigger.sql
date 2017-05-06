CREATE OR REPLACE FUNCTION password_manager (
  hash_input in users.password%TYPE,
  email_input in users.email%TYPE)
     RETURN varchar2
IS
     hash_expected users.password%TYPE;
BEGIN
     select password INTO hash_expected
     from users
     where email = email_input;
     if hash_expected = hash_input then
         return 'TRUE';
     else
         return 'FALSE';
     end if;
END password_manager;
/