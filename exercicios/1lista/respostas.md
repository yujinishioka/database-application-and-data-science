1. Criar  um  bloco  PL-SQL  para  calcular  o  valor  do  novo  salário  mínimo que  deverá  ser  de  25%  em  cima  do  atual,  que  é  de  R$ 1302.00,  no qual este valor deverá ser constante dentro do bloco, informando em seguida.

``` sql
-- Aula 2 13/02/2023
-- Exercício Salario

-- Comando para habilitar o uso dos comandos 'dbms'
set serveroutput on

Declare
    pais varchar2(255) := 'Brasil';
    ur char(2) := 'BR';
    salario_atual number(10,2) := 1302.00;
    salario_reajustado number(10,2);

Begin
    salario_reajustado := salario_atual * 1.25;
    -- Exibindo na tela
    dbms_output.put_line('Salário atual - R$: ' || salario_atual || ' no ' || pais);
    dbms_output.put_line('Salário reajustado - R$: ' || salario_reajustado || ' no ' || pais);

end;
```

2. Criar um bloco PL-SQL para calcular o valor em REAIS de 45 dólares, sendo  que  o  valor  do  câmbio  a  ser  considerado  é  de  2,98,  no  qual estes valores deverão ser constantes dentro do bloco
``` sql
-- Exercicio conversão
set serveroutput on

Declare
    data_atual Date := SYSDATE;
    cotacao_dolar number(10,2) := 5.16;
    valor_real cotacao_dolar%type := cotacao_dolar * 45;

Begin
    dbms_output.put_line('Cotação do Dólar do dia ' || data_atual || ' - $: ' || cotacao_dolar);
    dbms_output.put_line('Valor convertido - R$: ' || valor_real);

end;
```
3.