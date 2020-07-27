----------------------Lecture 2-------------------------------------------------

1.1-
SELECT ename AS "Name", deptno AS "Department Number" FROM emp;

1.2-
SELECT dname AS "Department Name" FROM dept;

2.1-
SELECT DISTINCT job AS "Jobs" FROM emp WHERE deptno = 30;

2.2-
SELECT loc AS "Location" FROM dept WHERE deptno = 30;

3.1-
SELECT ename AS "Name", deptno AS "Department No" FROM emp WHERE comm IS NOT NULL;

3.2-
SELECT ename AS "Name", deptno AS "Department No" FROM emp WHERE ename LIKE '%A%';




----------------------Lecture 4-------------------------------------------------

1-
SELECT ename AS "Name", sal AS "Salary" FROM emp WHERE sal>2850;

2-
SELECT ename AS "Name", deptno AS "Department No" FROM emp WHERE empno = 7566;

3-
SELECT ename AS "Name", job AS "Jobs", hiredate AS "Start Date" FROM emp WHERE hiredate BETWEEN '20-FEB-1981' AND '01-MAY-1981' ORDER BY hiredate ASC; 

5-
SELECT ename AS "Name", deptno AS "Department Number" FROM emp WHERE deptno = 10 OR deptno = 30 ORDER BY ename ASC;

6-
SELECT ename AS "Employee", sal AS "Monthly Salary" FROM emp WHERE sal > 1500 AND ( deptno = 10 OR deptno = 30 );

7-
SELECT ename AS "Name", hiredate AS "Higher Date" FROM emp WHERE EXTRACT( YEAR FROM hiredate ) = 1982;

8-
SELECT ename AS "Name", job AS "Job" FROM emp WHERE mgr IS NULL;

9-
SELECT ename AS "Name", sal AS "Salary", comm AS "Commission" FROM emp WHERE comm IS NOT NULL ORDER BY sal DESC, comm DESC;

10-
SELECT ename AS "Name" FROM emp WHERE ename LIKE '__A%';

11-
SELECT ename AS "Name" FROM emp WHERE ename LIKE '%L%L%' AND ( deptno = 30 OR mgr = 7782 );

12-
SELECT ename AS "Name", job AS "Job", sal AS "Salary" FROM emp WHERE job IN('CLERK', 'ANALYST') AND sal NOT IN(1000,3000,5000);




----------------------Lecture 6-------------------------------------------------

1-
SELECT SYSDATE AS "Date" FROM DUAL;

2-
SELECT empno AS "Employee Number", ename AS "Name", sal AS "Salary", ROUND(sal+(sal*0.15)) AS "New Salary" FROM emp;

3-
SELECT empno AS "Employee Number", ename AS "Name", sal AS "Salary", ROUND(sal+(sal*0.15)) AS "New Salary", ROUND(sal+(sal*0.15))-sal AS "Increase" FROM emp;

4-
SELECT ename AS "Name", hiredate AS "Hire Date", TO_CHAR(NEXT_DAY(ADD_MONTHS(hiredate,6),'MONDAY'), 'Day, "the" Ddspth "of" Month, YYYY.') AS "REVIEW" FROM emp;

5-
SELECT ename AS "Name", ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) AS "MONTHS_WORKED" FROM emp ORDER BY "MONTHS_WORKED" DESC;

6-
SELECT ename ||' earns ' || sal || ' monthly but wants ' || sal*3 AS "Dream Salaries" FROM emp;

7-
SELECT INITCAP(ename) AS "Name", LENGTH(ename) AS "Length" FROM emp WHERE SUBSTR(LOWER(ename),1,1) IN('j','a','m');

8.1-
SELECT ename AS "Name", NVL(TO_CHAR(comm), 'No Commission.') AS "COMM" FROM emp;

8.2-
SELECT ename AS "Name", DECODE(comm, NULL, 'No Commission.', 0, 'No Commission', comm) AS "COMM" FROM emp;

9-
SELECT ename || '    ' || RPAD('*',ROUND(sal/100),'*') AS "EMPLOYEE_AND_THEIR_SALARIES" FROM emp ORDER BY sal DESC;