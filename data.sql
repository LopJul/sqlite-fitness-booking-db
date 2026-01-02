-- SQLite Kunto Oy Fitness Studio Booking System Sample Data
-- Ordered for foreign key integrity

PRAGMA foreign_keys = ON;

-- Postinumerot
INSERT INTO Postinumerot (Postinumero, Paikkakunta) VALUES ('00100', 'Helsinki');
INSERT INTO Postinumerot (Postinumero, Paikkakunta) VALUES ('01300', 'Vantaa');
INSERT INTO Postinumerot (Postinumero, Paikkakunta) VALUES ('02230', 'Espoo');

-- Asiakkaat
INSERT INTO Asiakkaat (Asiakas_id, Etunimi, Sukunimi, Puhelin, Email, Katuosoite, Postinumero) 
VALUES (1, 'Laura', 'Lintu', '041 212 3213', 'laura.lintu@email.com', 'Laurilantie 3', '02230');
INSERT INTO Asiakkaat (Asiakas_id, Etunimi, Sukunimi, Puhelin, Email, Katuosoite, Postinumero) 
VALUES (2, 'Riku', 'Virtanen', '041 343 4321', 'riku.virtanen@email.com', 'Voudintie 4', '01300');

-- Lajit
INSERT INTO Lajit (Laji_id, Nimi) VALUES (1, 'Pilates');
INSERT INTO Lajit (Laji_id, Nimi) VALUES (2, 'Venyttely');
INSERT INTO Lajit (Laji_id, Nimi) VALUES (3, 'Jooga');
INSERT INTO Lajit (Laji_id, Nimi) VALUES (4, 'BodyPump');
INSERT INTO Lajit (Laji_id, Nimi) VALUES (5, 'Core');
INSERT INTO Lajit (Laji_id, Nimi) VALUES (6, 'Zumba');

-- Ohjaajat
INSERT INTO Ohjaajat (Ohjaaja_id, Etunimi, Sukunimi, Puhelin, Email) VALUES (1, 'Maija', 'Vuorinen', '040 932 1435', 'maija.vuorinen@email.com');
INSERT INTO Ohjaajat (Ohjaaja_id, Etunimi, Sukunimi, Puhelin, Email) VALUES (2, 'Leena', 'Virtanen', '041 123 4324', 'leena.virtanen@email.com');
INSERT INTO Ohjaajat (Ohjaaja_id, Etunimi, Sukunimi, Puhelin, Email) VALUES (3, 'Tommi', 'Lehtinen', '041 678 9685', 'tommi.lehtinen@email.com');
INSERT INTO Ohjaajat (Ohjaaja_id, Etunimi, Sukunimi, Puhelin, Email) VALUES (4, 'Janna', 'Laakso', '040 191 1212', 'janna.laakso@email.com');

-- Ohj_osaamiset (junction table)
INSERT INTO Ohj_osaamiset (Ohjaaja_id, Laji_id) VALUES (4, 2);
INSERT INTO Ohj_osaamiset (Ohjaaja_id, Laji_id) VALUES (3, 4);
INSERT INTO Ohj_osaamiset (Ohjaaja_id, Laji_id) VALUES (1, 3);
INSERT INTO Ohj_osaamiset (Ohjaaja_id, Laji_id) VALUES (2, 1);

-- Tasot
INSERT INTO Tasot (Taso_id, Nimi) VALUES (1, 'Helppo');
INSERT INTO Tasot (Taso_id, Nimi) VALUES (2, 'Keskitaso');
INSERT INTO Tasot (Taso_id, Nimi) VALUES (3, 'Vaativa');

-- Paikat
INSERT INTO Paikat (Paikka_id, Nimi, Katuosoite, Postinumero, Max_lkm) VALUES (1, 'Matinkylän halli', 'Matinlahdentie 1', '02230', 60);
INSERT INTO Paikat (Paikka_id, Nimi, Katuosoite, Postinumero, Max_lkm) VALUES (2, 'Töölön halli', 'Helsingintie 2', '00100', 50);
INSERT INTO Paikat (Paikka_id, Nimi, Katuosoite, Postinumero, Max_lkm) VALUES (3, 'Tikkurilan halli', 'Tikkurilantie 3', '01300', 70);

-- Tunnit
INSERT INTO Tunnit (Tunti_id, Laji_id, Taso_id, Kesto, Kuvaus, Max_lkm) 
VALUES (1, 1, 2, 45, 'Keskitason pilatestunnilla vahvistetaan keskivartalon syviä lihaksia, parannetaan kehonhallintaa ja liikkuvuutta.', 40);
INSERT INTO Tunnit (Tunti_id, Laji_id, Taso_id, Kesto, Kuvaus, Max_lkm) 
VALUES (2, 4, 2, 60, 'BodyPump on tehokas lihaskuntotunti, jossa käytetään levytankoa ja painoja.', 50);

-- Tuntitoteutukset
INSERT INTO Tuntitoteutukset (Toteutus_id, Ajankohta, Kesto, Ohjaaja_id, Paikka_id, Tunti_id, Max_lkm) 
VALUES (1, '2025-05-12 10:00:00', 45, 2, 1, 1, 40);
INSERT INTO Tuntitoteutukset (Toteutus_id, Ajankohta, Kesto, Ohjaaja_id, Paikka_id, Tunti_id, Max_lkm) 
VALUES (2, '2025-05-15 12:15:00', 60, 3, 2, 2, 50);

-- Varaukset
INSERT INTO Varaukset (Varaus_id, Asiakas_id, Toteutus_id, Varauspvm, Peruutettu) 
VALUES (1, 1, 1, '2020-05-03', 0);
INSERT INTO Varaukset (Varaus_id, Asiakas_id, Toteutus_id, Varauspvm, Peruutettu) 
VALUES (2, 2, 2, '2020-05-02', 0);
