use animaldb;

create table donator
	(donator_fname		varchar(20), 
	 donator_lname		varchar(20), 
	 donate_date		date,
	 donate_amount		numeric(20,2),
	 primary key (donator_fname, donator_lname)
	);

create table owner
	(owner_fname		varchar(20) not null,
	 owner_lname		varchar(20) not null,
	 owner_street		varchar(100),
	 owner_city		varchar(20),
	 owner_postalCode		char(6),
	 owner_workplace		varchar(20),
	 primary key (owner_fname, owner_lname)
	);

create table ledger
	(transfer_from		varchar(20) not null,
	 trasnfer_to		varchar(20) not null,
	 trasnfer_amount		numeric(20,2),
	 primary key (transfer_from, trasnfer_to)
	);

create table SPCA_branch
	(name		varchar(20) not null,
	 street		varchar(100),
	 city		varchar(20),
	 postalCode		char(6),
	 donator_fname		varchar(20),
	 donator_lname		varchar(20), 
	 owner_fname		varchar(20) not null,
	 owner_lname		varchar(20) not null, 
	 transfer_from		varchar(20) not null,
	 trasnfer_to		varchar(20) not null,
	 primary key (name),
	 foreign key (donator_fname, donator_lname) references donator (donator_fname, donator_lname),
	 foreign key (owner_fname, owner_lname) references owner (owner_fname, owner_lname),
	 foreign key (transfer_from, trasnfer_to) references ledger (transfer_from, trasnfer_to)
	);

create table rescurer
	(name		varchar(20) not null,
	 street		varchar(100),
	 city		varchar(20),
	 postalCode		char(6),
	 donator_fname		varchar(20),
	 donator_lname		varchar(20), 
	 owner_fname		varchar(20) not null,
	 owner_lname		varchar(20) not null, 
	 transfer_from		varchar(20) not null,
	 trasnfer_to		varchar(20) not null,
	 primary key (name),
	 foreign key (donator_fname, donator_lname) references donator (donator_fname, donator_lname),
	 foreign key (transfer_from, trasnfer_to) references ledger (transfer_from, trasnfer_to),
	 foreign key (owner_fname, owner_lname) references owner (owner_fname, owner_lname)
	);

create table shelter
	(name		varchar(20) not null,
	 street		varchar(100),
	 city		varchar(20),
	 postalCode		char(6),
	 website_URL	varchar(100),
	 donator_fname		varchar(20),
	 donator_lname		varchar(20), 
	 owner_fname		varchar(20) not null,
	 owner_lname		varchar(20) not null, 
	 transfer_from		varchar(20) not null,
	 trasnfer_to		varchar(20) not null,
	 primary key (name),
	 foreign key (donator_fname, donator_lname) references donator (donator_fname, donator_lname),
	 foreign key (transfer_from, trasnfer_to) references ledger (transfer_from, trasnfer_to),
	 foreign key (owner_fname, owner_lname) references owner (owner_fname, owner_lname)
	);

create table shelter_phone
	(shelter_name		varchar(20) not null,
	 shelter_phone		char(10),
	 primary key (shelter_name, shelter_phone),
	 foreign key (shelter_name) references shelter (name)
	);

create table rescurer_phone
	(rescurer_name		varchar(20) not null,
	 rescurer_phone		char(10),
	 primary key (rescurer_name, rescurer_phone),
	 foreign key (rescurer_name) references rescurer (name)
	);

create table SPCA_phone
	(SPCA_name		varchar(20) not null,
	 SPCA_phone		char(10),
	 primary key (SPCA_name, SPCA_phone),
	 foreign key (SPCA_name) references SPCA_branch (name)
	);

create table shelter_animal_type
	(shelter_name		varchar(20) not null,
	 shelter_animal_type		varchar(20),
	 primary key (shelter_name, shelter_animal_type),
	 foreign key (shelter_name) references shelter (name)
	);

create table shelter_max_number
	(shelter_name		varchar(20) not null,
	 shelter_max_number		numeric(65,0),
	 primary key (shelter_name, shelter_max_number),
	 foreign key (shelter_name) references shelter (name)
	);

create table owner_phone
	(owner_fname		varchar(20) not null,
	 owner_lname		varchar(20) not null,
	 owner_phone		char(10),
	 primary key (owner_fname, owner_lname, owner_phone),
	 foreign key (owner_fname, owner_lname) references owner (owner_fname, owner_lname)
	);


create table Vet(
	vet_fname	varchar(50) not null,
	vet_lname	varchar(50) not null,
	primary key (vet_fname, vet_lname)
);

create table Driver(
	fname varchar(50) not null,
	lname varchar(50) not null,
	emergency_phone char(10),
	license_plate varchar(10),
	license_number char(15),
	transport_to_place	varchar(20),
	transport_from_place	varchar(20),
	primary key (fname, lname)
);

create table Animal(
	ID char(8) not null primary key,
	SPCA_branch_name varchar (20),
	shelter_name varchar (20),
	rescurer_name	varchar(20),
	driver_fname varchar(50),
	driver_lname varchar(50),
    date_leave_shelter date not null,
    date_arrive_shelter date not null,
	foreign key (SPCA_branch_name) references SPCA_branch(name),
	foreign key (shelter_name) references shelter(name),
	foreign key (rescurer_name) references rescurer(name),
	foreign key (driver_fname, driver_lname) references Driver(fname, lname)
);

create table Visit(
	animal_ID char(8) not null,
	vet_visit_condition varchar(100),
	weihgt varchar(100),
	visit_date date,
	vetFname varchar(50),
	vetLname varchar(50),
	primary key(vetFname, vetLname, animal_ID),
	foreign key (animal_ID) references Animal(ID),
	foreign key (vetFname, vetLname) references Vet(vet_fname, vet_lname)
);

create table AdoptiveFamily(
	animal_ID	char(8) not null,
	lname	varchar(20) not null,
	phone	char(10) not null,
	street varchar(100) not null,
	city 	varchar(20) not null,
	postalCode	char(6) not null,
	pay_amount	numeric(20,2),
	primary key(animal_ID, lname, phone, street, city, postalCode)
);

create table Associate(
	rescuer		varchar(20),
	driver_fname	varchar(20),
	driver_lname	varchar(20),
	primary key (rescuer, driver_fname, driver_lname),
	foreign key (rescuer) references rescurer(name),
	foreign key (driver_fname, driver_lname) references Driver(fname, lname)	
);

insert into donator values ('Kelly', 'Ge', '20080901', '100.00');
insert into donator values ('Sunny', 'Yang', '20070201', '100.00');

insert into owner values ('Anna', 'Li', 'princess', 'Kingston', 'k7l5c2', 'shelter');
insert into owner values ('Huang', 'Li', 'king', 'Kingston', 'k73 5t2', 'SPCA');
insert into owner values ('Hui', 'Lin', 'yonge', 'Toronto', 't6r7g3', 'shelter');

insert into ledger values ('shelter', 'SPCA', '200.00');
insert into ledger values ('rescurer', 'SPCA', '400.00');
insert into ledger values ('adopted_family', 'shelter', '50.00');

insert into rescurer values ('rescurer_A', 'sunny', 'Lanxi', 'k6l 6g7', 'Kelly', 'Ge', 'Anna', 'Li', 'rescurer', 'SPCA');
insert into shelter values ('shelter_A', 'sunny', 'Lanxi', 'k6l 9g7', 'lanxi.com', 'Kelly', 'Ge', 'Huang', 'Li', 'shelter', 'SPCA');
insert into SPCA_branch values ('branch_A', 'river', 'Lanxi', 'k9h 5g6', 'Kelly', 'Ge', 'Hui', 'Lin', 'rescurer', 'SPCA');

insert into shelter_phone values ('shelter_A', '6136666666');
insert into SPCA_phone values ('branch_A', '6137702222');
insert into rescurer_phone values ('rescurer_A', '6137703398');

insert into shelter_animal_type values('shelter_A', 'dog');
insert into shelter_animal_type values('shelter_A', 'cat');
insert into shelter_animal_type values('shelter_A', 'bunny');
insert into shelter_animal_type values('shelter_A', 'rodent');
insert into shelter_max_number values ('shelter_A', '100');
insert into owner_phone values ('Anna', 'Li', '6137701111');

insert into Driver values('Kelly', 'Xiao', '6137700000', 'AL810', '1234567890', 'Kingston', 'Toronto');
insert into Vet values('Kindman', 'Smartvet');
insert into Associate values('rescurer_A', 'Kelly', 'Xiao');
insert into Animal values('12345678', 'branch_A', 'shelter_A','rescurer_A', 'Kelly', 'Xiao', '20200101', '20200110');
insert into Visit values('12345678', 'healthy', '10', '20200102', 'Kindman', 'Smartvet');































