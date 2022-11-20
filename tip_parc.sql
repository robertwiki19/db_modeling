-- create tip_parc_table
create table tip_parc(
	id serial primary key not null,
	type varchar(20) not null,
	description varchar(400)
);

-- insert data into table after create
insert into tip_parc(type, description) VALUES
					('Parc National','Arie protejata infiintata conform regulament Romsilva'),
					('Parc Natural','Arie naturala protejata conform OUG Natura 2000'),
					('Stiintifica','Rezervatie apartinand UVT'),
					('Sit natura 2000','Sit cartat');

-- update data if required

update tip_parc
	   set type='rez stiintifica',
	   description='rezervatie apartinand uvt, dep geografie si fmi'
where type='Stiintifica';	   