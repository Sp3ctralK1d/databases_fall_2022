
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








INSERT INTO Warehouses(code, location, capacity) VALUES(1, 'Chicago', 3);
INSERT INTO Warehouses(code, location, capacity) VALUES(2, 'Rocks', 4);
INSERT INTO Warehouses(code, location, capacity) VALUES(3, 'New York', 7);
INSERT INTO Warehouses(code, location, capacity) VALUES(4, 'Los Angeles', 2);
INSERT INTO Warehouses(code, location, capacity) VALUES(5, 'San Francisko', 8);

INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('4H8P', 'Rocks', 250, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('0MN7', 'Rocks', 180, 3);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('4RT3', 'Scissors', 190, 4);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('7G3H', 'Rocks', 200, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('8JN6', 'Papers', 75, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('8Y6U', 'Papers', 50, 3);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('9J6F', 'Paapers', 175, 2);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('LL08', 'Rocks', 140, 4);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('P0H6', 'Scissors', 125, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('P2T6', 'Scissors', 150, 2);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('TUSS', 'Papers', 90, 5);




select * from warehouses ;

select * from boxes where value >= 150;

select distinct contents, * from boxes ;

select count(id), warehouses from boxes group by warehouses;

select count(id), warehouses from boxes  group by warehouses having count(id)>2 ;

INSERT INTO Warehouses(code, location, capacity) VALUES(6, 'New York', 3);


INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('H5RT', 'Papers', 200, 2);

update Boxes
set value = value*0.75
where id = (
SELECT *
FROM   (SELECT *, DENSE_RANK() OVER (ORDER BY value DESC) AS rk 
        FROM   boxes) t
WHERE  rk = 3;select) 
;

delete from boxes where value <150;

delete from boxes where warehouses in (select id from warehouses where location='New York') returning *;


