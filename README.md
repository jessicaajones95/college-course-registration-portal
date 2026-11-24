# college-course-registration-portal
A normalized (3NF) PostgreSQL database project simulating a college course registration portal with student enrollment, schedule management, transcript tracking, and admin course controls.

# College Course Registration Portal (PostgreSQL)

A relational database management project built in PostgreSQL that simplifies college course registration, schedule management, and academic record tracking for students and administrators.

## Project Overview
Traditional course registration processes can be fragmented and difficult to navigate. This project implements a normalized (3NF) PostgreSQL backend designed to handle:
* **Student Workflows:** Account creation, authentication, course catalog search, section registration (enforcing a 4-to-6 course limit), course drops, schedule viewing, and academic transcript retrieval.
* **Administrator Workflows:** Adding and editing course catalog entries, creating new semester sections, and managing seat capacity.
* **Security & Auditing:** Password reset request logging and user logout timestamp tracking.

## Tech Stack
* **Database:** PostgreSQL
* **Development Environment:** Visual Studio Code (VS Code)
* **Language:** SQL (DDL, DML, DQL)

## Database Architecture & Schema (3NF)
The database (`college_registration`) is normalized to Third Normal Form across seven core tables:

| Table Name | Description | Primary Key | Foreign Keys |
| :--- | :--- | :--- | :--- |
| **`User`** | Stores base account details, roles (`student`/`admin`), and `lastLogout` timestamps. | `userID` | — |
| **`Student`** | Extends `User` (1:1) with student-specific academic details (`fieldOfStudy`). | `userID` | `userID` → `User` |
| **`Course`** | Stores general catalog details (`courseName`, `description`, `department`). | `courseID` | — |
| **`Section`** | Stores specific semester offerings (`instructorName`, dates, `seatsAvailable`, `format`). | `sectionID` | `courseID` → `Course` |
| **`Registration`** | Junction table tracking student enrollments and statuses (`Registered`, `DROPPED`). | `registrationID` | `userID` → `User`, `sectionID` → `Section` |
| **`Transcript`** | Stores completed courses and final letter grades. | `transcriptID` | `userID` → `User`, `courseID` → `Course` |
| **`PasswordReset`** | Logs password recovery verification requests. | `resetID` | `userID` → `User` |

### Entity Relationships
* **Users to Students:** One-to-One (`1:1`)
* **Courses to Sections:** One-to-Many (`1:N`)
* **Students to Registrations:** One-to-Many (`1:N`)
* **Sections to Registrations:** One-to-Many (`1:N`)
* **Students to Transcripts:** One-to-Many (`1:N`)
* **Courses to Transcripts:** One-to-Many (`1:N`)
* **Users to Password Reset Requests:** One-to-Many (`1:N`)

## Repository Contents
* `README.md` — Project documentation, relational schema overview, and usage instructions.
* `college_registration.sql` — Complete SQL script containing database/table creation (`DDL`), sample seed data (`DML`), and functional validation queries (`DQL`).

## How to Run Locally
1. Ensure **PostgreSQL** is installed and running locally.
2. Open `college_registration.sql` in **Visual Studio Code** (using a PostgreSQL extension) or `psql`.
3. Execute the `CREATE DATABASE college_registration;` statement first, connect to the new database, and run the remaining table creation, seed data, and validation query blocks in order.

## Key SQL Features Demonstrated
* **Relational Integrity:** Enforced via Primary Keys, Foreign Keys, and `UNIQUE` email constraints.
* **Multi-Table Joins:** Joining `Registration`, `Section`, and `Course` to generate student schedules and search available classes.
* **Aggregations & Business Logic:** Using `COUNT(*)` to verify course load limits (minimum 4, maximum 6 active courses) prior to registration or dropping a section.
