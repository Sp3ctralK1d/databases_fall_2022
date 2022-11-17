create database lab4;

drop table Boxes;
drop table WAREHOUSES;
CREATE TABLE Warehouses 
(
	id SERIAL primary KEY,
	code INTEGER NOT null UNIQUE,
	location VARCHAR(255) NOT NULL,
	capacity integer not NULL

);	
create table Boxes
(
	id SERIAL primary KEY,
	code CHAR(4) NOT NULL,
	contents VARCHAR(255) NOT NULL,
	value real,
	warehouses integer,
	
	CONSTRAINT FK_warehouse_id FOREIGN KEY (warehouses)
  	REFERENCES Warehouses (code) MATCH SIMPLE 
      ON UPDATE NO ACTION 
      ON DELETE NO ACTION
);


select * from warehouses ;

select * from boxes where value >= 150;

select distinct contents, * from boxes ;

select count(id), warehouses from boxes group by warehouses;

select count(id), warehouses from boxes  group by warehouses having count(id)>2 ;

INSERT INTO Warehouses(code, location, capacity) VALUES(6, 'New York', 3);
