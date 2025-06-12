CREATE VIEW v_rezervari_clienti AS
SELECT
    r.id_rezervare,
    c.nume AS nume_client,
    a.nume AS nume_agent,
    pt.pret_total,
    d.procentaj AS discount,
    r.data_rezervare
FROM Rezervare_Extinsa r
JOIN Client c ON r.id_client = c.id_client
JOIN Agent a ON r.id_agent = a.id_agent
JOIN Pachet_Turistic pt ON r.id_pachet = pt.id_pachet
LEFT JOIN Discounturi d ON pt.id_discount = d.id_discount;
SELECT * FROM v_rezervari_clienti;

UPDATE v_rezervari_clienti SET data_rezervare = TO_DATE('2025-07-01', 'YYYY-MM-DD') WHERE id_rezervare = 1; 

--ex15
SELECT
    r.id_rezervare,
    c.nume AS nume_client,
    a.nume AS nume_agent,
    pt.pret_total,
    p.suma
FROM
    Rezervare_Extinsa r
    LEFT JOIN Client c ON r.id_client = c.id_client
    LEFT JOIN Agent a ON r.id_agent = a.id_agent
    LEFT JOIN Pachet_Turistic pt ON r.id_pachet = pt.id_pachet
    LEFT JOIN Plata p ON r.id_rezervare = p.id_rezervare;

SELECT c.nume
FROM Client c
WHERE NOT EXISTS (
    SELECT d.id_destinatie
    FROM Pachet_Destinatie d
    MINUS
    SELECT pd.id_destinatie
    FROM Rezervare_Extinsa r
    JOIN Pachet_Destinatie pd ON r.id_pachet = pd.id_pachet
    WHERE r.id_client = c.id_client
);

SELECT *
FROM (
    SELECT
        c.nume AS nume_client,
        SUM(p.suma) AS total_plata,
        RANK() OVER (ORDER BY SUM(p.suma) DESC) AS rnk
    FROM
        Client c
        JOIN Rezervare_Extinsa r ON c.id_client = r.id_client
        JOIN Plata p ON r.id_rezervare = p.id_rezervare
    GROUP BY c.nume
)
WHERE rnk <= 3;
