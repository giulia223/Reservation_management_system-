CREATE TABLE Agentie(
    id_agentie NUMBER PRIMARY KEY,
    nume VARCHAR2(100) NOT NULL
);

CREATE TABLE Agent(
    id_agent NUMBER PRIMARY KEY,
    id_agentie NUMBER,
    nume VARCHAR2(100),
    telefon VARCHAR2(100),
    FOREIGN KEY(id_agentie) REFERENCES Agentie(id_agentie)
);

CREATE TABLE Client(
    id_client NUMBER PRIMARY KEY,
    nume VARCHAR2(100),
    telefon VARCHAR2(20)
);

CREATE TABLE Recenzii(
    id_recenzie NUMBER PRIMARY KEY,
    id_client NUMBER,
    rating NUMBER CHECK(rating BETWEEN 1 AND 5),
    continut CLOB, 
    data_recenzie DATE,
    FOREIGN KEY(id_client) REFERENCES Client(id_client)
);

CREATE TABLE Destinatie(
    id_destinatie NUMBER PRIMARY KEY,
    nume VARCHAR2(100),
    tara VARCHAR2(100)
);

CREATE TABLE Cazare(
    id_cazare NUMBER PRIMARY KEY,
    tip_cazare VARCHAR2(50),
    nume VARCHAR2(100),
    adresa VARCHAR2(150)
);

CREATE TABLE Discounturi(
    id_discount NUMBER PRIMARY KEY,
    procentaj NUMBER(5,2)
);


CREATE TABLE Zboruri(
    id_zbor NUMBER PRIMARY KEY,
    id_agentie NUMBER,
    companie VARCHAR2(100),
    data_plecare DATE,
    plecare VARCHAR2(100),
    id_destinatie NUMBER,
    FOREIGN KEY(id_agentie) REFERENCES Agentie(id_agentie),
    FOREIGN KEY(id_destinatie) REFERENCES Destinatie(id_destinatie)
);


CREATE TABLE Pachet_Turistic (
    id_pachet NUMBER PRIMARY KEY,
    id_discount NUMBER,
    pret_total NUMBER(10,2),
    data_inceput DATE,
    data_sfarsit DATE,
    FOREIGN KEY (id_discount) REFERENCES Discounturi(id_discount)
);

CREATE TABLE Pachet_Destinatie (
    id_pachet NUMBER,
    id_destinatie NUMBER,
    PRIMARY KEY (id_pachet, id_destinatie),
    FOREIGN KEY (id_pachet) REFERENCES Pachet_Turistic(id_pachet),
    FOREIGN KEY (id_destinatie) REFERENCES Destinatie(id_destinatie)
);

CREATE TABLE Pachet_Cazare (
    id_pachet NUMBER,
    id_cazare NUMBER,
    PRIMARY KEY (id_pachet, id_cazare),
    FOREIGN KEY (id_pachet) REFERENCES Pachet_Turistic(id_pachet),
    FOREIGN KEY (id_cazare) REFERENCES Cazare(id_cazare)
);

CREATE TABLE Rezervare_Extinsa (
    id_rezervare NUMBER PRIMARY KEY,
    id_client NUMBER,
    id_pachet NUMBER,
    id_agent NUMBER,
    data_rezervare DATE,
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_pachet) REFERENCES Pachet_Turistic(id_pachet),
    FOREIGN KEY (id_agent) REFERENCES Agent(id_agent),
    UNIQUE (id_client, id_pachet, id_agent)
);

CREATE TABLE Transferuri (
    id_transfer NUMBER PRIMARY KEY,
    id_rezervare NUMBER,
    locatie_preluare VARCHAR2(100),
    locatie_destinatie VARCHAR2(100),
    data_transfer DATE,
    FOREIGN KEY (id_rezervare) REFERENCES Rezervare_Extinsa(id_rezervare)
);

CREATE TABLE Plata (
    id_plata NUMBER PRIMARY KEY,
    id_rezervare NUMBER,
    suma NUMBER(10,2),
    data_plata DATE,
    metoda_plata VARCHAR2(50),
    FOREIGN KEY (id_rezervare) REFERENCES Rezervare_Extinsa(id_rezervare)
);

CREATE TABLE Hotel (
    id_cazare NUMBER PRIMARY KEY,
    numar_stele NUMBER,
    facilitati VARCHAR2(255),
    FOREIGN KEY (id_cazare) REFERENCES Cazare(id_cazare)
);

CREATE TABLE Pensiune (
    id_cazare NUMBER PRIMARY KEY,
    capacitate NUMBER,
    tip_mese VARCHAR2(100),
    FOREIGN KEY (id_cazare) REFERENCES Cazare(id_cazare)
);
COMMIT;
DROP TABLE Plata CASCADE CONSTRAINTS;
DROP TABLE Transferuri CASCADE CONSTRAINTS;
DROP TABLE Hotel CASCADE CONSTRAINTS;
DROP TABLE Pensiune CASCADE CONSTRAINTS;
DROP TABLE Rezervare_Extinsa CASCADE CONSTRAINTS;
DROP TABLE Pachet_Cazare CASCADE CONSTRAINTS;
DROP TABLE Pachet_Destinatie CASCADE CONSTRAINTS;
DROP TABLE Pachet_Turistic CASCADE CONSTRAINTS;
DROP TABLE Zboruri CASCADE CONSTRAINTS;
DROP TABLE Discounturi CASCADE CONSTRAINTS;
DROP TABLE Cazare CASCADE CONSTRAINTS;
DROP TABLE Destinatie CASCADE CONSTRAINTS;
DROP TABLE Recenzii CASCADE CONSTRAINTS;
DROP TABLE Client CASCADE CONSTRAINTS;
DROP TABLE Agent CASCADE CONSTRAINTS;
DROP TABLE Agentie CASCADE CONSTRAINTS;
COMMIT;