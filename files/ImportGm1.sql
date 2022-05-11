Use gm1;
Set names utf8;

DROP Table if exists ort;
Create Table ort
(
    id INT PRIMARY Key AUTO_INCREMENT,
    plz VARCHAR(10),
    name VARCHAR(50),
    lid int(11),
    lname VARCHAR(50)
)Engine = InnoDB DEFAULT Charset=utf8;

DROP Table if exists landkreis;
Create Table landkreis
(
    id INT PRIMARY Key AUTO_INCREMENT,
    name VARCHAR(50),
    bname VARCHAR(50),
    bid int(11)
)Engine = InnoDB DEFAULT Charset=utf8;

DROP Table if exists bundesland;
Create Table bundesland
(
    id INT PRIMARY Key AUTO_INCREMENT,
    name VARCHAR(50)
)Engine = InnoDB DEFAULT Charset=utf8;

DROP Table if exists csv_ort;
Create Table csv_ort
(
    osm_id VARCHAR(20),
    ags VARCHAR(20),
    ort VARCHAR(50),
    plz VARCHAR(10),
    landkreis VARCHAR(50),
    bundesland VARCHAR(50)
)Engine = InnoDB DEFAULT Charset=utf8;

LOAD DATA LOCAL INFILE 'C:/progs/zuordnung_plz_ort_landkreis.csv'
INTO TABLE csv_ort
CHARACTER SET utf8
FIELDS Terminated by ','
Lines Terminated by '\n'
Ignore 1 ROWS;

SELECT ort,plz,landkreis,bundesland from csv_ort LIMIT 4;

SELECT distinct bundesland from csv_ort;

INSERT INTO bundesland (name) SELECT distinct bundesland from csv_ort;

INSERT INTO landkreis (name,bname)
SELECT
distinct landkreis,bundesland
from csv_ort
WHERE landkreis > ''
ORDER BY landkreis;

update landkreis set bid=(select id from bundesland WHERE bname=name);

SELECT * from landkreis LIMIT 10;

TRUNCATE ort;

INSERT INTO ort (plz,name,lname)
SELECT
plz, ort,landkreis
from csv_ort
ORDER BY ort;

UPDATE ort set lid=(SELECT id from landkreis where lname=name);

select * from ort LIMIT 10;

ALTER Table ort drop column lname;
ALTER Table landkreis drop column bname;
DROP Table csv_ort;

update mitarbeiter SET OID=(SELECT id from ort where plz='85662' and name='Hohenbrunn')
where id in (8,9);
update mitarbeiter SET OID=(SELECT id from ort where plz='85653' and name='Aying')
where id in (6,7);
update mitarbeiter SET OID=(SELECT id from ort where plz='82061' and name='Neuried')
where id in (4,5);
update mitarbeiter SET OID=(SELECT id from ort where plz='85521' and name='Hohenbrunn')
where id = 3;
update mitarbeiter SET OID=(SELECT id from ort where plz='85653' and name='Aying')
where id = 2;
update mitarbeiter SET OID=(SELECT id from ort where plz='85609' and name='Aschheim')
where id = 1;

Alter table ort Add constraint fk_ort_landkreis
Foreign key (lid) References landkreis (id);

Alter table landkreis Add constraint fk_landkreis_bundesland
Foreign key (bid) References bundesland (id);

select m.name, m.vorname, o.plz, o.name from mitarbeiter m left join ort o on m.oid=o.id;

UPDATE 

select * from ort where lid is null limit 5;

INSERT INTO landkreis (name,bid)
SELECT
name, id
from bundesland
ORDER BY name;


UPDATE ort inner JOIN csv_ort on ort.name = csv_ort.ort
set lid = (SELECT id FROM bundesland where name = csv_ort.bundesland)
where lid is null;