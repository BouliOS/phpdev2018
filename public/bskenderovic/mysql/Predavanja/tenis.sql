CREATE DATABASE Tenis;

USE Tenis;

CREATE TABLE Tenisaci(
  id INT(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ime VARCHAR (100) NOT NULL,
  prezime VARCHAR (100) NOT NULL, 
  trener_id INT(11) UNSIGNED NULL,
  index trener_idx (trener_id),
  CONSTRAINT trener_fk FOREIGN KEY (trener_id) REFERENCES tenisaci (id) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Susreti(
  id INT(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  domacin_id INT(11) UNSIGNED NOT NULL,
  gost_id INT(11) UNSIGNED NOT NULL,
  pobjednik BIT NOT NULL,
  vrijeme TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  index dom_idx (domacin_id),
  index gost_idx (gost_id),
  CONSTRAINT dom_fk FOREIGN KEY (domacin_id) REFERENCES tenisaci (id),
  CONSTRAINT gost_fk FOREIGN KEY (gost_id) REFERENCES tenisaci (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

USE Tenis;


SELECT
domacin_id,
SUM(pobjednik)

FROM Susreti
GROUP BY domacin_id;


SELECT
gost_id,
COUNT(pobjednik)

FROM Susreti
WHERE pobjednik=0
GROUP BY gost_id;

SELECT t1.igrac, SUM(t1.bodovi) AS rezultat FROM(
SELECT
domacin_id as igrac,
SUM(pobjednik) 



