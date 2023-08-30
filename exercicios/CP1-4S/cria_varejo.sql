CREATE TABLE CARGO 
    ( 
     codigo_cargo NUMBER (2)  NOT NULL , 
     descricao_cargo VARCHAR2 (20) 
    ) 
;



ALTER TABLE CARGO 
    ADD CONSTRAINT CARGO_PK PRIMARY KEY ( codigo_cargo ) ;


CREATE TABLE CLIENTE 
    ( 
     codigo_cliente NUMBER (4)  NOT NULL , 
     nome_cliente VARCHAR2 (60) , 
     cpf NUMBER (11) , 
     data_nasc DATE , 
     sexo VARCHAR2 (10) , 
     estado_civil VARCHAR2 (15) 
    ) 
;



ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( codigo_cliente ) ;


CREATE TABLE ENDERECO 
    ( 
     logradouro_nome VARCHAR2 (50) , 
     bairro VARCHAR2 (50) , 
     cidade VARCHAR2 (30) , 
     estado VARCHAR2 (30) , 
     cep NUMBER (5)  NOT NULL 
    ) 
;



ALTER TABLE ENDERECO 
    ADD CONSTRAINT ENDERECO_PK PRIMARY KEY ( cep ) ;


CREATE TABLE ENDERECO_CLIENTE 
    ( 
     ENDERECO_cep NUMBER (5)  NOT NULL , 
     codigo_cliente NUMBER (4)  NOT NULL , 
     numero NUMBER (5) , 
     complemento VARCHAR2 (30) 
    ) 
;




CREATE TABLE ENDERECO_LOJA 
    ( 
     codigo_loja NUMBER (4)  NOT NULL , 
     ENDERECO_cep NUMBER (5)  NOT NULL , 
     numero number(5)

                    
    ) 
;




CREATE TABLE FABRICANTE 
    ( 
     codigo_fabricante NUMBER (4)  NOT NULL , 
     nome_fabricante VARCHAR2 (30) 
    ) 
;



ALTER TABLE FABRICANTE 
    ADD CONSTRAINT FABRICANTE_PK PRIMARY KEY ( codigo_fabricante ) ;


CREATE TABLE FUNCIONARIO 
    ( 
     codigo_funcionario NUMBER (4)  NOT NULL , 
     nome_funcionario VARCHAR2 (30) , 
     data_admissao DATE , 
     codigo_gerente NUMBER (4) , 
     codigo_cargo NUMBER (2)  NOT NULL 
    ) 
;



ALTER TABLE FUNCIONARIO 
    ADD CONSTRAINT FUNCIONARIO_PK PRIMARY KEY ( codigo_funcionario ) ;


CREATE TABLE ITEM_NF 
    ( 
     codigo_produto NUMBER (4)  NOT NULL , 
     codigo_nf NUMBER (6)  NOT NULL , 
     quantidade NUMBER (4) 
    ) 
;



ALTER TABLE ITEM_NF 
    ADD CONSTRAINT ITEM_NF_PK PRIMARY KEY ( codigo_produto, codigo_nf ) ;


CREATE TABLE LOJA 
    ( 
     codigo_loja NUMBER (4)  NOT NULL , 
     nome_loja VARCHAR2 (20) 
    ) 
;



ALTER TABLE LOJA 
    ADD CONSTRAINT LOJA_PK PRIMARY KEY ( codigo_loja ) ;


CREATE TABLE NOTA_FISCAL 
    ( 
     codigo_nf NUMBER (6)  NOT NULL , 
     data_nf DATE , 
     codigo_cliente NUMBER (4)  NOT NULL , 
     codigo_vendedor NUMBER (4)  NOT NULL , 
     codigo_loja NUMBER (4)  NOT NULL 
    ) 
;



ALTER TABLE NOTA_FISCAL 
    ADD CONSTRAINT NOTA_FISCAL_PK PRIMARY KEY ( codigo_nf ) ;


CREATE TABLE PRODUTO 
    ( 
     codigo_produto NUMBER (4)  NOT NULL , 
     nome_prod VARCHAR2 (30) , 
     tipo VARCHAR2 (30) , 
     genero VARCHAR2(30)

                    , 
     preco_venda NUMBER (6,2) , 
     codigo_fabricante NUMBER (4)  NOT NULL 
    ) 
;



ALTER TABLE PRODUTO 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( codigo_produto ) ;



ALTER TABLE ENDERECO_CLIENTE 
    ADD CONSTRAINT CEP FOREIGN KEY 
    ( 
     ENDERECO_cep
    ) 
    REFERENCES ENDERECO 
    ( 
     cep
    ) 
;


ALTER TABLE ITEM_NF 
    ADD CONSTRAINT ITEM_NF_NOTA_FISCAL_FK FOREIGN KEY 
    ( 
     codigo_nf
    ) 
    REFERENCES NOTA_FISCAL 
    ( 
     codigo_nf
    ) 
;


ALTER TABLE ITEM_NF 
    ADD CONSTRAINT ITEM_NF_PRODUTO_FK FOREIGN KEY 
    ( 
     codigo_produto
    ) 
    REFERENCES PRODUTO 
    ( 
     codigo_produto
    ) 
;


ALTER TABLE NOTA_FISCAL 
    ADD CONSTRAINT NOTA_FISCAL_CLIENTE_FK FOREIGN KEY 
    ( 
     codigo_cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     codigo_cliente
    ) 
;


ALTER TABLE NOTA_FISCAL 
    ADD CONSTRAINT NOTA_FISCAL_LOJA_FK FOREIGN KEY 
    ( 
     codigo_loja
    ) 
    REFERENCES LOJA 
    ( 
     codigo_loja
    ) 
;


ALTER TABLE FUNCIONARIO 
    ADD CONSTRAINT cargo FOREIGN KEY 
    ( 
     codigo_cargo
    ) 
    REFERENCES CARGO 
    ( 
     codigo_cargo
    ) 
;


ALTER TABLE ENDERECO_LOJA 
    ADD CONSTRAINT cep FOREIGN KEY 
    ( 
     ENDERECO_cep
    ) 
    REFERENCES ENDERECO 
    ( 
     cep
    ) 
;


ALTER TABLE ENDERECO_CLIENTE 
    ADD CONSTRAINT codigo_cliente FOREIGN KEY 
    ( 
     codigo_cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     codigo_cliente
    ) 
;


ALTER TABLE PRODUTO 
    ADD CONSTRAINT codigo_fabricante FOREIGN KEY 
    ( 
     codigo_fabricante
    ) 
    REFERENCES FABRICANTE 
    ( 
     codigo_fabricante
    ) 
;


ALTER TABLE FUNCIONARIO 
    ADD CONSTRAINT codigo_gerente FOREIGN KEY 
    ( 
     codigo_gerente
    ) 
    REFERENCES FUNCIONARIO 
    ( 
     codigo_funcionario
    ) 
;


ALTER TABLE ENDERECO_LOJA 
    ADD CONSTRAINT codigo_loja FOREIGN KEY 
    ( 
     codigo_loja
    ) 
    REFERENCES LOJA 
    ( 
     codigo_loja
    ) 
;


ALTER TABLE NOTA_FISCAL 
    ADD CONSTRAINT codigo_vendedor FOREIGN KEY 
    ( 
     codigo_vendedor
    ) 
    REFERENCES FUNCIONARIO 
    ( 
     codigo_funcionario
    ) 
;














-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             21
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- CREATE STRUCTURED TYPE                   0
-- CREATE COLLECTION TYPE                   0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
