select * from employee

select * from operator_drona 

delete from operator_drona where employee_id=6;

delete from employee where cnp='123456789128';

select nume, prenume, cnp, NOW() from employee;

select nume as "Nume angajat", prenume as "Prenume angajat", cnp as "CNP", NOW() as "Data raport" from employee;

select nume as "Nume angajat", prenume as "Prenume angajat", cnp as "CNP", NOW() as "Data raport" from employee as e;

--filtrari rezultate cu where

select * from employee where id=3

select nume, prenume, cnp from employee where id=3

select nume, prenume from employee where id=3

select * from employee where id in (3,5,6)

select * from employee where id>3

select * from employee where id=3 and prenume='Popescu'

select * from employee where id=3 or prenume='Popescu'

select * from employee where id!=3 or prenume='Popescu'

select * from employee where prenume like ('P')

create table employee_extended as 
select nume as "Nume angajat", prenume as "Prenume angajat", cnp as "CNP", now() as "Data Raport" from employee

select * from employee_extended

drop table employee_extended
