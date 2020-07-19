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