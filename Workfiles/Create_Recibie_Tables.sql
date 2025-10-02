CREATE TABLE RECIPE (
    REZEPTID       INTEGER NOT NULL,
    REZEPTNAME     VARCHAR(50),
    BESCHREIBUNG   VARCHAR(255),

    PRIMARY KEY (REZEPTID,REZEPTNAME),
    FOREIGN KEY (ZUTATENNR) REFERENCES ZUTAT (ZUTATENNR),
);

/* Add dummy Zutat */

INSERT INTO RECIPE (REZEPTID, REZEPTNAME, BESCHREIBUNG) VALUES (99999999,'TestRezept','Lorem ipsum dolor sit amet, consectetur adipiscing elit.');
INSERT INTO RECIPE (REZEPTID, REZEPTNAME, BESCHREIBUNG) VALUES (99999998,'TestRezept2','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula, nunc ut facilisis fringilla, ligula enim efficitur ligula, nec tincidunt enim erat a nunc. Sed id dui ac nisi convallis facilisis. Donec euismod, nisi vel consectetur interdum, nisl nisi cursus nunc, eget tincidunt nunc nisl euismod nunc.');