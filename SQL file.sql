CREATE TABLE TIMELINE(
	TIMELINE_ID INT PRIMARY KEY,
	PHASE_NAME VARCHAR(50),
	TIMELINE_START_DATE DATE,
	TIMELINE_END_DATE DATE,
	TIMELINE_STATUS VARCHAR(50),
	PROJECT_ID INT,
	FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT(PROJECT_ID)
)


INSERT INTO TIMELINE(TIMELINE_ID, PHASE_NAME, TIMELINE_START_DATE, TIMELINE_END_DATE, TIMELINE_STATUS, PROJECT_ID) 
VALUES
(1, 'Requirements Gathering', '2023-01-15', '2023-02-15', 'Completed', 1),
(2, 'Design', '2023-02-16', '2023-03-31', 'Completed', 2),
(3, 'Development', '2023-04-01', '2023-05-15', 'In Progress', 3),
(4, 'Testing', '2023-05-16', '2023-06-15', 'Not Started', 1),
(5, 'Deployment', '2023-06-16', '2023-06-30', 'Not Started', 2),
(6, 'Requirements Gathering', '2023-02-01', '2023-02-28', 'Completed', 3),
(7, 'Design', '2023-03-01', '2023-03-31', 'Completed', 1),
(8, 'Development', '2023-04-01', '2023-04-30', 'In Progress', 2),
(9, 'Testing', '2023-05-01', '2023-05-15', 'Not Started', 3),
(10, 'Deployment', '2023-05-16', '2023-05-31', 'Not Started', 3);

CREATE TABLE REQUIREMENT(
	REQUIREMENT_ID INT PRIMARY KEY,
	REQ_NAME VARCHAR(50),
	PRIORITY VARCHAR(50),
	PROJECT_ID INT,
	FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT(PROJECT_ID)
)

INSERT INTO REQUIREMENT (REQUIREMENT_ID, REQ_NAME, PRIORITY, PROJECT_ID) 
VALUES
(1, 'Customer Management Module', 'High', 1),
(2, 'Sales Tracking Module', 'High', 2),
(3, 'Reporting Dashboard', 'Medium', 3),
(4, 'Mobile Access', 'Low', 2),
(5, 'Responsive Design', 'High', 1),
(6, 'Content Management System', 'High', 1),
(7, 'E-commerce Integration', 'Medium', 2),
(8, 'SEO Optimization', 'Medium', 3);

CREATE TABLE SUPPORT_TICKET(
	TICKET_ID INT PRIMARY KEY,
	STATUS VARCHAR(50),
	TICKET_TYPE VARCHAR(50),
	EMPLOYEE_ID INT,
	CLIENT_ID INT,
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
	FOREIGN KEY (CLIENT_ID) REFERENCES CLIENT(CLIENT_ID)
)

INSERT INTO SUPPORT_TICKET (TICKET_ID, STATUS, TICKET_TYPE, EMPLOYEE_ID, CLIENT_ID) VALUES
(1, 'Open', 'bet', 101, 2),
(2, 'Closed', 'Early Bird', 102, 1),
(3, 'In Progress', 'Pre-sale', 103, 2),
(4, 'Open', 'Discount Code', 104, 3),
(5, 'Open', 'Group Package', 105, 1)
 select * from SUPPORT_TICKET;

CREATE TABLE EXTERNAL_TICKET(
	EXT_TICKET_ID INT PRIMARY KEY,
	DATE_OPENED DATE,
	DATE_CLOSED DATE,
	SERVICE_LEVEL VARCHAR(50),
	CLIENT_ID INT,
	TICKET_ID INT,
	FOREIGN KEY (CLIENT_ID) REFERENCES CLIENT(CLIENT_ID),
	FOREIGN KEY (TICKET_ID) REFERENCES SUPPORT_TICKET(TICKET_ID)
)

INSERT INTO EXTERNAL_TICKET (EXT_TICKET_ID, DATE_OPENED, DATE_CLOSED, SERVICE_LEVEL, CLIENT_ID, TICKET_ID)
VALUES
(1, '2023-01-05', '2023-01-07', 'Premium', 1, 1),
(2, '2023-01-10', '2023-01-12', 'Standard', 2, 2),
(3, '2023-01-15', '2023-01-18', 'Premium', 3, 3),
(4, '2023-01-20', '2023-01-25', 'Basic', 1, 4),
(5, '2023-01-25', '2023-01-28', 'Standard', 3, 5)


CREATE TABLE CLIENT(
	CLIENT_ID INT PRIMARY KEY,
	CLIENT_NAME VARCHAR(50),
	CONTACT_PERSON VARCHAR(50),
	PHONE VARCHAR(50),
	EMAIL VARCHAR(50),
	CLIENT_ADDRESS VARCHAR(50),
	CITY VARCHAR(50),
	REG_DATE DATE
)

INSERT INTO CLIENT (CLIENT_ID, CLIENT_NAME, CONTACT_PERSON, PHONE, EMAIL, CLIENT_ADDRESS, CITY, REG_DATE) 
VALUES
(1, 'Ubuntu Technologies', 'Nelson Mandela', '011-555-1111', 'info@ubuntu-tech.co.za', '123 Main St', 'Johannesburg', '2021-01-10'),
(2, 'Impala Solutions', 'Desmond Tutu', '021-555-2222', 'info@impala.co.za', '456 Beach Rd', 'Cape Town', '2021-03-15'),
(3, 'Protea Innovations', 'Cyril Ramaphosa', '031-555-3333', 'info@protea.co.za', '789 Palm Ave', 'Durban', '2021-05-20'),
(4, 'Springbok Enterprises', 'Siya Kolisi', '012-555-4444', 'info@springbok.co.za', '101 Government Blvd', 'Pretoria', '2021-07-25'),
(5, 'Marula Industries', 'Miriam Makeba', '051-555-5555', 'info@marula.co.za', '202 Central St', 'Bloemfontein', '2021-09-30');

select * from CLIENT;

CREATE TABLE PROJECT_EMP(
	PROJECT_EMP_ID INT PRIMARY KEY,
	EMPLOYEE_ID INT,
	PROJECT_ID INT,
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
	FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT(PROJECT_ID)

)

INSERT INTO PROJECT_EMP(PROJECT_EMP_ID, EMPLOYEE_ID, PROJECT_ID) 
VALUES
(1, 101,1),
(2, 102,2),
(3, 103,3),
(4, 104, 2),
(5, 105, 2)


CREATE TABLE PROJECT(
	PROJECT_ID INT PRIMARY KEY,
	PROJECT_NAME VARCHAR(50),
	PROJECT_BUDGET VARCHAR(50),
	PROJECT_START_DATE DATE,
	PROJECT_END_DATE DATE,
	PROJECT_STATUS VARCHAR(50),
	PROJ_EMP_ID INT,
)

INSERT INTO PROJECT(PROJECT_ID, PROJECT_NAME, PROJECT_START_DATE, PROJECT_END_DATE, PROJECT_STATUS, PROJECT_BUDGET) 
VALUES
(1, 'Ubuntu CRM Implementation', '2023-01-15', '2023-06-30', 'In Progress', 500000.00),
(2, 'Impala Website Redesign', '2023-02-01', '2023-05-31', 'In Progress', 250000.00),
(3, 'Protea Mobile App Development', '2023-03-01', '2023-08-31', 'Planning', 350000.00);


CREATE TABLE DEPARTMENT(
	DEPARTMENT_ID INT PRIMARY KEY,
  	DEPARTMENT_NAME VARCHAR(50),
  	LOCATION VARCHAR(50)
)

INSERT INTO DEPARTMENT(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION)
VALUES
(1, 'IT', 'Limpopo'),
(2, 'Finance', 'Gauteng'),
(3, 'General', 'Mpumalanga')


SELECT * FROM DEPARTMENT;

CREATE table JOB_TITLE(
  JOB_TITLE_ID INT PRIMARY KEY,
  TITLE VARCHAR(25),
  SALARY_RANGE varchar(25)
  )

  INSERT into JOB_TITLE(JOB_TITLE_ID, TITLE, SALARY_RANGE)
  VALUES
     (1, 'Software Engineer', '$70,000 - $90,000'),
     (2, 'Marketing Manager', '$60,000 - $80,000'),
     (3, 'IT Support Specialist', '$50,000 - $65,000'),
     (4, 'Sales Representative', '$45,000 - $70,000'),
     (5, 'Project Manager', '$80,000 - $110,000');

  SELECT * FROM JOB_TITLE;
    

	CREATE TABLE EMPLOYEE(
	  EMPLOYEE_ID INT PRIMARY KEY,
  		NAME VARCHAR(50),
		EMAIL VARCHAR(50),
		PHONE VARCHAR(13),
		JOB_TITLE_ID INT,
		FOREIGN KEY (JOB_TITLE_ID) REFERENCES JOB_TITLE(JOB_TITLE_ID),
		DEPARTMENT_ID INT FOREIGN KEY REFERENCES DEPARTMENT(DEPARTMENT_ID)
	)

	INSERT INTO EMPLOYEE(EMPLOYEE_ID, NAME, EMAIL, PHONE, JOB_TITLE_ID, DEPARTMENT_ID)
	VALUES 
    (101, 'Alice Johnson', 'alice.j@example.com', '555-1001', 1, 2),  
    (102, 'Bob Smith', 'bob.s@example.com', '555-1002', 3, null),
    (103, 'Charlie Brown', 'charlie.b@example.com', '555-1003', 5, 1),
    (104, 'Diana Prince', 'diana.p@example.com', '555-1004', 2, null),
    (105, 'Evan Davis', 'evan.d@example.com', '555-1005', 4, 2);   

	SELECT * FROM EMPLOYEE;

	'''
	function that will perform project management duties
	'''
	CREATE FUNCTION fn_project_management(@PROJ_NAME VARCHAR(50))
	RETURNS TABLE
	AS
	RETURN(
	select 
	p.PROJECT_NAME,
	p.PROJECT_START_DATE,
	p.PROJECT_END_DATE,
	p.PROJECT_STATUS,
	p.PROJECT_BUDGET,
	t.PHASE_NAME,
	t.TIMELINE_START_DATE,
	t.TIMELINE_END_DATE,
	t.TIMELINE_STATUS,
	r.REQ_NAME,
	r.PRIORITY
	from PROJECT p
	join TIMELINE t ON t.PROJECT_ID = p.PROJECT_ID
	join REQUIREMENT r ON r.PROJECT_ID = P.PROJECT_ID
	WHERE p.PROJECT_NAME = @PROJ_NAME
	)

	select * from fn_project_management('Impala Website Redesign')

	'''
	function that will retrieve information about the tickets and clients
	'''
	CREATE FUNCTION fn_titcket_details(@ticket_status varchar(50))
	RETURNS TABLE
	AS
	RETURN(
	SELECT
	sp.STATUS,
	sp.TICKET_TYPE,
	et.DATE_OPENED,
	et.DATE_CLOSED,
	et.SERVICE_LEVEL,
	c.CLIENT_NAME,
	c.CONTACT_PERSON,
	c.PHONE,
	c.EMAIL,
	c.CLIENT_ADDRESS,
	c.CITY,
	c.REG_DATE
	FROM SUPPORT_TICKET sp
	JOIN EXTERNAL_TICKET et ON et.TICKET_ID = sp.TICKET_ID
	JOIN CLIENT c On c.CLIENT_ID = et.CLIENT_ID
	WHERE STATUS = @ticket_status
	)

	select * from fn_titcket_details('Open')

	'''
	function that will retrieve information about the project
	'''
	CREATE FUNCTION fn_projectDetails(@project_name varchar(50))
	returns table
	AS
	return(
	select
	p.PROJECT_STATUS,
	p.PROJECT_START_DATE,
	p.PROJECT_END_DATE,
	p.PROJECT_BUDGET

	from PROJECT p
	where p.PROJECT_NAME = @project_name
)

SELECT * FROM fn_projectDetails('Protea Mobile App Development');


	'''
	function that retrieves Employee information
	'''

	CREATE function fn_empDetail(@email varchar(50))
	returns table 
	AS
	return (
	  SELECT 
	  e.name,
	  e.email,
	  e.phone,
	  e.department_id,
	  d.department_name,
	  j.salary_range
	  from EMPLOYEE e
	  JOIN DEPARTMENT d on d.department_id = e.department_id
	  JOIN JOB_TITLE j on j.job_title_id = e.job_title_id
	  where e.EMAIL = @email
 )

 select * from fn_empDetail('evan.d@example.com');
 SELECT * FROM fn_empDetail('charlie.b@example.com');

	'''
	List all employees with their names and phone numbers.
	'''

	SELECT
	e.EMPLOYEE_ID,
	e.name, 
	e.phone
	FROM EMPLOYEE e

	'''
	Show employees who have no department assigned.
	'''
	SELECT * FROM EMPLOYEE e
	WHERE e.DEPARTMENT_ID is NULL

	'''
	Find employees with a specific job title (e.g., "Software Engineer").
	'''
	SELECT 
	e.EMPLOYEE_ID,
	e.NAME,
	e.EMAIL,
	e.PHONE,
	e.JOB_TITLE_ID
	FROM EMPLOYEE e
	JOIN JOB_TITLE j on j.JOB_TITLE_ID = e.JOB_TITLE_ID
	WHERE j.TITLE = 'Software Engineer'

	'''
	List all job titles and their salary ranges.
	'''

	SELECT 
	j.JOB_TITLE_ID,
	j.SALARY_RANGE
	FROM JOB_TITLE j;

	'''
	Find job titles that include the word "Manager".
	'''

	SELECT * 
	FROM JOB_TITLE j
	WHERE j.TITLE = 'Project Manager'

	'''
	List all departments and their locations.
	'''

	SELECT 
	d.DEPARTMENT_ID,
	d.DEPARTMENT_NAME,
	d.LOCATION
	FROM DEPARTMENT d;

	'''
	List employees along with their department names.
	'''

	SELECT 
	e.EMPLOYEE_ID,
	e.NAME,
	e.EMAIL,
	e.PHONE,
	d.DEPARTMENT_NAME
	FROM EMPLOYEE e
	JOIN DEPARTMENT d on d.DEPARTMENT_ID = e.DEPARTMENT_ID

	'''
	Show employees with their job titles and salary ranges.
	'''

	SELECT 
	e.EMPLOYEE_ID,
	e.NAME,
	e.EMAIL,
	e.PHONE,
	j.TITLE,
	J.SALARY_RANGE
	FROM EMPLOYEE e
	JOIN JOB_TITLE j on j.JOB_TITLE_ID = e.JOB_TITLE_ID

	'''
	Find all employees in the "IT" department.
	'''

	SELECT 
	e.EMPLOYEE_ID,
	e.NAME,
	e.EMAIL,
	e.PHONE
	FROM EMPLOYEE e
	JOIN DEPARTMENT d on d.DEPARTMENT_ID = e.DEPARTMENT_ID
	WHERE d.DEPARTMENT_NAME = 'IT'
