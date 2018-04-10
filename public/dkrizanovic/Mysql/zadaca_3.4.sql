-- Zadatak 3.2
-- Ispišite matične brojeve te imena i prezimena svih studenata. Ime i prezime treba ispisati zajedno, u jednom stupcu.

SELECT 
stud.mbrStud, CONCAT(ImeStud,  prezStud) Studenti
FROM
stud;

-- Zadatak 3.3
-- Ispišite sva imena studenata tako da se ni jedno ne pojavi dva puta. Sortirajte imena silazno po abecedi
SELECT
DISTINCT stud.imeStud
FROM
stud
ORDER BY imeStud DESC;

-- Zadatak 3.4
-- Ispišite matične brojeve studenata koji su položili ispit iz predmeta sa šifrom 146
SELECT
mbrStud
FROM
ispit
WHERE ispit.sifPred=146;

-- Zadatak 3.5
-- Ispišite imena i prezimena nastavnika te njihovu plaću dobivenu formulom: (koeficijent + 0.4) * 800
SELECT
nastavnik.imeNastavnik,nastavnik.prezNastavnik, (nastavnik.koef+0.4)*800 AS Placa
FROM
nastavnik;
-- Zadatak 3.6
-- Ispišite imena i prezimena nastavnika iz prethodnog zadatka koji imaju plaću manju od 3.500,00 
-- ili veću od 8.000,00 kn
SELECT 
nastavnik.imeNastavnik, nastavnik.prezNastavnik, (nastavnik.koef+0.4)*800 AS Placa
FROM
nastavnik
WHERE ((nastavnik.koef+0.4)*800 <3500) OR ((nastavnik.koef+0.4)*800 > 8000);

-- Zadatak 3.7
-- Ispišite imena i prezimena studenata koji su barem jednom pali na ispitu iz predmeta sa šiframa od 220 do 240;
SELECT
stud.imeStud,stud.prezStud
FROM
stud
INNER JOIN (
SELECT ispit.mbrStud, ispit.sifPred, ispit.ocjena
FROM ispit
WHERE ispit.sifPred BETWEEN 220 AND 240 AND ispit.ocjena = 1) ispiti ON stud.mbrStud=ispiti.mbrStud;
-- Zadatak 3.8
-- Ispiši imena i prezimena studenata koji su na nekom ispitu dobili 3.

SELECT DISTINCT imeStud, prezStud FROM stud
JOIN ispit ON stud.mbrStud=ispit.mbrStud WHERE ocjena=3;
-- Zadatak 3.9
-- Ispišite nazive predmeta na koje nije izašao niti jedan student.

SELECT nazPRED FROM pred
LEFT JOIN ispit ON pred.sifPred=ispit.sifPred WHERE datIspit IS NULL
ORDER BY nazPred;
-- Zadatak 3.10
-- Ispišite nazive predmeta na koje je izašao barem jedan student

SELECT DISTINCT nazPred FROM pred
INNER JOIN ispit ON pred.sifPred = ispit.sifPred;
-- Zadatak 3.11
-- Ispišite sve podatke o studentima čije ime počinje i završava samoglasnikom.

SELECT
*
FROM stud
WHERE LEFT(imeStud,1) IN ('A','E','I','O','U') AND RIGHT(imeStud,1) IN ('A','E','I','O','U');
-- Zadatak 3.12
-- Ispišite sve podatke o studentima kojima ime počinje i završava bilo kojim znakom osim samoglasnikom

SELECT
*
FROM stud
WHERE LEFT(imeStud,1) NOT IN ('A','E','I','O','U') AND RIGHT(imeStud,1) NOT IN ('A','E','I','O','U');