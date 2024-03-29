--SELECT * FROM CARGO;
--SELECT * FROM ENDERECO;
--SELECT * FROM ENDERECO_CLIENTE;
--SELECT * FROM ENDERECO_LOJA;
--SELECT * FROM FABRICANTE;
--SELECT * FROM FUNCIONARIO;
--SELECT * FROM ITEM_NF;
--SELECT * FROM LOJA;
--SELECT * FROM NOTA_FISCAL;
--SELECT * FROM PRODUTO;
--SELECT * FROM CLIENTE;

DESC CLIENTE;
DESC pf1788.CLIENTE;

ALTER TABLE CLIENTE
MODIFY NOME_CLIENTE VARCHAR2(100);
ALTER TABLE CLIENTE
MODIFY CPF VARCHAR2(30);
ALTER TABLE CLIENTE
MODIFY DATA_NASC VARCHAR2(30);
ALTER TABLE CLIENTE
MODIFY ESTADO_CIVIL VARCHAR2(30);

INSERT INTO CLIENTE SELECT * FROM pf1788.CLIENTE;

CREATE PROCEDURE CARGA_CLIENTE AS
BEGIN
INSERT INTO DIMENSAO_CLIENTE
SELECT SK_CLIENTE.NEXTVAL,
    NOME_CLIENTE,
        CASE WHEN SEXO = 'fem' THEN 'feminino'
             WHEN SEXO = 'm' THEN 'masculino'
        END SEXO,
        ROUND(SYSDATE-TO_DATE (DATA_NASC, 'MM-DD-YYYY'),2)
FROM CLIENTE;
COMMIT;
END;

SELECT * FROM DIMENSAO_CLIENTE

INSERT INTO CARGO SELECT * FROM pf1788.CARGO;

DESC ENDERECO;
DESC pf1788.ENDERECO;

ALTER TABLE ENDERECO
MODIFY LOGRADOURO_NOME VARCHAR2(200);
ALTER TABLE ENDERECO
MODIFY BAIRRO VARCHAR2(200);
ALTER TABLE ENDERECO
MODIFY CIDADE VARCHAR2(200);
ALTER TABLE ENDERECO
MODIFY ESTADO VARCHAR2(30);
ALTER TABLE ENDERECO
MODIFY CEP NUMBER(20);

INSERT INTO ENDERECO SELECT * FROM pf1788.ENDERECO;

DESC ENDERECO_CLIENTE;
DESC pf1788.ENDERECO_CLIENTE;

ALTER TABLE ENDERECO_CLIENTE
MODIFY ENDERECO_CEP NUMBER;
ALTER TABLE ENDERECO_CLIENTE
MODIFY CODIGO_CLIENTE NUMBER(10);
ALTER TABLE ENDERECO_CLIENTE
MODIFY NUMERO NUMBER(5);
ALTER TABLE ENDERECO_CLIENTE
MODIFY COMPLEMENTO VARCHAR2(30);

INSERT INTO ENDERECO_CLIENTE SELECT * FROM pf1788.ENDERECO_CLIENTE;

DESC ENDERECO_LOJA;
DESC pf1788.ENDERECO_LOJA;

ALTER TABLE ENDERECO_LOJA
MODIFY ENDERECO_CEP NUMBER;

INSERT INTO ENDERECO_LOJA SELECT * FROM pf1788.ENDERECO_LOJA;

DESC FABRICANTE;
DESC pf1788.FABRICANTE;

INSERT INTO FABRICANTE SELECT * FROM pf1788.FABRICANTE;

DESC FUNCIONARIO;
DESC pf1788.FUNCIONARIO;

INSERT INTO FUNCIONARIO SELECT * FROM pf1788.FUNCIONARIO;

DESC ITEM_NF;
DESC pf1788.ITEM_NF;

ALTER TABLE ITEM_NF
MODIFY CODIGO_PRODUTO VARCHAR2(30);
ALTER TABLE ITEM_NF
MODIFY CODIGO_NF NUMBER(6);
ALTER TABLE ITEM_NF
MODIFY QUANTIDADE NUMBER;

INSERT INTO ITEM_NF SELECT * FROM pf1788.ITEM_NF;

DESC LOJA;
DESC pf1788.LOJA;

INSERT INTO LOJA SELECT * FROM pf1788.LOJA;

DESC NOTA_FISCAL;
DESC pf1788.NOTA_FISCAL;

INSERT INTO NOTA_FISCAL SELECT * FROM pf1788.NOTA_FISCAL;

DESC PRODUTO;
DESC pf1788.PRODUTO;

INSERT INTO PRODUTO SELECT * FROM pf1788.PRODUTO;
