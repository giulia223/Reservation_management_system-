--Crește prețul pachetelor care includ o cazare de tip Hotel cu cel puțin 100 stele
UPDATE Pachet_Turistic pt
SET pt.pret_total = pt.pret_total * 1.10
WHERE pt.id_pachet IN (
    SELECT pc.id_pachet
    FROM Pachet_Cazare pc
    JOIN Hotel h ON pc.id_cazare = h.id_cazare
    WHERE h.numar_stele >= 100
);
COMMIT;
SELECT * FROM Pachet_Turistic;


--Aplică un discount suplimentar (procentaj = 25) tuturor pachetelor rezervate de clienți care au dat recenzii de 5 stele
UPDATE Pachet_Turistic pt
SET pt.pret_total = pt.pret_total * (1 - 0.25)
WHERE pt.id_pachet IN (
    SELECT re.id_pachet
    FROM Rezervare_Extinsa re
    WHERE re.id_client IN (
        SELECT DISTINCT r.id_client
        FROM Recenzii r
        WHERE r.rating = 5
    )
);
COMMIT;
COMMIT;




--Actualizează numărul de stele al hotelurilor care au în descrierea facilităților cuvântul SPA
UPDATE Hotel
SET numar_stele = numar_stele + 1
WHERE LOWER(facilitati) LIKE '%spa%';
SELECT * FROM Hotel;

COMMIT;



--  Șterge rezervările făcute de clienții care nu au dat recenzii
DELETE FROM Rezervare_Extinsa
WHERE id_rezervare IN (
    SELECT r.id_rezervare
    FROM Rezervare_Extinsa r
    LEFT JOIN Recenzii rr ON r.id_client = rr.id_client
    WHERE rr.id_recenzie IS NULL
);
COMMIT;
SELECT * FROM Rezervare_Extinsa;

--Șterge recenziile mai vechi de 1 an
DELETE FROM Recenzii
WHERE data_recenzie < ADD_MONTHS(SYSDATE, -12);
SELECT * FROM Recenzii;

--Șterge transferurile pentru rezervări care nu mai există
DELETE FROM Transferuri
WHERE id_rezervare NOT IN (
    SELECT id_rezervare FROM Rezervare_Extinsa
);
SELECT * FROM Transferuri;




