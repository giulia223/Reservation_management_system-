--1Afișează numele clienților care au făcut o rezervare pentru un pachet turistic ce include cazare la un hotel situat într-o destinație din Italia, împreună cu data rezervării și prețul pachetului.

SELECT c.nume, r.data_rezervare, pt.pret_total
FROM Client c
JOIN Rezervare_Extinsa r ON c.id_client = r.id_client
JOIN Pachet_Turistic pt ON r.id_pachet = pt.id_pachet
WHERE EXISTS (
    SELECT 1
    FROM Pachet_Destinatie pd
    JOIN Destinatie d ON pd.id_destinatie = d.id_destinatie
    JOIN Pachet_Cazare pc ON pc.id_pachet = pd.id_pachet
    JOIN Cazare cz ON pc.id_cazare = cz.id_cazare
    WHERE d.tara = 'Italia'
    AND pd.id_pachet = r.id_pachet
);






--2Afișează perechi (nume client, nume agent) pentru clienții care au făcut rezervări, agentul asociat cu agenția acelui pachet și suma plătită. Informațiile sunt extrase prin subcereri independente.
SELECT c.nume AS nume_client, a.nume AS nume_agent, p.suma AS suma_platita
FROM 
    (SELECT id_client, nume FROM Client) c
JOIN 
    Rezervare_Extinsa r ON c.id_client = r.id_client
JOIN 
    (SELECT id_agent, nume FROM Agent) a ON a.id_agent = r.id_agent
JOIN 
    Plata p ON p.id_rezervare = r.id_rezervare;





--3Afișează ID-ul agentului și numărul total de rezervări procesate, doar pentru acei agenți care au procesat rezervări cu o sumă medie plătită mai mare decât media globală a sumelor plătite de toți clienții.
SELECT r.id_agent, COUNT(*) AS nr_rezervari, ROUND(AVG(p.suma), 2) AS medie_agent
FROM Rezervare_Extinsa r
JOIN Plata p ON p.id_rezervare = r.id_rezervare
GROUP BY r.id_agent
HAVING AVG(p.suma) > (
    SELECT AVG(suma) FROM Plata
);




--4Afișează toate plățile, în care:

--se înlocuiește valoarea NULL a sumei plătite cu 0

--metoda de plată este transformată într-un text explicit (folosind DECODE)

--rezultatele sunt ordonate descrescător după sumă
SELECT
    id_plata,
    NVL(suma, 0) AS suma_finala,
    DECODE(metoda_plata, 'Card', 'Plata cu cardul', 'Cash', 'Plata cash', 'Transfer', 'Plata prin transfer', 'Alta') AS descriere_metoda
FROM Plata
ORDER BY NVL(suma, 0) DESC;



--5Pentru fiecare client, afișează:

--numele cu majuscule și primele 3 litere

--data rezervării și numărul de zile rămase până la plecare

--clasificare: Foarte devreme, In curand sau Ultima saptamana în funcție de zilele rămase până la plecare.
WITH ZileRamase AS (
    SELECT 
        r.id_client,
        r.data_rezervare,
        pt.data_inceput,
        TRUNC(pt.data_inceput - SYSDATE) AS zile_ramase
    FROM Rezervare_Extinsa r
    JOIN Pachet_Turistic pt ON r.id_pachet = pt.id_pachet
)
SELECT 
    INITCAP(c.nume) AS nume_formatat,
    SUBSTR(c.nume, 1, 3) AS prefix_nume,
    zr.data_rezervare,
    zr.data_inceput,
    zr.zile_ramase,
    CASE 
        WHEN zr.zile_ramase > 30 THEN 'Foarte devreme'
        WHEN zr.zile_ramase BETWEEN 8 AND 30 THEN 'In curand'
        ELSE 'Ultima saptamana'
    END AS categorie_timp
FROM ZileRamase zr
JOIN Client c ON zr.id_client = c.id_client;


