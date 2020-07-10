create user haksa identified by pass;
grant connect, resource, dba to haksa;

select*from dba_users;

drop user haksa;