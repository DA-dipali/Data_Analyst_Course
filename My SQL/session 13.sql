USE SCOTT;
SELECT * FROM EMP; -- UPDATE ON EMP
CREATE TABLE JOB_HISTORY (EMPNO INT, JOB CHAR(22), SAL INT, DEPTNO INT); -- Insert in JOB_HISTORY
SELECT * FROM JOB_HISTORY;
UPDATE EMP SET JOB='MANAGER', SAL=4000 WHERE EMPNO=7369;


SELECT * FROM MEDICINES; -- UPDATE ON MEDICINE
UPDATE MEDICINES SET QTY=100  WHERE MED_ID =101;
SELECT * FROM ORDERS; -- INSERT IN OREDERS
TRUNCATE TABLE ORDERS;
UPDATE MEDICINES SET QTY=12 WHERE MED_ID =101;