DROP database if exists gm1;
CREATE database gm1 Character set utf8;

DROP database if exists gm2;
CREATE database gm2 Character set utf8;

DROP database if exists gm3;
CREATE database gm3 Character set utf8;

Drop User if exists 'test'@'localhost';
CREATE User 'test'@'localhost' Identified by '';

GRANT ALL PRIVILEGES On gm1.* to 'test'@'localhost';
GRANT ALL PRIVILEGES On gm2.* to 'test'@'localhost';
GRANT ALL PRIVILEGES On gm3.* to 'test'@'localhost';

Flush PRIVILEGES;