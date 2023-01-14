--CREATE VIEW
CREATE VIEW first_view AS
SELECT * FROM employee;

--SELECT FROM VIEW
SELECT * FROM first_view;

create view angajati_proiecte_view as
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id;

--SELECT FROM PREVIOUS VIEW
SELECT * FROM angajati_proiecte_view;

SELECT nume_angajat, cnp FROM angajati_proiecte_view;

--EQUIVALENT WITH PREVIOUS
SELECT nume_angajat, cnp FROM
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) AS t;

SELECT * FROM angajati_proiecte_view
INNER JOIN employee
on angajati_proiecte_view.cnp=employee.cnp;

SELECT av.*,e FROM angajati_proiecte_view AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;
--sau
SELECT * FROM
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;

CREATE TABLE GENERATED AS
SELECT av.*,e.adresa FROM angajati_proiecte_view AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;
--SAU
CREATE TABLE GENERATED AS
SELECT av.*,e.adresa FROM angajati_proiecte_view AS av
(
SELECT e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;

INSERT INTO generated
SELECT av.*,e.adresa FROM angajati_proiecte_view AS av
INNER JOIN employee AS e
on av.cnp=e.cnp;

--view for insert
insert into generated
select av, *, e.adresa from angajati_proiecte_view as av
inner join employee as e
on av.cnp=e.cnp;

--view for update
update generated set adresa ='Mun.Timisoara, Jud. Timis' where nume_angajat='George'

--view for update
update generated set adresa = 'Mun. Timisoara, Jud. Timis'
where nume_angajat in (
					select distinct nume_angajat from angajati_proiecte_view where cnp='1234567890127'
					);

--delete from generated
delete from generated where nume_angajat in (
	select nume_angajat from angajati_proiecte_view where cnp='1234567890127' 
);