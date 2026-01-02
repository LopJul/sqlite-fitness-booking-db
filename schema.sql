-- SQLite Kunto Oy Fitness Studio Booking System Database Schema
-- Cleaned and structured for portfolio use

PRAGMA foreign_keys = ON;

--
-- Table: Postinumerot
--
CREATE TABLE IF NOT EXISTS Postinumerot (
  Postinumero TEXT (5) PRIMARY KEY NOT NULL, 
  Paikkakunta TEXT (50) NOT NULL
  );

--
-- Table: Asiakkaat
--
CREATE TABLE IF NOT EXISTS Asiakkaat (
  Asiakas_id INTEGER PRIMARY KEY NOT NULL, 
  Etunimi TEXT (100) NOT NULL, 
  Sukunimi TEXT (100) NOT NULL, 
  Puhelin TEXT (15), 
  Email TEXT (150) UNIQUE NOT NULL, 
  Katuosoite TEXT (200), 
  Postinumero TEXT (5) NOT NULL,

  FOREIGN KEY (Postinumero) REFERENCES Postinumerot(Postinumero)
  );

--
-- Table: Ohjaajat
--
CREATE TABLE IF NOT EXISTS Ohjaajat (
  Ohjaaja_id INTEGER PRIMARY KEY NOT NULL, 
  Etunimi TEXT (100) NOT NULL, 
  Sukunimi TEXT NOT NULL, 
  Puhelin TEXT (15), 
  Email TEXT (150) UNIQUE NOT NULL
  );

--
-- Table: Lajit
--
CREATE TABLE IF NOT EXISTS Lajit (
  Laji_id INTEGER PRIMARY KEY NOT NULL, 
  Nimi TEXT (50) NOT NULL
  );

--
-- Table: Tasot
--
CREATE TABLE IF NOT EXISTS Tasot (
  Taso_id INTEGER PRIMARY KEY NOT NULL, 
  Nimi TEXT (50) NOT NULL
  );

--
-- Table: Paikat
--
CREATE TABLE IF NOT EXISTS Paikat (
  Paikka_id INTEGER PRIMARY KEY NOT NULL, 
  Nimi TEXT (50) NOT NULL, 
  Katuosoite TEXT (200) NOT NULL,
  Postinumero TEXT (5) NOT NULL, 
  Max_lkm INTEGER NOT NULL,

  FOREIGN KEY (Postinumero) REFERENCES Postinumerot(Postinumero)
  );

--
-- Table: Tunnit
--
CREATE TABLE IF NOT EXISTS Tunnit (
  Tunti_id INTEGER PRIMARY KEY NOT NULL, 
  Laji_id INTEGER, 
  Taso_id INTEGER NOT NULL,
  Kesto INTEGER NOT NULL, 
  Kuvaus TEXT (200), 
  Max_lkm INTEGER,

  FOREIGN KEY (Laji_id) REFERENCES Lajit(Laji_id),
  FOREIGN KEY (Taso_id) REFERENCES Tasot(Taso_id)
  );

--
-- Table: Tuntitoteutukset
--
CREATE TABLE IF NOT EXISTS Tuntitoteutukset (
  Toteutus_id INTEGER PRIMARY KEY NOT NULL, 
  Ajankohta TEXT NOT NULL, 
  Kesto INTEGER NOT NULL, 
  Ohjaaja_id INTEGER NOT NULL, 
  Paikka_id INTEGER NOT NULL, 
  Tunti_id INTEGER NOT NULL, 
  Max_lkm INTEGER NOT NULL,

  FOREIGN KEY (Ohjaaja_id) REFERENCES Ohjaajat(Ohjaaja_id),
  FOREIGN KEY (Paikka_id) REFERENCES Paikat(Paikka_id),
  FOREIGN KEY (Tunti_id) REFERENCES Tunnit(Tunti_id)
  );

--
-- Table: Varaukset
--
CREATE TABLE IF NOT EXISTS Varaukset (
  Varaus_id INTEGER PRIMARY KEY NOT NULL, 
  Asiakas_id INTEGER NOT NULL, 
  Toteutus_id INTEGER NOT NULL, 
  Varauspvm TEXT (30) NOT NULL, 
  Peruutettu INTEGER NOT NULL DEFAULT 0,

  FOREIGN KEY (Asiakas_id) REFERENCES Asiakkaat(Asiakas_id),
  FOREIGN KEY (Toteutus_id) REFERENCES Tuntitoteutukset(Toteutus_id),
  CHECK (peruutettu IN (0, 1)));


--
-- Table: Ohj_osaamiset
-- Junction table without primary key by design
--
CREATE TABLE IF NOT EXISTS Ohj_osaamiset (
  Ohjaaja_id INTEGER NOT NULL, 
  Laji_id INTEGER NOT NULL,

  FOREIGN KEY (Ohjaaja_id) REFERENCES Ohjaajat(Ohjaaja_id),
  FOREIGN KEY (Laji_id) REFERENCES Lajit(Laji_id)
  );
