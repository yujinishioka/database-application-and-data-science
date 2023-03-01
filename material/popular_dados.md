População de dados utilizando DBMS

``` sql

-- DROP TABLE usuarios;
-- DROP TABLE materias;
-- DROP TABLE usuario_materia;

SELECT * FROM usuarios u;
SELECT * FROM materias m;
SELECT * FROM usuario_materia um;

SELECT u.*, m.nome as "Materia" FROM usuario_materia um
INNER JOIN usuarios u ON (um.id_usuario = u.id)
INNER JOIN materias m ON (um.id_materia = m.id)
ORDER BY u.id;

CREATE TABLE usuarios (
    id number PRIMARY KEY,
    nome varchar2(30),
    endereco varchar2(10)
);

BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO usuarios (id, nome, endereco)
        VALUES (i, DBMS_RANDOM.STRING('A',5), DBMS_RANDOM.STRING('A',8));
    END LOOP;
END;

CREATE TABLE materias (
    id number PRIMARY KEY,
    nome varchar2(30),
    data_inicio date
);

BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO materias (id, nome, data_inicio)
        VALUES (i, DBMS_RANDOM.STRING('A',5), TO_DATE('2022-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE(1, 465));
    END LOOP;
END;

CREATE TABLE usuario_materia (
    id number PRIMARY KEY,
    id_usuario number,
    id_materia number,
    CONSTRAINT pk_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id),
    CONSTRAINT pk_materia FOREIGN KEY (id_materia) REFERENCES materias (id)
);

BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO usuario_materia (id, id_usuario, id_materia)
        VALUES (i, ROUND(DBMS_RANDOM.VALUE(1,20)), ROUND(DBMS_RANDOM.VALUE(1,20)));
    END LOOP;
END;

```