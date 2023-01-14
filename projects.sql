select * from projects

Insert into projects(nume, start_date, end_date, description, clients_id)
values
	('Scanare LiDAR canalizare',NOW(), NOW(),'Scanare conducte canal Aquatim si modelare 3D', 1),
	('Ortofoto multispectral Mun. Timisoara','2022-01-01','2023-10-10','Realizare orto pentru primaria TM numai multispectral, fara termic', 2),
	('Mapare retea apa-canal mun. TM','2022-03-16','2024-09-26','mapare 3D canalizare',3)