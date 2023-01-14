update employee set adresa='Mun.Arad, Jud.Arad' where id=1;

update employee set adresa='Mun.Arad, Jud.Arad' where id in (1,3,6);

update employee set adresa='Buzias, jud. Timis' where nume='Ceapa';

update employee set adresa='Mun.Arad, Jud.Arad' where nume='Ceapa' and sex='M';

select * from employee

select * from drona

update drona set timp_zbor='01:30:00' where model='Agras T30';

update drona set timp_zbor='02:00:00', inaltime_zbor='60', sarcina_utila='3' where model='Matris 30';

select * from employee where id in(
select employee_id from operator_drona where drona_id=5
);

select employee_id from operator_drona where id in(
select id from drona where model='Agras T10'
);







