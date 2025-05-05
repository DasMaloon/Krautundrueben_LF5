USE db967aaa55; /* Select current database */
-- ########################################### Create new Tables ###########################################

/* Create Rezepttabelle */
CREATE TABLE RECIPIE (
    REZEPTID       INTEGER NOT NULL,
    REZEPTNAME     VARCHAR(50),
    BESCHREIBUNG   VARCHAR(255),
    ZUTATENID      INTEGER,
    ZUBEREITUNG    TEXT(),
    PRIMARY KEY (REZEPTID),
    FOREIGN KEY (ZUTATENID) REFERENCES ZUTAT (ZUTATENNR)
    /* Kann falsch sein, */
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
);

/* Create Beschraenkungstable */
CREATE TABLE BESCHRAENKUNGEN (
    BESCHRAENKUNGSID       INTEGER NOT NULL,
    BESCHRAENKUNGSNAME     VARCHAR(50),
    PRIMARY KEY (BESCHRAENKUNGSID),
);

-- ########################################### Fill Tables with dummy Content ###########################################

/* Create Test Items */
INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    1, 
    'DUmmy Rezept', 
    'Ein klassisches italienisches Gericht mit Hackfleisch und Tomatensauce. (Nicht generiert durch Copilot, ich schwör)', 
    'Die Spaghetti in Salzwasser kochen. In einer Pfanne Zwiebeln und Knoblauch anbraten, dann das Hackfleisch hinzufügen und braten. Tomatensauce hinzufügen und köcheln lassen. Spaghetti abgießen und mit der Sauce vermengen.'
);

INSERT intO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (
    2, 
    'Dummy Rezept 2', 
    'Ein klassisches italienisches Gericht mit Hackfleisch und Tomatensauce. (Nicht generiert durch Copilot, ich schwör)', 
    'Die Spaghetti in Salzwasser kochen. In einer Pfanne Zwiebeln und Knoblauch anbraten, dann das Hackfleisch hinzufügen und braten. Tomatensauce hinzufügen und köcheln lassen. Spaghetti abgießen und mit der Sauce vermengen.'
);


INSERT INTO ZUTATENZUWEISUNG (REZEPTID, ZUTATENNR, MENGE) VALUES (
    1, 
    1, 
    200
);

/* Create Beschraenkungen */
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (1, 'Glutenfrei');
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (2, 'Vegetarisch');
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (3, 'Vegan');
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (4, 'Laktosefrei');
INSERT INTO BESCHRAENKUNGEN (BESCHRAENKUNGSID, BESCHRAENKUNGSNAME) VALUES (5, 'Nussfrei');

