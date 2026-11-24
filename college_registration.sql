-- Creating the college registration database--
CREATE DATABASE college_registration;
-- Adding tables into the database -- 
CREATE TABLE "User" (
    "userID" VARCHAR(10) PRIMARY KEY,
    "firstName" VARCHAR(35),
    "lastName" VARCHAR(35),
    "DOB" DATE,
    email VARCHAR(50) UNIQUE,
    password VARCHAR(30),
    phone VARCHAR(15),
    role VARCHAR(10),
    "lastLogout" TIMESTAMP NULL
);

CREATE TABLE Student (
    "userID" VARCHAR(10) PRIMARY KEY,
    "fieldOfStudy" VARCHAR(50),
    FOREIGN KEY ("userID") REFERENCES "User"("userID")
);

CREATE TABLE Course (
    "courseID" VARCHAR(10) PRIMARY KEY,
    "courseName" VARCHAR(100),
    description TEXT,
    department VARCHAR(50)
);

CREATE TABLE Section (
    "sectionID" VARCHAR(10) PRIMARY KEY,
    "courseID" VARCHAR(10),
    "instructorName" VARCHAR(50),
    semester VARCHAR(20),
    "startDate" DATE,
    "endDate" DATE,
    "seatsAvailable" INT,
    format VARCHAR(15),
    FOREIGN KEY ("courseID") REFERENCES Course("courseID")
);

CREATE TABLE Registration (
    "registrationID" VARCHAR(10) PRIMARY KEY,
    "userID" VARCHAR(10),
    "sectionID" VARCHAR(10),
    "registrationDate" DATE,
    status VARCHAR(20),
    FOREIGN KEY ("userID") REFERENCES "User"("userID"),
    FOREIGN KEY ("sectionID") REFERENCES Section("sectionID")
);

CREATE TABLE Transcript (
    "transcriptID" VARCHAR(10) PRIMARY KEY,
    "userID" VARCHAR(10),
    "courseID" VARCHAR(10),
    "finalGrade" CHAR(2),
    FOREIGN KEY ("userID") REFERENCES "User"("userID"),
    FOREIGN KEY ("courseID") REFERENCES Course("courseID")
);

CREATE TABLE PasswordReset (
    "resetID" VARCHAR(10) PRIMARY KEY,
    "userID" VARCHAR(10),
    email VARCHAR(50),
    "resetDate" DATE,
    FOREIGN KEY ("userID") REFERENCES "User"("userID")
);

-- Adding information into each table --

INSERT INTO "User" VALUES
('U1001', 'Jessica', 'Jones', '1995-04-15', 'j.jones@email.com', 'pass123', '1234567890', 'student', NULL),
('U1002', 'Daniel', 'Lee', '1998-09-21', 'd.lee@email.com', 'dlee456', '2345678901', 'student', NULL),
('U1003', 'Sophia', 'Nguyen', '2000-07-11', 'sophia.n@email.com', 'sophia789', '3456789012', 'student', NULL),
('U1004', 'Michael', 'Brown', '1997-12-03', 'mike.b@email.com', 'mbrown2024', '4567890123', 'student', NULL),
('U1005', 'Lena', 'Scott', '2002-05-17', 'lena.scott@email.com', 'lscott2025', '5551234567', 'student', NULL),
('U2001', 'Alex', 'Smith', '1980-11-02', 'admin.smith@email.com', 'adminpass', '9876543210', 'admin', NULL),
('U2002', 'Karen', 'Morris', '1982-03-22', 'k.morris@email.com', 'karen123', '4561237890', 'admin', NULL),
('U2003', 'Tom', 'Green', '1985-07-14', 't.green@email.com', 'tompass', '3214567890', 'admin', NULL),
('U2004', 'Nina', 'Grant', '1990-01-12', 'n.grant@email.com', 'ninapass', '6543217890', 'admin', NULL),
('U2005', 'Steve', 'Young', '1978-08-30', 's.young@email.com', 'stevey', '9873216540', 'admin', NULL);

INSERT INTO Student VALUES
('U1001', 'Computer Science'),
('U1002', 'Information Technology'),
('U1003', 'Cybersecurity'),
('U1004', 'Software Engineering'),
('U1005', 'Information Technology');

INSERT INTO Course VALUES
('C101', 'Intro to Databases', 'Foundations of relational databases.', 'Computer Science'),
('C102', 'Web Development I', 'HTML, CSS basics and layout design.', 'IT'),
('C103', 'Data Structures', 'Linked lists, stacks, queues.', 'Computer Science'),
('C104', 'Networking Basics', 'OSI model and IP addressing.', 'Cybersecurity'),
('C105', 'Programming I', 'Intro to Python and basic logic.', 'Software Engineering'),
('C106', 'Cloud Computing', 'Intro to AWS and Azure.', 'IT'),
('C107', 'AI Fundamentals', 'Basic AI/ML principles.', 'Computer Science'),
('C108', 'Systems Analysis', 'Analyzing system workflows.', 'IT'),
('C109', 'Cyber Defense', 'Network and application security.', 'Cybersecurity'),
('C110', 'Java Programming', 'Intro to Java language.', 'Software Engineering');

INSERT INTO Section VALUES
('S001', 'C101', 'Dr. Green', 'Fall 2025', '2025-08-15', '2025-12-05', 30, 'In-Person'),
('S002', 'C102', 'Prof. Blue', 'Fall 2025', '2025-08-15', '2025-12-05', 25, 'Online'),
('S003', 'C103', 'Dr. Knight', 'Fall 2025', '2025-08-15', '2025-12-05', 20, 'In-Person'),
('S004', 'C104', 'Prof. Miles', 'Fall 2025', '2025-08-15', '2025-12-05', 20, 'Hybrid'),
('S005', 'C105', 'Dr. Lopez', 'Fall 2025', '2025-08-15', '2025-12-05', 25, 'Online'),
('S006', 'C106', 'Dr. Luna', 'Fall 2025', '2025-08-15', '2025-12-05', 30, 'Online'),
('S007', 'C107', 'Dr. White', 'Fall 2025', '2025-08-15', '2025-12-05', 25, 'Hybrid'),
('S008', 'C108', 'Dr. Black', 'Fall 2025', '2025-08-15', '2025-12-05', 20, 'In-Person'),
('S009', 'C109', 'Dr. Rose', 'Fall 2025', '2025-08-15', '2025-12-05', 25, 'Online'),
('S010', 'C110', 'Dr. Clark', 'Fall 2025', '2025-08-15', '2025-12-05', 30, 'Hybrid');

INSERT INTO Transcript VALUES
('T001', 'U1001', 'C101', 'A'),
('T002', 'U1001', 'C102', 'B+'),
('T003', 'U1002', 'C103', 'A-'),
('T004', 'U1003', 'C104', 'B'),
('T005', 'U1004', 'C105', 'A'),
('T006', 'U1005', 'C101', 'B'),
('T007', 'U1005', 'C102', 'A'),
('T008', 'U1005', 'C103', 'A-'),
('T009', 'U1005', 'C104', 'B+'),
('T010', 'U1005', 'C105', 'A');

INSERT INTO PasswordReset VALUES
('PR001', 'U1001', 'j.jones@email.com', '2025-06-01'),
('PR002', 'U1002', 'd.lee@email.com', '2025-06-02'),
('PR003', 'U1003', 'sophia.n@email.com', '2025-06-03'),
('PR004', 'U1004', 'mike.b@email.com', '2025-06-04'),
('PR005', 'U2001', 'admin.smith@email.com', '2025-06-05'),
('PR006', 'U1005', 'lena.scott@email.com', '2025-06-06'),
('PR007', 'U2002', 'k.morris@email.com', '2025-06-07'),
('PR008', 'U2003', 't.green@email.com', '2025-06-08'),
('PR009', 'U2004', 'n.grant@email.com', '2025-06-09'),
('PR010', 'U2005', 's.young@email.com', '2025-06-10');

-- vaildations --
-- creating account --
SELECT *
FROM "User";
-- loggging in -- 
SELECT "userID", role, "firstName", "lastName"
FROM "User"
WHERE email = 'lena.scott@email.com'
AND password = 'lscott2025';
-- looking up courses --

SELECT
    S."sectionID",
    C."courseName",
    C."courseID",
    S."instructorName",
    S."semester",
    S."startDate",
    S."endDate",
    C."department",
    S."seatsAvailable"
FROM Course C
JOIN Section S
    ON C."courseID" = S."courseID"
WHERE S.semester = 'Fall 2025'
AND C."courseName" LIKE '%Database%'
AND C.department = 'Computer Science';
-- registering for courses -- 
INSERT INTO Registration
("registrationID", "userID", "sectionID", "registrationDate", status)
VALUES
('R001', 'U1005', 'S005', CURRENT_DATE, 'Registered');

-- view registered courses--

SELECT *
FROM Registration;

-- droppoing courses, also checking the number of registered courses --

SELECT COUNT(*) AS "Amount of Classes"
FROM Registration
WHERE "userID" = 'U1005';

DELETE FROM Registration
WHERE "userID" = 'U1005'
AND "sectionID" = 'S005';

-- view class schedule --

SELECT
    C."courseName",
    S."sectionID",
    S."startDate",
    S."endDate",
    S."instructorName",
    C."department",
    S."format"
FROM Registration R
JOIN Section S
    ON R."sectionID" = S."sectionID"
JOIN Course C
    ON S."courseID" = C."courseID"
WHERE R."userID" = 'U1005'
AND S."semester" = 'Fall 2025';

-- view acadmeic transcript -- 

SELECT
    C."courseName",
    C."courseID",
    T."finalGrade"
FROM Transcript T
JOIN Course C
    ON T."courseID" = C."courseID"
WHERE T."userID" = 'U1005';

-- admin adding / editing courses, C106 already exists in the sample data, use a new course ID when testing this INSERT. --

INSERT INTO Course
("courseID", "courseName", "description", "department")
VALUES
('C111', 'Cloud Computing II',
 'Advanced introduction to cloud computing.',
 'Information Technology');

-- adding a new section --

INSERT INTO Section
(
    "sectionID",
    "courseID",
    "instructorName",
    "semester",
    "startDate",
    "endDate",
    "seatsAvailable",
    "format"
)
VALUES
(
    'S011',
    'C106',
    'Dr. Luna',
    'Spring 2026',
    '2026-01-15',
    '2026-05-05',
    30,
    'Online'
);


-- updating an existing course --

UPDATE Course
SET description =
    'Updated: SQL, ER diagrams, and stored procedures.'
WHERE "courseID" = 'C101';



UPDATE "User"
SET "lastLogout" = NOW()
WHERE "userID" = 'U1005';

SELECT "userID"
FROM "User"
WHERE "userID" = 'U2001'
AND email = 'admin.smith@email.com';


SELECT "userID"
FROM "User"
WHERE "userID" = 'U2001'
AND email = 'admin.smith@email.com';

SELECT
    U."userID",
    PR."resetID",
    PR."email",
    PR."resetDate"
FROM "User" U
JOIN PasswordReset PR
    ON U."userID" = PR."userID"
WHERE U."userID" = 'U2001';