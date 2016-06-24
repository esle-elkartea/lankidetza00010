

CREATE OR REPLACE FUNCTION resetSecuencia(text, text, text)
  RETURNS void AS
$BODY$DECLARE
 valor int;
 cadena varchar;
 fila RECORD;
BEGIN

cadena:= 'SELECT MAX(' || $2 || ') as VALOR from ' || $1 || ';';
valor:=1;
FOR fila IN EXECUTE cadena LOOP
	valor:=fila.VALOR;
END LOOP;
PERFORM setval($3,valor); 

return;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE;
ALTER FUNCTION resetSecuencia(text, text, text) OWNER TO "amicyf-user";



