USE db967aaa55; /* Select current database */
-- ########################################### Create new Tables ###########################################

/* Create Rezepttabelle */
CREATE TABLE RECIPIE (
    REZEPTID       VARCHAR(50),
    REZEPTNAME     VARCHAR(50),
    BESCHREIBUNG   VARCHAR(255),
    ZUTATENID      INTEGER,
    ZUBEREITUNG    TEXT(),
    PRIMARY KEY (REZEPTID),
    FOREIGN KEY (ZUTATENNR) REFERENCES ZUTAT (ZUTATENNR)
    /* Kann falsch sein, geht halt nicht */
);

--Zwischentabelle für die Zutaten eines Rezepts
Create Table ZUTATENZUWEISUNG (
    REZEPTID       INTEGER NOT NULL,
    ZUTATENNR      INTEGER NOT NULL,
    MENGE          INTEGER,

    PRIMARY KEY (REZEPTID, ZUTATENNR), /* Das ist wahrscheinlich falsch */
    FOREIGN KEY (REZEPTID) REFERENCES RECIPIE (REZEPTID),
    FOREIGN KEY (ZUTATENNR) REFERENCES ZUTAT (ZUTATENNR)
    /* Kann falsch sein, Ich bin mir nicht sicher */
     /* 100% RICHTIG*/
);

/* Create Kategorietabelle */
CREATE TABLE ERNAEHRUNGSKATEGORIEN (
    KATEGORIEID     VARCHAR(50),
    KATEGORIENAME   VARCHAR(50),
    PRIMARY KEY (KATEGORIEID),
);

--Zwischentabelle für die Kategorien eines Rezepts
Create Table KATEGORIEZUWEISUNG (
    REZEPTID        VARCHAR(50),
    KATEGORIEID     VARCHAR(50),

    PRIMARY KEY (REZEPTID),
    FOREIGN KEY (KATEGORIEID), REFERENCES ERNAEHRUNGSKATEGORIEN (KATEGORIEID)
/* Magucken */
);

/* Create Beschraenkungstable */
CREATE TABLE BESCHRAENKUNGEN (
    BESCHRAENKUNGSID       INTEGER NOT NULL,
    BESCHRAENKUNGSNAME     VARCHAR(50),
    PRIMARY KEY (BESCHRAENKUNGSID)
);

--Zwischentabelle für die die Beschraenkungen der einzelnen Zutaten
Create Table ZWISCHENTABELLEZUTATBESCHRAENKUNG (
    ZUTATENNR              INTEGER NOT NULL,
    BESCHRAENKUNGSID       INTEGER NOT NULL,
  

    PRIMARY KEY (BESCHRAENKUNGSID, ZUTATENNR), 
    FOREIGN KEY (RBESCHRAENKUNGSID) REFERENCES BESCHRAENKUNGEN (BESCHRAENKUNGSID),
    FOREIGN KEY (ZUTATENNR) REFERENCES ZUTAT (ZUTATENNR)
);

-- ########################################### Fill Tables with dummy Content ###########################################

/* Create Test Items */
INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    R0,
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
    /* Allergene: Laktose, Weizen, Gluten */
);	

INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    R1,
    "Thaicurry mit Hähnchen",
    "Ein klassisches italienisches Gericht mit Hackfleisch und Tomatensauce.",
    "Die Hühnerbrust in Streifen schneiden und in einer Marinade aus Sojasauce, Pfeffer und Zucker ca. 1 Stunde marinieren.
    Im Wok oder in der Pfanne gut anbraten. Herausnehmen.
    Gemischtes Gemüse und Bambussprossen waschen und sehr fein schneiden, ebenfalls anbraten, dann herausnehmen. 
    Die Currypaste und die Kokosmilch im Wok verrühren und kurz (!) durchköcheln lassen. Dann Fleisch und Gemüse wieder zugeben und noch kurz köcheln lassen. 
    Mit Sojasauce abschmecken.
    In der Zwischenzeit den Reis kochen und abtropfen lassen."
    /* Allergene: Gluten */
);
INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    R2,
    "Kartoffelsuppe",
    "Eine einfache und leckere Kartoffelsuppe mit Würstchen.",
    "Kartoffeln und Karotte schälen und in grobe Würfel schneiden. Zwiebel würfeln. Lauch in Ringe schneiden.
    Zwiebeln in etwas Olivenöl glasig dünsten, Lauch dazugeben. Mit der Gemüsebrühe ablöschen. 
    Die gewürfelten Kartoffeln und Karotte in die Brühe geben. Alles für ca. 20 min köcheln lassen.
    Anschließend alles mit dem Pürierstab zu einer Suppe pürieren, mit Pfeffer und Muskat abschmecken.
    Die in Scheiben geschnittenen Würstchen in den Suppenteller geben und die heiße Kartoffelsuppe darüber gießen."
    /* Allergene: Stärke, Karotte */
);
INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    R3,
    "Milchreis mit Apfelmus",
    "Ein klassisches Dessert, das einfach zuzubereiten ist.",
    "In einem großen Topf die Butter schmelzen, anschließend den Rundkornreis kurz in der Butter anschwitzen. Nun die zimmerwarme Vollmilch sowie 4 EL Zucker hinzugeben. Vanillezucker hinzugeben. Alles unter vorsichtigem Rühren mit dem Holzkochlöffel einmal aufkochen lassen und dabei aufpassen, dass sich nichts am Topfboden ansetzt.
    Nun den Topf auf eine Herdplatte stellen, die auf kleinster Stufe heizt. Den Milchreis im geschlossenen Topf exakt 30 Minuten ziehen lassen. Nach der Hälfte der Zeit einmal umrühren.
    Nach 30 Minuten ist der Milchreis servierfertig, er kann warm oder kalt gegessen werden.
    Nach Geschmack Apfelmus dazu reichen."
    /* Allergene:  */
); 
INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    R4,
    "Sommerlicher Couscous-Salat",
    "Irgendwie ein Salat halt.", /* AENDERN */
    "Couscous in eine Schale geben und mit kochender Gemüsebrühe übergießen. Kurz umrühren, quellen lassen und evtl. Wasser nachgeben. 
    Inzwischen das Gemüse waschen und anschließend würfeln. Die Kräuter waschen und kleinhacken. 
    Diese Zutaten mit dem Couscous vermischen. Nun Öl hinzugeben und zum Schluss mit Salz und Pfeffer abschmecken."
    /* Allergene: Gluten */
);

/* Insert Beschraenkugnen + weitere Zutaten die vorher nicht gegeben waren*/
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (B01, 'Laktose');
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (B02, 'Weizen');
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (B03, 'Gluten');
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (B04, 'Stärke');
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (B05, 'Karotte');
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (B06, 'Nuss');


/* Insert Zutaten, die vorher nicht gegeben waren */
INSERT INTO ZUTAT (ZUTATENNR, BEZEICHNUNG, EINHEIT, NETTOPREIS, BESTAND, lieferant, KALORIEN, KOHLENHYDRATE, PROTEIN) VALUES (9901, 'Reis', 'Gramm', 1.0, 500, 103, 349, 74.1, 7.2);
INSERT INTO ZUTAT (ZUTATENNR, BEZEICHNUNG, EINHEIT, NETTOPREIS, BESTAND, lieferant, KALORIEN, KOHLENHYDRATE, PROTEIN) VALUES (9902, 'Lasagneplatten', 'Gramm', 1.0, 400, 103, 356, 71, 12);
INSERT INTO ZUTAT (ZUTATENNR, BEZEICHNUNG, EINHEIT, NETTOPREIS, BESTAND, lieferant, KALORIEN, KOHLENHYDRATE, PROTEIN) VALUES (9003, 'Muskat', 'Gramm', 1.0, 400, 103, 525, 49, 6);

/* Insert Zwischentabelle für Beschränkungen einer Zutat */

INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (1005, B05);
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (7043, B05);
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (3001, B01);
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (3002, B01);
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (6408, B02);
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (9908, B02);
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (6408, B03);
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (9908, B03);
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (1011, B04);
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (9901, B04);
INSERT INTO ZWISCHENTABELLEZUTATBESCHRAENKUNG (ZUTATENNR, BESCHRAENKUNGSID ) VALUES (9003, B06);



 COMMIT WORK;