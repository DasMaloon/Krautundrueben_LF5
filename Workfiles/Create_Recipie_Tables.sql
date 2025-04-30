CREATE TABLE RECIPIE (
    REZEPTID       INTEGER NOT NULL,
    REZEPTNAME     VARCHAR(50),
    BESCHREIBUNG   VARCHAR(255),
    ZUBEREITUNG    TEXT(),
    PRIMARY KEY (REZEPTID),
);
/* Ich mag nimmer */

/* Create Beschraenkungstable */
CREATE TABLE BESCHRAENKUNGEN (
    BESCHRAENKUNGSID       INTEGER NOT NULL,
    BESCHRAENKUNGSNAME     VARCHAR(50),
    PRIMARY KEY (BESCHRAENKUNGSID),
);


/* Create Test Items */
INSERT INTO RECIPIE (REZEPTID, REZEPTNAME, BESCHREIBUNG, ZUBEREITUNG) VALUES (1, 'DUmmy Rezept', 'Ein klassisches italienisches Gericht mit Hackfleisch und Tomatensauce. (Nicht generiert durch Copilot, ich schwör)', 'Die Spaghetti in Salzwasser kochen. In einer Pfanne Zwiebeln und Knoblauch anbraten, dann das Hackfleisch hinzufügen und braten. Tomatensauce hinzufügen und köcheln lassen. Spaghetti abgießen und mit der Sauce vermengen.');