DROP TABLE department CASCADE CONSTRAINTS;
CREATE TABLE department (
   DNumber NUMBER(3),
   DName VARCHAR2(15),
   MGRSSN VARCHAR2(9),
   MGRStartDate DATE,
   CONSTRAINT pk_department PRIMARY KEY (DNumber)
);

DROP TABLE employee CASCADE CONSTRAINTS;
CREATE TABLE employee (
   SSN VARCHAR2(9),
   FName VARCHAR2(15),
   Minit CHAR(1),
   LName VARCHAR2(15),
   BDate DATE,
   Address VARCHAR2(30),
   Sex CHAR(1),
   Salary NUMBER(10,2),
   SuperSSN VARCHAR2(9),
   DNO NUMBER(3),
   CONSTRAINT pk_employee PRIMARY KEY (SSN)
);

DROP TABLE dependent CASCADE CONSTRAINTS;
CREATE TABLE dependent (
   ESSN VARCHAR2(9),
   DEPENDENT_NAME VARCHAR2(50),
   Sex CHAR(1),
   BDate DATE,
   Relationship VARCHAR2(20),
   CONSTRAINT pk_dependent PRIMARY KEY (ESSN, DEPENDENT_NAME)
);

DROP TABLE dept_locations CASCADE CONSTRAINTS;
CREATE TABLE dept_locations (
   DNumber NUMBER(11),
   DLocation VARCHAR2(50),
   CONSTRAINT pk_dept_locations PRIMARY KEY (DNumber, DLocation)
);

DROP TABLE project CASCADE CONSTRAINTS;
CREATE TABLE project (
   PNumber NUMBER(11),
   PName VARCHAR2(50),
   Plocation VARCHAR2(50),
   DNum NUMBER(11),
   CONSTRAINT pk_project PRIMARY KEY (PNumber)
);

DROP TABLE works_on CASCADE CONSTRAINTS;
CREATE TABLE works_on (
   ESSN VARCHAR2(9),
   PNO NUMBER(11),
   HOURS NUMBER(10,2),
   CONSTRAINT pk_works_on PRIMARY KEY (ESSN, PNO)
);

ALTER TABLE department
  ADD CONSTRAINT FK_DEP_EMP FOREIGN KEY (MGRSSN)
  REFERENCES employee (SSN);

ALTER TABLE dependent
  ADD CONSTRAINT FK_DEPEN_EMP FOREIGN KEY (ESSN)
  REFERENCES employee (SSN);

ALTER TABLE dept_locations
  ADD CONSTRAINT FK_DEPLOC_DEP FOREIGN KEY (DNumber)
  REFERENCES department (DNumber);

ALTER TABLE employee
  ADD CONSTRAINT FK_EMP_EMP FOREIGN KEY (SuperSSN)
  REFERENCES employee (SSN);

ALTER TABLE employee
  ADD CONSTRAINT FK_EMP_DEP FOREIGN KEY (DNO)
  REFERENCES department (DNumber);

ALTER TABLE project
  ADD CONSTRAINT FK_PRO_DEP FOREIGN KEY (DNum)
  REFERENCES department (DNumber);

ALTER TABLE works_on
  ADD CONSTRAINT FK_WORK_EMP FOREIGN KEY (ESSN)
  REFERENCES employee (SSN);

ALTER TABLE works_on
  ADD CONSTRAINT FK_WORK_PRO FOREIGN KEY (PNO)
  REFERENCES project (PNumber);
