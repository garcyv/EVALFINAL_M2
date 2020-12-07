--a) Realice una consulta que permita listar todas las capacitaciones de un cliente en
--particular, indicando el nombre completo, la edad y el correo electrónico de los
--asistentes.

SELECT A.ASISTNOMBRECOMPLETO NOMBRE, A.ASISTEDAD EDAD, A.ASISTCORREO CORREO
FROM CAPACITACION C,CLIENTE B, ASISTENTES A
WHERE B.RUTCLIENTE=C.CLIENTE_RUTCLIENTE
AND A.CAPACITACION_IDCAPACITACION=C.IDCAPACITACION
AND B.RUTCLIENTE=187896543;
--b) Realice una consulta que permita desplegar todas las visitas en terreno realizadas a los
--clientes que sean de la comuna de Valparaíso. Por cada visita debe indicar todos los
--chequeos que se hicieron en ella, junto con el estado de cumplimiento de cada uno.
SELECT A.CLIENTE_RUTCLIENTE "RUT CLIENTE", VISLUGAR LUGAR, VISCOMENTARIOS COMENTARIOS,
B.IDCHEQUEO, NOMBRECHEQUEO "NOMBRE CHEQUEO",ESTADOCHEQUEO ESTADO, OBSERVACIONES
FROM VISITA A, CHEQUEOS B
WHERE A.IDVISITA=B.VISITA_IDVISITA AND
CLIENTE_RUTCLIENTE IN 
(SELECT rutcliente FROM CLIENTE WHERE UPPER(clicomuna)='VALPARAISO');



--c) Realice una consulta que despliegue los accidentes registrados para todos los clientes,
--indicando los datos de detalle del accidente, y el nombre, apellido, RUT y teléfono del
--cliente al que se asocia dicha situación

SELECT A.IDACCIDENTE ACCIDENTE, A.ACCIFECHA FECHA, A.ACCIHORA HORA, A.ACCILUGAR LUGAR, A.ACCIORIGEN ORIGEN, A.ACCICONSECUENCIAS CONSECUENCIA,
C.RUTCLIENTE RUT, C.CLINOMBRES NOMBRE,C.CLIAPELLIDOS APELLIDO, C.CLITELEFONO TELEFONO
FROM ACCIDENTE A, CLIENTE C
WHERE A.CLIENTE_RUTCLIENTE=C.RUTCLIENTE;

