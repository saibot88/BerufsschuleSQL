Use gm1;
Set names utf8;

Set @old_Foreign_Key_checks = @@Foreign_Key_Checks, FOREIGN_Key_Checks=0;
Set @old_Unique_checks = @@Unique_checks, Unique_checks=0;

DROP Table if exists ort;
Create Table ort
(
    id INT PRIMARY Key AUTO_INCREMENT,
    plz VARCHAR(10),
    name VARCHAR(50)
)Engine = InnoDB DEFAULT Charset=utf8;

DROP Table if exists abteilung;
Create Table abteilung
(
    id INT PRIMARY Key AUTO_INCREMENT,
    abteilung VARCHAR(50),
    lid INT
)Engine = InnoDB DEFAULT Charset=utf8;

DROP Table if exists gehalt;
Create Table gehalt
(
    id INT PRIMARY Key AUTO_INCREMENT,
    gehalt DECIMAL(9,2),
    iban VARCHAR(25)
)Engine = InnoDB DEFAULT Charset=utf8;

DROP Table if exists mitarbeiter;
Create Table mitarbeiter
(
    id INT PRIMARY Key AUTO_INCREMENT,
    name VARCHAR(50),
    vorname VARCHAR(50),
    gebdate Date,
    strasse VARCHAR(50),
    oid INT,
    aid INT
)Engine = InnoDB DEFAULT Charset=utf8;

Alter table gehalt Add Constraint fk_gehalt_mitarebeiter
Foreign key (id) References mitarbeiter (id);

Alter table mitarbeiter Add Constraint fk_mitarbeiter_ort
Foreign key (oid) References ort (id);

Alter table mitarbeiter Add Constraint fk_mitarbeiter_abteilung
Foreign key (aid) References abteilung (id);

Alter table abteilung Add Constraint fk_abteilung_mitarbeiter
Foreign key (lid) References mitarbeiter (id);

Set FOREIGN_Key_checks = @old_foreign_key_checks;
Set UNIQUE_Checks = @Old_Unique_checks;