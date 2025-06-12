CREATE SEQUENCE seq_id START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

INSERT INTO Agentie VALUES (seq_id.NEXTVAL, 'GlobeTrotters');
INSERT INTO Agentie VALUES (seq_id.NEXTVAL, 'Dream Vacations');
INSERT INTO Agentie VALUES (seq_id.NEXTVAL, 'ExploreMore');
INSERT INTO Agentie VALUES (seq_id.NEXTVAL, 'HolidayHub');
INSERT INTO Agentie VALUES (seq_id.NEXTVAL, 'Wanderlust');
INSERT INTO Agentie VALUES (seq_id.NEXTVAL, 'GetawayPro');
COMMIT;
INSERT INTO Agent VALUES (seq_id.NEXTVAL, 79, 'Andrei Popescu', '0740000001');
INSERT INTO Agent VALUES (seq_id.NEXTVAL, 80, 'Maria Ionescu', '0740000002');
INSERT INTO Agent VALUES (seq_id.NEXTVAL, 81, 'Ioana Georgescu', '0740000003');
INSERT INTO Agent VALUES (seq_id.NEXTVAL, 82, 'Alin Marinescu', '0740000004');
INSERT INTO Agent VALUES (seq_id.NEXTVAL, 83, 'Carmen Dobre', '0740000005');
INSERT INTO Agent VALUES (seq_id.NEXTVAL, 84, 'Radu Ilie', '0740000006');

INSERT INTO Client VALUES (seq_id.NEXTVAL, 'Elena Petrescu', '0722000001');
INSERT INTO Client VALUES (seq_id.NEXTVAL, 'Mihai Barbu', '0722000002');
INSERT INTO Client VALUES (seq_id.NEXTVAL, 'Ana Coman', '0722000003');
INSERT INTO Client VALUES (seq_id.NEXTVAL, 'George Manole', '0722000004');
INSERT INTO Client VALUES (seq_id.NEXTVAL, 'Irina Pavel', '0722000005');
INSERT INTO Client VALUES (seq_id.NEXTVAL, 'Dorin Apostol', '0722000006');

INSERT INTO Recenzii VALUES (seq_id.NEXTVAL, 97, 5, 'Excelent!', TO_DATE('2024-05-10', 'YYYY-MM-DD'));
INSERT INTO Recenzii VALUES (seq_id.NEXTVAL, 98, 4, 'Foarte bun!', TO_DATE('2024-05-11', 'YYYY-MM-DD'));
INSERT INTO Recenzii VALUES (seq_id.NEXTVAL, 99, 3, 'Mediu', TO_DATE('2024-05-12', 'YYYY-MM-DD'));
INSERT INTO Recenzii VALUES (seq_id.NEXTVAL, 100, 5, 'Superb!', TO_DATE('2024-05-13', 'YYYY-MM-DD'));
INSERT INTO Recenzii VALUES (seq_id.NEXTVAL, 101, 2, 'Dezamagitor', TO_DATE('2024-05-14', 'YYYY-MM-DD'));
INSERT INTO Recenzii VALUES (seq_id.NEXTVAL, 102, 4, 'Ok, dar scump', TO_DATE('2024-05-15', 'YYYY-MM-DD'));

INSERT INTO Destinatie VALUES (seq_id.NEXTVAL, 'Paris', 'Franta');
INSERT INTO Destinatie VALUES (seq_id.NEXTVAL, 'Barcelona', 'Spania');
INSERT INTO Destinatie VALUES (seq_id.NEXTVAL, 'Roma', 'Italia');
INSERT INTO Destinatie VALUES (seq_id.NEXTVAL, 'Atena', 'Grecia');
INSERT INTO Destinatie VALUES (seq_id.NEXTVAL, 'Lisabona', 'Portugalia');
INSERT INTO Destinatie VALUES (seq_id.NEXTVAL, 'Berlin', 'Germania');
COMMIT;
INSERT INTO Cazare VALUES (seq_id.NEXTVAL, 'Hotel', 'Hotel Royal', 'Strada Paris 1');
INSERT INTO Cazare VALUES (seq_id.NEXTVAL, 'Pensiune', 'Pensiunea Verde', 'Strada Florilor 2');
INSERT INTO Cazare VALUES (seq_id.NEXTVAL, 'Hotel', 'Grand Hotel', 'Bulevardul Unirii 10');
INSERT INTO Cazare VALUES (seq_id.NEXTVAL, 'Pensiune', 'Casa Ana', 'Strada Muntelui 5');
INSERT INTO Cazare VALUES (seq_id.NEXTVAL, 'Hotel', 'Hotel Victoria', 'Strada Centrala 9');
INSERT INTO Cazare VALUES (seq_id.NEXTVAL, 'Pensiune', 'Vila Maria', 'Strada Mare 15');

INSERT INTO Discounturi VALUES (seq_id.NEXTVAL, 5.00);
INSERT INTO Discounturi VALUES (seq_id.NEXTVAL, 10.00);
INSERT INTO Discounturi VALUES (seq_id.NEXTVAL, 15.00);
INSERT INTO Discounturi VALUES (seq_id.NEXTVAL, 20.00);
INSERT INTO Discounturi VALUES (seq_id.NEXTVAL, 25.00);
INSERT INTO Discounturi VALUES (seq_id.NEXTVAL, 30.00);

INSERT INTO Zboruri VALUES (seq_id.NEXTVAL, 79, 'WizzAir', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'Bucuresti', 109);
INSERT INTO Zboruri VALUES (seq_id.NEXTVAL, 80, 'Tarom', TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'Cluj', 110);
INSERT INTO Zboruri VALUES (seq_id.NEXTVAL, 81, 'Ryanair', TO_DATE('2024-06-10', 'YYYY-MM-DD'), 'Timisoara', 111);
INSERT INTO Zboruri VALUES (seq_id.NEXTVAL, 82, 'BlueAir', TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'Iasi', 112);
INSERT INTO Zboruri VALUES (seq_id.NEXTVAL, 83, 'AirFrance', TO_DATE('2024-06-20', 'YYYY-MM-DD'), 'Bucuresti', 113);
INSERT INTO Zboruri VALUES (seq_id.NEXTVAL, 84, 'Lufthansa', TO_DATE('2024-06-25', 'YYYY-MM-DD'), 'Sibiu', 114);

INSERT INTO Hotel VALUES (115, 115, 'WiFi, Parcare, Mic dejun');
INSERT INTO Hotel VALUES (117, 117, 'Spa, Restaurant, Piscina');
INSERT INTO Hotel VALUES (119, 119, 'WiFi, TV, Minibar');

INSERT INTO Pensiune VALUES (116, 116, 'Mic dejun inclus');
INSERT INTO Pensiune VALUES (118, 118, 'Mic dejun, Cina');
INSERT INTO Pensiune VALUES (120, 120, 'Mic dejun, Pranz');

INSERT INTO Pachet_Turistic VALUES (seq_id.NEXTVAL, 121, 1200.00, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-10', 'YYYY-MM-DD'));
INSERT INTO Pachet_Turistic VALUES (seq_id.NEXTVAL, 122, 1500.00, TO_DATE('2024-07-05', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'));
INSERT INTO Pachet_Turistic VALUES (seq_id.NEXTVAL, 123, 1000.00, TO_DATE('2024-07-10', 'YYYY-MM-DD'), TO_DATE('2024-07-20', 'YYYY-MM-DD'));
INSERT INTO Pachet_Turistic VALUES (seq_id.NEXTVAL, 124, 1800.00, TO_DATE('2024-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-25', 'YYYY-MM-DD'));
INSERT INTO Pachet_Turistic VALUES (seq_id.NEXTVAL, 125, 1100.00, TO_DATE('2024-07-20', 'YYYY-MM-DD'), TO_DATE('2024-07-30', 'YYYY-MM-DD'));
INSERT INTO Pachet_Turistic VALUES (seq_id.NEXTVAL, 126, 2000.00, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-10', 'YYYY-MM-DD'));

INSERT INTO Pachet_Destinatie VALUES (145, 109);
INSERT INTO Pachet_Destinatie VALUES (146, 110);
INSERT INTO Pachet_Destinatie VALUES (147, 111);
INSERT INTO Pachet_Destinatie VALUES (148, 112);
INSERT INTO Pachet_Destinatie VALUES (150, 113);
INSERT INTO Pachet_Destinatie VALUES (150, 114);
INSERT INTO Pachet_Destinatie VALUES (149, 113);
INSERT INTO Pachet_Destinatie VALUES (149, 114);
INSERT INTO Pachet_Destinatie VALUES (146, 109);
INSERT INTO Pachet_Destinatie VALUES (147, 110);

INSERT INTO Pachet_Cazare VALUES (145, 115);
INSERT INTO Pachet_Cazare VALUES (146, 116);
INSERT INTO Pachet_Cazare VALUES (147, 117);
INSERT INTO Pachet_Cazare VALUES (148, 118);
INSERT INTO Pachet_Cazare VALUES (149, 119);
INSERT INTO Pachet_Cazare VALUES (150, 120);
INSERT INTO Pachet_Cazare VALUES (145, 116);
INSERT INTO Pachet_Cazare VALUES (146, 115);
INSERT INTO Pachet_Cazare VALUES (147, 119);
INSERT INTO Pachet_Cazare VALUES (148, 115);

INSERT INTO Rezervare_Extinsa VALUES (seq_id.NEXTVAL, 97, 145, 91, TO_DATE('2024-05-20', 'YYYY-MM-DD'));
INSERT INTO Rezervare_Extinsa VALUES (seq_id.NEXTVAL, 98, 146, 92, TO_DATE('2024-05-21', 'YYYY-MM-DD'));
INSERT INTO Rezervare_Extinsa VALUES (seq_id.NEXTVAL, 99, 147, 93, TO_DATE('2024-05-22', 'YYYY-MM-DD'));
INSERT INTO Rezervare_Extinsa VALUES (seq_id.NEXTVAL, 100, 148, 94, TO_DATE('2024-05-23', 'YYYY-MM-DD'));
INSERT INTO Rezervare_Extinsa VALUES (seq_id.NEXTVAL, 101, 149, 95, TO_DATE('2024-05-24', 'YYYY-MM-DD'));
INSERT INTO Rezervare_Extinsa VALUES (seq_id.NEXTVAL, 102, 150, 96, TO_DATE('2024-05-25', 'YYYY-MM-DD'));

INSERT INTO Transferuri VALUES (seq_id.NEXTVAL, 151, 'Aeroport Otopeni', 'Hotel Royal', TO_DATE('2024-07-01', 'YYYY-MM-DD'));
INSERT INTO Transferuri VALUES (seq_id.NEXTVAL, 152, 'Gara Barcelona', 'Pensiunea Verde', TO_DATE('2024-07-05', 'YYYY-MM-DD'));
INSERT INTO Transferuri VALUES (seq_id.NEXTVAL, 153, 'Aeroport Roma', 'Grand Hotel', TO_DATE('2024-07-10', 'YYYY-MM-DD'));
INSERT INTO Transferuri VALUES (seq_id.NEXTVAL, 154, 'Port Atena', 'Casa Ana', TO_DATE('2024-07-15', 'YYYY-MM-DD'));
INSERT INTO Transferuri VALUES (seq_id.NEXTVAL, 155, 'Gara Lisabona', 'Hotel Victoria', TO_DATE('2024-07-20', 'YYYY-MM-DD'));
INSERT INTO Transferuri VALUES (seq_id.NEXTVAL, 156, 'Aeroport Berlin', 'Vila Maria', TO_DATE('2024-08-01', 'YYYY-MM-DD'));

INSERT INTO Plata VALUES (seq_id.NEXTVAL, 151, 1140.00, TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Card');
INSERT INTO Plata VALUES (seq_id.NEXTVAL, 152, 1350.00, TO_DATE('2024-05-21', 'YYYY-MM-DD'), 'Transfer bancar');
INSERT INTO Plata VALUES (seq_id.NEXTVAL, 153, 850.00, TO_DATE('2024-05-22', 'YYYY-MM-DD'), 'Numerar');
INSERT INTO Plata VALUES (seq_id.NEXTVAL, 154, 1440.00, TO_DATE('2024-05-23', 'YYYY-MM-DD'), 'Card');
INSERT INTO Plata VALUES (seq_id.NEXTVAL, 155, 990.00, TO_DATE('2024-05-24', 'YYYY-MM-DD'), 'Card');
INSERT INTO Plata VALUES (seq_id.NEXTVAL, 156, 1400.00, TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'Transfer bancar');
COMMIT;

