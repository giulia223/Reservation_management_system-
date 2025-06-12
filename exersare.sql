CREATE TABLE Produse(
    id_produs NUMBER PRIMARY KEY,
    nume VARCHAR2(50) NOT NULL,
    pret NUMBER NOT NULL
);
COMMIT;
INSERT INTO Produse (id_produs, nume, pret) VALUES (1, 'rimel', 23);
INSERT INTO Produse (id_produs, nume, pret) VALUES (2, 'fond de ten', 45);
INSERT INTO Produse (id_produs, nume, pret) VALUES (3, 'ruj', 15);
COMMIT;

SELECT * FROM Produse;
SELECT *FROM Produse WHERE pret>100;

CREATE TABLE Comenzi(
    id_comanda NUMBER PRIMARY KEY,
    cantitate NUMBER,
    id_produs NUMBER,
    FOREIGN KEY(id_produs) REFERENCES Produse(id_produs)
);
COMMIT;
INSERT INTO Comenzi (id_comanda, cantitate, id_produs) VALUES (1, 2, 1);
INSERT INTO Comenzi (id_comanda, cantitate, id_produs) VALUES (2, 1, 2);
INSERT INTO Comenzi (id_comanda, cantitate, id_produs) VALUES (3, 3, 3);
 
SELECT c.id_comanda, p.nume, c.cantitate, p.pret
FROM comenzi c
JOIN produse p ON c.id_produs = p.id_produs;

SELECT * FROM Produse WHERE pret>20 AND pret<50;
SELECT * FROM Comenzi WHERE cantitate>2;
SELECT * FROM PRODUSE WHERE nume!= 'ruj';
--nivel 2
SELECT COUNT(*) FROM Comenzi; 
SELECT c.id_comanda, SUM(p.pret*c.cantitate) AS valoare_comanda
FROM Comenzi c
JOIN Produse p ON c.id_produs=p.id_produs
GROUP BY c.id_comanda;
SELECT p.nume, SUM(c.cantitate) AS total_vandut 
FROM Comenzi c 
JOIN Produse p ON c.id_produs=p.id_produs 
GROUP BY p.nume; 

--nivel 3
SELECT UPPER(nume) FROM Produse;
SELECT SUBSTR(nume, 1, 3) FROM Produse;
ALTER TABLE Comenzi ADD data_comanda DATE; 
UPDATE Comenzi SET data_comanda=TO_DATE('2024-05-01', 'YYYY-MM-DD') WHERE id_comanda=1;
UPDATE Comenzi SET data_comanda = TO_DATE('2024-05-03', 'YYYY-MM-DD') WHERE id_comanda = 2;
UPDATE Comenzi SET data_comanda = TO_DATE('2024-05-10', 'YYYY-MM-DD') WHERE id_comanda = 3;
COMMIT;
SELECT * FROM Comenzi where data_comanda>TO_DATE('2024-05-01', 'YYYY-MM-DD');

--nivel 4
SELECT * FROM Produse 
WHERE id_produs IN (SELECT id_produs FROM Comenzi); 
SELECT * FROM Produse 
WHERE pret=(SELECT MAX(pret) FROM Produse); 

--nivel 5
ALTER TABLE Produse ADD stoc NUMBER;
UPDATE Produse SET stoc = 10 WHERE id_produs = 1;
UPDATE Produse SET stoc = 0 WHERE id_produs = 2;
UPDATE Produse SET stoc = NULL WHERE id_produs = 3;

SELECT nume,
        CASE 
            WHEN stoc IS NULL OR stoc=0 THEN 'stoc epuizat' 
            ELSE 'in stoc'
        END AS status_stoc
FROM Produse;
