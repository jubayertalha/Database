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
SELECT ename AS "Employee", sal AS "Monthly Salary" FROM emp WHERE sal  > 1500 AND ( deptno = 10 OR deptno = 30 );

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




----------------------Lecture 8-------------------------------------------------

1-
SELECT ROUND(AVG(sal),2) AS "Avarage", MAX(sal) AS "Maximum", MIN(sal) AS "Minimum" FROM emp;

2-
SELECT deptno AS "Department Number", ROUND(AVG(sal),2) AS "Avarage", MAX(sal) AS "Maximum", MIN(sal) AS "Minimum" FROM emp GROUP BY deptno;

3-
SELECT job AS "Job Category", ROUND(AVG(sal),2) AS "Avarage", MAX(sal) AS "Maximum", MIN(sal) AS "Minimum" FROM emp GROUP BY job;

4-
SELECT ename AS "Name", sal AS "Salary" FROM emp WHERE sal = (SELECT MAX(sal) FROM emp WHERE LOWER(job) = 'manager') AND LOWER(job) = 'manager';

5-
SELECT deptno AS "Department Number", dname AS "Department Name", loc AS "Department Location" FROM dept WHERE deptno = (SELECT deptno FROM emp GROUP BY deptno HAVING COUNT(deptno)=(SELECT MAX(COUNT(*)) FROM emp GROUP BY deptno));

6-
SELECT job FROM emp GROUP BY job HAVING SUM(NVL2(comm, comm+sal, sal)) = (SELECT MAX(SUM(NVL2(comm, comm+sal, sal))) FROM emp GROUP BY job);

7-
select ename, deptno FROM emp WHERE sal = (SELECT MAX(sal) FROM emp);




------------------------MID END-------------------------------------------------




----------------------Lecture 9-------------------------------------------------

1-
CREATE  TABLE Student(s_id NUMBER, s_name VARCHAR(20), phone NUMBER, address  VARCHAR(50), email VARCHAR(30), credit_completed NUMBER(3), course_completed NUMBER(2), cgpa NUMBER);

2-
ALTER TABLE Student ADD(department VARCHAR(5), gender VARCHAR(6));

3-
ALTER TABLE Student RENAME COLUMN department TO dept;

4-
ALTER TABLE Student MODIFY(cgpa NUMBER(3,2));

5-
ALTER TABLE Student DROP COLUMN email;

6-
RENAME Student TO Students;

--
CREATE TABLE department(deptid NUMBER(3) PRIMARY KEY, dept_name VARCHAR(6) CHECK(dept_name IN('CSE','EEE','BBA','Eng','Ach')), budget NUMBER(6) DEFAULT(0));

--
CREATE TABLE course(crs_id NUMBER(4) PRIMARY KEY, crs_name VARCHAR2(20) NOT NULL, dept_id NUMBER(3), CONSTRAINT cfor FOREIGN KEY(dept_id) REFERENCES department(deptid));

7-
INSERT INTO department(deptid, dept_name, budget) VALUES(123, 'CSE', 500000);

INSERT INTO department(deptid, dept_name, budget) VALUES(124, 'EEE', 600000);

INSERT INTO department(deptid, dept_name) VALUES(125, 'BBA');

INSERT INTO department VALUES(126, 'Eng', 800000);

8-
INSERT INTO course(crs_id, crs_name, dept_id) VALUES(223, 'Database', 123);

INSERT INTO course(crs_id, crs_name, dept_id) VALUES(224, 'Java', 123);

INSERT INTO course(crs_id, crs_name, dept_id) VALUES(225, 'Accounting', 125);

9-
INSERT INTO department(dept_name, budget) VALUES('Ach', 900000);
(invalid)

10-
UPDATE department SET budget = 4000 WHERE dept_name LIKE 'CSE';

11-
TRUNCATE TABLE course;




----------------------Lecture 10-------------------------------------------------

1-
CREATE TABLE department(deptid NUMBER(3) PRIMARY KEY, dept_name VARCHAR(6) CHECK(dept_name IN('CSE','EEE','BBA','Eng','Ach')), budget NUMBER(6) DEFAULT(0));

2-
CREATE TABLE course(crs_id NUMBER(4) PRIMARY KEY, crs_name VARCHAR2(20) NOT NULL, dept_id NUMBER(3), CONSTRAINT cfor FOREIGN KEY(dept_id) REFERENCES department(deptid));

3-
CREATE  TABLE student(s_id NUMBER, s_name VARCHAR(20), phone NUMBER, address  VARCHAR(50), email VARCHAR(30), credit_completed NUMBER(3), course_completed NUMBER(2), cgpa NUMBER, deptno NUMBER(5), gender VARCHAR(6));

4-
ALTER TABLE student ADD CONSTRAINT s_id PRIMARY KEY(s_id);

5-
ALTER TABLE student MODIFY s_name NOT NULL;

6-
ALTER TABLE student ADD CONSTRAINT email UNIQUE(email);

7-
ALTER TABLE student ADD CONSTRAINT deptno FOREIGN KEY(deptno) REFERENCES department(deptid);

8-
ALTER TABLE student ADD CONSTRAINT gender CHECK(gender IN ('M', 'F'));

9-
ALTER TABLE student DISABLE CONSTRAINT s_id;

10-
ALTER TABLE student DROP CONSTRAINT gender;

11-
SELECT constraint_name, column_name FROM user_cons_columns WHERE table_name = 'STUDENT';

12-
ALTER TABLE student ENABLE CONSTRAINT s_id;




----------------------Lecture 11 & 12---------------------------------------------

1-
SELECT * FROM emp WHERE sal > ALL(SELECT sal FROM emp WHERE job = 'MANAGER');

2-
SELECT * FROM emp WHERE sal > ANY(SELECT sal FROM emp WHERE job = 'MANAGER') AND job <> 'MANAGER';

3-
SELECT empno AS "Employee Number", job AS "Job", sal AS "Salaries" FROM emp WHERE sal > ANY(SELECT sal FROM emp WHERE job = 'MANAGER') AND job = 'ANALYST';

4-
SELECT * FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'DALLAS');

5-
SELECT dname AS "Department Name", loc AS "Location" FROM dept WHERE deptno = ANY(SELECT deptno FROM emp WHERE mgr = (SELECT empno FROM emp WHERE ename = 'CLARK'));

6-
SELECT * FROM dept WHERE deptno = ANY(SELECT deptno FROM emp WHERE job = 'MANAGER');

7-
SELECT MAX(sal) AS "First Maximum Salary" FROM emp;

8-
SELECT MAX(sal) AS "Second Maximum Salary" FROM emp WHERE sal < (SELECT MAX(sal) FROM emp);

9-
SELECT MAX(sal) AS "Third Maximum Salary" FROM emp WHERE sal < (SELECT MAX(sal) FROM emp WHERE sal < (SELECT MAX(sal) FROM emp));

10-
SELECT * FROM emp WHERE job IN('MANAGER', 'CLERK') AND deptno = ANY(SELECT deptno FROM dept WHERE dname IN('ACCOUNTING', 'MARKETING'));

11-
SELECT * FROM emp WHERE job = 'SALESMAN' AND deptno <> (SELECT deptno FROM dept WHERE loc = 'DALLAS');

12-
SELECT * FROM emp WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'SCOTT');

13-
SELECT * FROM emp WHERE sal = (SELECT sal FROM emp WHERE ename = 'SMITH') AND ename <> 'SMITH';

14-
SELECT * FROM emp WHERE comm IS NOT NULL AND comm > 0 AND deptno = (SELECT deptno FROM dept WHERE dname = 'MARKETING') AND TRIM(TO_CHAR(hiredate, 'DAY')) IN('SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY');

15-
SELECT * FROM emp WHERE sal > (SELECT AVG(sal) FROM emp);




----------------------Lecture 13 & 15---------------------------------------------

1-
SELECT * FROM emp, dept WHERE emp.deptno = dept.deptno AND dept.dname IN('ACCOUNTING', 'MARKETING') AND emp.job IN('MANAGER', 'CLERK');

2-
SELECT * FROM emp, dept WHERE emp.deptno = dept.deptno AND dept.loc <> 'DALLAS' AND emp.job = 'SALESMAN';

3-
SELECT d.dname AS "Department Name", d.loc AS "Department Location" FROM emp e, dept d, emp m WHERE e.deptno = d.deptno AND m.ename = 'CLARK' AND m.empno = e.mgr;

4-
SELECT dept.* FROM emp, dept WHERE dept.deptno = emp.deptno AND emp.job = 'MANAGER';

5-
SELECT * FROM emp, dept WHERE emp.deptno = dept.deptno AND dept.loc = 'DALLAS';

6-
DELETE FROM dept WHERE dept.deptno = (SELECT dept.deptno FROM emp, dept WHERE emp.deptno(+) = dept.deptno AND emp.deptno IS NULL);

7-
SELECT DISTINCT dept.*, NVL2(TO_CHAR(emp.deptno), 'Has Employee', 'No Employee') AS "Employee Status" FROM dept, emp WHERE emp.deptno(+) = dept.deptno ORDER BY dept.deptno ASC;

8-
SELECT * FROM emp, dept WHERE emp.deptno(+) = dept.deptno;

9-
SELECT dept.* FROM emp, dept WHERE emp.deptno(+) = dept.deptno AND emp.deptno IS NULL;

10-
SELECT e.ename AS "Employee Name", NVL(m.ename, 'CEO') AS "Manager" FROM emp e, emp m WHERE e.mgr = m.empno(+);

11-
SELECT e.* FROM emp e, emp s WHERE s.ename = 'SCOTT' AND s.deptno = e.deptno;

12-
SELECT e.* FROM emp e, emp m WHERE m.empno = e.mgr AND m.hiredate > e.hiredate;

13-
SELECT e.* FROM emp e, emp m WHERE m.empno = e.mgr AND m.sal < e.sal;

14-
SELECT e1.* FROM emp e1, emp e2 WHERE e1.sal = e2.sal AND e1.empno <> e2.empno ORDER BY e1.sal ASC;

15-
SELECT e.ename AS "Employee Name", e.hiredate AS "Employee Hiredate", m.ename AS "Manager", m.hiredate AS "Manager Hiredate" FROM emp e, emp m, emp s WHERE m.empno = e.mgr AND s.ename = 'SMITH' AND s.sal = e.sal AND e.ename <> 'SMITH';




----------------------Final Project---------------------------------------------

1-
CREATE TABLE phoneNumbers(user_id NUMBER(11) CONSTRAINT pk PRIMARY KEY, phoneNumber NUMBER(11));

DESCRIBE phoneNumbers;

3-
CREATE TABLE userAddress(road_number NUMBER(2) CONSTRAINT apk PRIMARY KEY, road_name VARCHAR(20), area VARCHAR(20), city VARCHAR(20));

DESCRIBE userAddress;

2-
CREATE TABLE userData(user_id number(11) CONSTRAINT dpk PRIMARY KEY, user_name VARCHAR(20), user_dob DATE, road_number NUMBER(2), CONSTRAINT fk FOREIGN KEY(road_number) REFERENCES userAddress(road_number));

DESCRIBE userData;

4-
CREATE TABLE friendList(user_id NUMBER(11) CONSTRAINT fpk PRIMARY KEY, friend_id NUMBER(11), CONSTRAINT ffk FOREIGN KEY(friend_id) REFERENCES userData(user_id));

DESCRIBE friendList;

6-
CREATE TABLE messageData(message_id NUMBER(11) CONSTRAINT mdpk PRIMARY KEY, message_text VARCHAR(600), receiver_id NUMBER(11), CONSTRAINT mdfk FOREIGN KEY(receiver_id) REFERENCES userData(user_id));

DESCRIBE messageData;

5-
CREATE TABLE messageList(user_id NUMBER(11) CONSTRAINT mlpk PRIMARY KEY, message_id NUMBER(11), CONSTRAINT mlfk FOREIGN KEY(message_id) REFERENCES messageData(message_id));

DESCRIBE messageList;

8-
CREATE TABLE groupData(group_id NUMBER(11) CONSTRAINT gdpk PRIMARY KEY, group_name VARCHAR(20), group_type VARCHAR(20), opening_date DATE);

DESCRIBE groupData;

7-
CREATE TABLE groupList(user_id NUMBER(11) CONSTRAINT glpk PRIMARY KEY, group_id NUMBER(11), CONSTRAINT glfk FOREIGN KEY(group_id) REFERENCES groupData(group_id));

DESCRIBE groupList;