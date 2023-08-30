
CREATE TABLE DIMENSAO_CLIENTE 
    ( 
     surrogate_cliente NUMBER (10)  NOT NULL , 
     nome_cliente VARCHAR2 (50) , 
     sexo_cliente VARCHAR2 (10) , 
     idade_cliente NUMBER (3) 
    ) 
;



ALTER TABLE DIMENSAO_CLIENTE 
    ADD CONSTRAINT DIMENSAO_CLIENTE_PK PRIMARY KEY ( surrogate_cliente ) ;


CREATE TABLE DIMENSAO_DATA 
    ( 
     surrogate_data NUMBER (10)  NOT NULL , 
     dia NUMBER (2) , 
     mes NUMBER (2) , 
     ano NUMBER (4) 
    ) 
;



ALTER TABLE DIMENSAO_DATA 
    ADD CONSTRAINT DIMENSAO_DATA_PK PRIMARY KEY ( surrogate_data ) ;


CREATE TABLE DIMENSAO_LOCAL 
    ( 
     surrogate_loja NUMBER (9)  NOT NULL , 
     nome_loja NVARCHAR2 (50) , 
     codigo_loja NUMBER (4) , 
     bairro_loja VARCHAR2 (50) , 
     cidade_loja VARCHAR2 (50) , 
     estado_loja VARCHAR2 (2) 
    ) 
;



ALTER TABLE DIMENSAO_LOCAL 
    ADD CONSTRAINT DIMENSAO_LOCAL_PK PRIMARY KEY ( surrogate_loja ) ;


CREATE TABLE DIMENSAO_PRODUTO 
    ( 
     surrogate_produto NUMBER (10)  NOT NULL , 
     codigo_produto NUMBER (4) , 
     nome_produto NUMBER , 
     nome_fabricante VARCHAR2 (30) , 
     tipo_produto VARCHAR2 (30) , 
     genero_produto VARCHAR2 (30) 
    ) 
;



ALTER TABLE DIMENSAO_PRODUTO 
    ADD CONSTRAINT DIMENSAO_PRODUTO_PK PRIMARY KEY ( surrogate_produto ) ;


CREATE TABLE DIMENSAO_VENDEDOR 
    ( 
     surrogate_vendedor NUMBER (10)  NOT NULL , 
     codigo_vendedor NUMBER (4) , 
     nome_vendedor VARCHAR2 (50) , 
     codigo_gerente NUMBER (4) , 
     nome_gerente VARCHAR2 (50) 
    ) 
;



ALTER TABLE DIMENSAO_VENDEDOR 
    ADD CONSTRAINT DIMENSAO_VENDEDOR_PK PRIMARY KEY ( surrogate_vendedor ) ;


CREATE TABLE FATO_VENDA 
    ( 
     DIMENSAO_LOCAL_surrogate_loja NUMBER (9)  NOT NULL , 
     DIMENSAO_PRODUTO_surrogate_produto NUMBER (10)  NOT NULL , 
     DIMENSAO_DATA_surrogate_data NUMBER (10)  NOT NULL , 
     DIMENSAO_CLIENTE_surrogate_cliente NUMBER (10)  NOT NULL , 
     DIMENSAO_VENDEDOR_surrogate_vendedor NUMBER (10)  NOT NULL , 
     valor_venda NUMBER (20,2) , 
     quantidade_venda NUMBER (10) 
    ) 
;





ALTER TABLE FATO_VENDA 
    ADD CONSTRAINT FATO_VENDA_DIMENSAO_CLIENTE_FK FOREIGN KEY 
    ( 
     DIMENSAO_CLIENTE_surrogate_cliente
    ) 
    REFERENCES DIMENSAO_CLIENTE 
    ( 
     surrogate_cliente
    ) 
;


ALTER TABLE FATO_VENDA 
    ADD CONSTRAINT FATO_VENDA_DIMENSAO_DATA_FK FOREIGN KEY 
    ( 
     DIMENSAO_DATA_surrogate_data
    ) 
    REFERENCES DIMENSAO_DATA 
    ( 
     surrogate_data
    ) 
;


ALTER TABLE FATO_VENDA 
    ADD CONSTRAINT FATO_VENDA_DIMENSAO_LOCAL_FK FOREIGN KEY 
    ( 
     DIMENSAO_LOCAL_surrogate_loja
    ) 
    REFERENCES DIMENSAO_LOCAL 
    ( 
     surrogate_loja
    ) 
;


ALTER TABLE FATO_VENDA 
    ADD CONSTRAINT FATO_VENDA_DIMENSAO_PRODUTO_FK FOREIGN KEY 
    ( 
     DIMENSAO_PRODUTO_surrogate_produto
    ) 
    REFERENCES DIMENSAO_PRODUTO 
    ( 
     surrogate_produto
    ) 
;




ALTER TABLE FATO_VENDA 
    ADD CONSTRAINT FATO_VENDA_DIMENSAO_VENDEDOR_FK FOREIGN KEY 
    ( 
     DIMENSAO_VENDEDOR_surrogate_vendedor
    ) 
    REFERENCES DIMENSAO_VENDEDOR 
    ( 
     surrogate_vendedor
    ) 
;









-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             10
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
-- ERRORS                                   4
-- WARNINGS                                 0
