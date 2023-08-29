-- CASO 1
SELECT TO_CHAR(numrun_cli, '99G999G999') || '-' || 
    dvrun_cli "RUN CLIENTE",
    INITCAP(appaterno_cli) || ' ' || SUBSTR(apmaterno_cli, 0, 1) || '. ' || INITCAP(pnombre_cli) || ' ' || UPPER(snombre_cli) "NOMBRE CLIENTE",
    direccion,
    NVL(TO_CHAR(fono_fijo_cli), 'NO POSEE TELEFONO FIJO') "TELEFONO FIJO",
    NVL(TO_CHAR(celular_cli), 'NO POSEE TELEFONO FIJO') "CELULAR",
    id_comuna
FROM cliente
ORDER BY &orden;

-- CASO 2
SELECT 'EL EMPLEADO' || pnombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp || 
    ' estuvo de cumpleaños el ' || TO_CHAR(TO_DATE(fecha_nac), 'DD "del" FMMonth. "Cumplio "') ||
    TRUNC(MONTHS_BETWEEN(SYSDATE, fecha_nac)/12) || ' años' "LISTADO DE CUMPLEAÑOS"
FROM empleado
WHERE EXTRACT(MONTH FROM fecha_nac) = EXTRACT(MONTH FROM SYSDATE) - 1
ORDER BY EXTRACT(DAY FROM fecha_nac) ASC, appaterno_emp ASC;