drop table tbl_product;

create sequence sql_pno increment by 1 start with 100;

drop sequence sql_pno;

create table tbl_product(
pno char(3) primary key,
pname varchar(100),
price int
);

insert into tbl_product(pno, pname, price) values(sql_pno.nextval , '����ħ��' , 159000);
insert into tbl_product(pno, pname, price) values(sql_pno.nextval , '���� 3�� ����' , 100000);
insert into tbl_product(pno, pname, price) values(sql_pno.nextval , '���� ���� ����' , 990000);
insert into tbl_product(pno, pname, price) values(sql_pno.nextval , 'ĹŸ��' , 219000);

select*from tbl_product;

delete from tbl_product where pno=100;

commit;