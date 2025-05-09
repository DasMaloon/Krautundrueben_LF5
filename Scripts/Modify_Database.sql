USE db967aaa55;

CREATE TABLE RECIPIE (
    REZEPTID       VARCHAR(50),
    REZEPTNAME     VARCHAR(50),
    BESCHREIBUNG   VARCHAR(255),
    ZUTATENNR      INTEGER,
    ZUBEREITUNG    TEXT,
    PRIMARY KEY (REZEPTID),
    FOREIGN KEY (ZUTATENNR) REFERENCES ZUTAT (ZUTATENNR)
);

Create Table ZUTATENZUWEISUNG (
    ZUWEISUNGSID   VARCHAR(50),
    REZEPTID       VARCHAR(50),
    ZUTATENNR      INTEGER NOT NULL,
    MENGE          INTEGER,

    PRIMARY KEY (ZUWEISUNGSID),
    FOREIGN KEY (REZEPTID) REFERENCES RECIPIE (REZEPTID),
    FOREIGN KEY (ZUTATENNR) REFERENCES ZUTAT (ZUTATENNR)
);

/* Create Kategorietabelle */
CREATE TABLE ERNAEHRUNGSKATEGORIEN (
    KATEGORIEID     VARCHAR(50),
    KATEGORIENAME   VARCHAR(50),
    PRIMARY KEY (KATEGORIEID)
);

Create Table KATEGORIEZUWEISUNG (
    REZEPTID        VARCHAR(50),
    KATEGORIEID     VARCHAR(50),

    PRIMARY KEY (REZEPTID),
    FOREIGN KEY (KATEGORIEID) REFERENCES ERNAEHRUNGSKATEGORIEN (KATEGORIEID)
);

CREATE TABLE BESCHRAENKUNGEN (
    BESCHRAENKUNGSID       VARCHAR(50),
    BESCHRAENKUNGSNAME     VARCHAR(50),
    PRIMARY KEY (BESCHRAENKUNGSID)
);

Create Table ZWISCHENTABELLEZUTATBESCHRAENKUNG (
    ZWIZUTBESCHRID         INTEGER NOT NULL,
    ZUTATENNR              INTEGER NOT NULL,
    BESCHRAENKUNGSID       VARCHAR(50),
  

    PRIMARY KEY (ZWIZUTBESCHRID), 
    FOREIGN KEY (BESCHRAENKUNGSID) REFERENCES BESCHRAENKUNGEN (BESCHRAENKUNGSID),
    FOREIGN KEY (ZUTATENNR) REFERENCES ZUTAT (ZUTATENNR)
);


INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    "R0",
    "Lachslasagne",
    "Eine köstliche Lasagne mit Lachs und Spinat. Perfekt für ein schnelles Abendessen.",
    "Den Spinat 5 min vorgaren, auspressen bis er ganz trocken ist und würzen.
    Den Lachs etwas auftauen lassen, in kleine Stücke schneiden und
    mit Zitrone, Salz und Pfeffer würzen.
    Für die Bechamel-Soße wird die Butter im Topf erhitzt, das Mehl
    verrührt und mit der Milch aufgegossen. Die Brühe dazugeben und
    5 min. kochen lassen. Danach die Sahne dazurühren und nochmals
    aufkochen lassen.
    Schließlich den Parmesan hinzufügen und mit Pfeffer und Muskat
    abschmecken. Jetzt alles abwechselnd in eine feuerfeste Form
    schichten, zuerst die Soße, dann Lasagneblätter, Soße, Spinat,
    Lachs, Käse, Lasagneblätter, usw, Letzte Schicht ist Soße,
    Die Lasagne anschließend bei 200 Grad 45 min. in den Backofen."
);	

INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    "R1",
    "Thaicurry mit Hähnchen",
    "Aromatisches Curry mit zart mariniertem Hähnchen, knackigem Gemüse und cremiger Kokosmilch – schnell zubereitet und perfekt zu Reis",
    "Die Hühnerbrust in Streifen schneiden und in einer Marinade aus Sojasauce, Pfeffer und Zucker ca. 1 Stunde marinieren.
    Im Wok oder in der Pfanne gut anbraten. Herausnehmen.
    Gemischtes Gemüse und Bambussprossen waschen und sehr fein schneiden, ebenfalls anbraten, dann herausnehmen. 
    Die Currypaste und die Kokosmilch im Wok verrühren und kurz (!) durchköcheln lassen. Dann Fleisch und Gemüse wieder zugeben und noch kurz köcheln lassen. 
    Mit Sojasauce abschmecken.
    In der Zwischenzeit den Reis kochen und abtropfen lassen."
);
INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    "R2",
    "Kartoffelsuppe",
    "Eine einfache und leckere Kartoffelsuppe mit Würstchen oder Tofu.",
    "Kartoffeln und Karotte schälen und in grobe Würfel schneiden. Zwiebel würfeln. Lauch in Ringe schneiden.
    Zwiebeln in etwas Olivenöl glasig dünsten, Lauch dazugeben. Mit der Gemüsebrühe ablöschen. 
    Die gewürfelten Kartoffeln und Karotte in die Brühe geben. Alles für ca. 20 min köcheln lassen.
    Anschließend alles mit dem Pürierstab zu einer Suppe pürieren, mit Pfeffer und Muskat abschmecken.
    Die in Scheiben geschnittenen Würstchen in den Suppenteller geben und die heiße Kartoffelsuppe darüber gießen."
);
INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    "R3",
    "Milchreis mit Apfelmus",
    "Ein klassisches Dessert, das einfach zuzubereiten ist.",
    "In einem großen Topf die Butter schmelzen, anschließend den Rundkornreis kurz in der Butter anschwitzen. Nun die zimmerwarme Vollmilch sowie 4 EL Zucker hinzugeben. Vanillezucker hinzugeben. Alles unter vorsichtigem Rühren mit dem Holzkochlöffel einmal aufkochen lassen und dabei aufpassen, dass sich nichts am Topfboden ansetzt.
    Nun den Topf auf eine Herdplatte stellen, die auf kleinster Stufe heizt. Den Milchreis im geschlossenen Topf exakt 30 Minuten ziehen lassen. Nach der Hälfte der Zeit einmal umrühren.
    Nach 30 Minuten ist der Milchreis servierfertig, er kann warm oder kalt gegessen werden.
    Nach Geschmack Apfelmus dazu reichen."
); 
INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    "R4",
    "Sommerlicher Couscous-Salat",
    "Irgendwie ein Salat halt.", /* AENDERN */
    "Couscous in eine Schale geben und mit kochender Gemüsebrühe übergießen. Kurz umrühren, quellen lassen und evtl. Wasser nachgeben. 
    Inzwischen das Gemüse waschen und anschließend würfeln. Die Kräuter waschen und kleinhacken. 
    Diese Zutaten mit dem Couscous vermischen. Nun Öl hinzugeben und zum Schluss mit Salz und Pfeffer abschmecken."
);

INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES ("B01", "Laktose");
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES ("B02", "Weizen");
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES ("B03", "Gluten");
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES ("B04", "Stärke");
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES ("B05", "Karotte");
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES ("B06", "Nuss");


INSERT INTO ZUTAT (ZUTATENNR, BEZEICHNUNG, EINHEIT, NETTOPREIS, BESTAND, lieferant, KALORIEN, KOHLENHYDRATE, PROTEIN) VALUES (9901, "Reis", "Gramm", 1.0, 500, 103, 349, 74.1, 7.2);
INSERT INTO ZUTAT (ZUTATENNR, BEZEICHNUNG, EINHEIT, NETTOPREIS, BESTAND, lieferant, KALORIEN, KOHLENHYDRATE, PROTEIN) VALUES (9902, "Lasagneplatten", "Gramm", 1.0, 400, 103, 356, 71, 12);
INSERT INTO ZUTAT (ZUTATENNR, BEZEICHNUNG, EINHEIT, NETTOPREIS, BESTAND, lieferant, KALORIEN, KOHLENHYDRATE, PROTEIN) VALUES (9003, "Muskat", "Gramm", 1.0, 400, 103, 525, 49, 6);


INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZWIZUTBESCHRID, ZUTATENNR, BESCHRAENKUNGSID ) VALUES (1, 1005, "B05");
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZWIZUTBESCHRID, ZUTATENNR, BESCHRAENKUNGSID ) VALUES (2, 7043, "B05");
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZWIZUTBESCHRID, ZUTATENNR, BESCHRAENKUNGSID ) VALUES (3, 3001, "B01");
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZWIZUTBESCHRID, ZUTATENNR, BESCHRAENKUNGSID ) VALUES (4, 3002, "B01");
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZWIZUTBESCHRID, ZUTATENNR, BESCHRAENKUNGSID ) VALUES (5, 6408, "B02");
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZWIZUTBESCHRID, ZUTATENNR, BESCHRAENKUNGSID ) VALUES (6, 9902, "B02");
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZWIZUTBESCHRID, ZUTATENNR, BESCHRAENKUNGSID ) VALUES (7, 1011, "B04");
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZWIZUTBESCHRID, ZUTATENNR, BESCHRAENKUNGSID ) VALUES (8, 9901, "B04");
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZWIZUTBESCHRID, ZUTATENNR, BESCHRAENKUNGSID ) VALUES (9, 9003, "B06");

-- Zutaten für Lachslasagne (R0)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU1", 'R0', 9902, 250);  -- Lasagneplatten (Gramm)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU2", 'R0', 3001, 500);  -- Vollmilch (ml)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU3", 'R0', 3003, 50);   -- Butter (Gramm)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU4", 'R0', 7043, 2);    -- Gemüsebrühe (Würfel)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU5", 'R0', 9003, 5);   -- Muskat (Gramm)

-- Zutaten für Thaicurry mit Hähnchen (R1)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU6", 'R1', 9901, 200);  -- Reis (Gramm)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU7", 'R1', 1002, 1);    -- Zwiebel (Stück)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU8", 'R1', 1005, 2);   -- Karotte (Stück)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU9", 'R1', 1008, 1);   -- Lauch (Stück)

-- Zutaten für Kartoffelsuppe (R2)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU10", 'R2', 1006, 4);   -- Kartoffel (Stück)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU11", 'R2', 1005, 1);   -- Karotte (Stück)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU12", 'R2', 1002, 1);   -- Zwiebel (Stück)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU13", 'R2', 1008, 1);   -- Lauch (Stück)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU14", 'R2', 7043, 1);   -- Gemüsebrühe (Würfel)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU15", 'R2', 5001, 2);   -- Wiener Würstchen (Paar) oder
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU16", 'R2', 9001, 2);   -- Tofu-Würstchen (Stück)

-- Zutaten für Milchreis mit Apfelmus (R3)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU17", 'R3', 9901, 100);  -- Reis (Gramm)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU18", 'R3', 3001, 500);  -- Vollmilch (ml)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU19", 'R3', 3003, 20);   -- Butter (Gramm)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU20", 'R3', 2001, 2);    -- Apfel (Stück)

-- Zutaten für Sommerlicher Couscous-Salat (R4)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU21", 'R4', 6408, 200);  -- Couscous (Gramm)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU22", 'R4', 7043, 1);    -- Gemüsebrühe (Würfel)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU23", 'R4', 1003, 2);    -- Tomate (Stück)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU24", 'R4', 1005, 1);    -- Karotte (Stück)
INSERT INTO ZUTATENZUWEISUNG (ZUWEISUNGSID, REZEPTID, ZUTATENNR, MENGE) VALUES ("ZU25", 'R4', 1012, 1);   -- Schnittlauch (Bund)


INSERT INTO ERNAEHRUNGSKATEGORIEN (KATEGORIEID, KATEGORIENAME) VALUES ("K01", "Vegan");
INSERT INTO ERNAEHRUNGSKATEGORIEN (KATEGORIEID, KATEGORIENAME) VALUES ("K02", "Vegetarisch");
INSERT INTO ERNAEHRUNGSKATEGORIEN (KATEGORIEID, KATEGORIENAME) VALUES ("K03", "Low Carb");
INSERT INTO ERNAEHRUNGSKATEGORIEN (KATEGORIEID, KATEGORIENAME) VALUES ("K04", "Keto");
INSERT INTO ERNAEHRUNGSKATEGORIEN (KATEGORIEID, KATEGORIENAME) VALUES ("K05", "High Protein");
INSERT INTO ERNAEHRUNGSKATEGORIEN (KATEGORIEID, KATEGORIENAME) VALUES ("K06", "Low Fat");

INSERT INTO KATEGORIEZUWEISUNG (REZEPTID, KATEGORIEID) VALUES ("R0", "K05");
INSERT INTO KATEGORIEZUWEISUNG (REZEPTID, KATEGORIEID) VALUES ("R1", "K06");
INSERT INTO KATEGORIEZUWEISUNG (REZEPTID, KATEGORIEID) VALUES ("R2", "K01");
INSERT INTO KATEGORIEZUWEISUNG (REZEPTID, KATEGORIEID) VALUES ("R3", "K02");
INSERT INTO KATEGORIEZUWEISUNG (REZEPTID, KATEGORIEID) VALUES ("R4", "K01");

