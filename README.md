# Hospital-Database-Design-and-Implementation
## Project Overview
This repository contains the **Database Design Implementation** Project for **Amina_MedicalCare** and Medical Management System, Completed by **Amina Ibrahim** in September 2024. The system is designed to efficiently manage hospital data, including patient information , doctor detials, medical records, appointments and department data.

---


## Table of Contents
1. [Introduction](#Iintrodcution)
   
2. [Database Design Process](#Database-Design-process)
   - [Requirements Gathering](#requirements-gathering)
   - [Conceptual Design](#conceptual-design)
   - [Logical Design](#Logical-design)
   - [Phyiscal Design](#physical-design)

3. [Databse Schema and Implementation](#Database-scheme-and-implementation)
   - [Patient Table](#Patient-Table)
   - [Doctor Table](#Doctor-Table)
   - [Medical Records Table](#Medical-Records-Table)
   - [Appointment Table](#Appointment-Table)
   - [Department Table](#Department-Table)

4. [Normalization](#Normalization)
   - [First Normal Form(1NF)](#First-Normal-Form(1NF))
   - [Second Normal Form(2NF)](#Second-Normal-Form(2NF))
   - [Third Normal Form(3NF)](#Third-Normal-Form(3NF))

5. [Justification of Design Choices](#Justification-of-Design-Choices)

6. [Conclusion](#Conclusion)

---

## Introduction
The purpose of this report is to design and implement a fully normalized hospital database system using SQL. The database is structured to manage essential hospital operations such as patient management, doctor scheduling, medical records tracking, and appointment booking. Through proper normalization techniques, the database aims to ensure data integrity, avoid redundancy, and support efficient query execution. The report will document the design process, SQL statements for table creation and population, and queries to retrieve critical hospital information.

---

## Database Design Process
### Requirement Gathering
In collaboration with stakeholders, the following requirements were established:
- Comprehensive details of patients, doctors, and departments.
- Management of medical records (diagnoses, prescriptions, and treatment history).
- Real-time appointment scheduling and tracking.
- Comprehensive



### Conceptual Design
Using an Entity- Relationship (ER) model, the following entities were defined:
- **Patients**: Personal and Contact details.
- **Doctors**: Names, Specialties, and availability.
- **Appointments**: Scheduling and status
- **Medical Records**: Historical records of diagnoses and medications
- **Departments**: Organizational structure for medical departments

<img width="449" alt="image" src="https://github.com/user-attachments/assets/8fac85a2-3534-4f5c-badd-cfea97800ae7">


### Logical Design
The ER model was then converted into a logical schema. Primary keys and foreign keys were assigned, and relationships between tables were formalized to ensure referential integrity.

### Physical Design
The system was implemented using T-SQl(Transact SQL) and SQL Server. key Features include:
- Constraints to ensure data accuracy.
- Optimized queries for performance.

---

## Databse Schema and Implementation
### Patients Table
 
| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| PatientId      | INT         | PRIMARY KEY, AUTO-INCREMENT   |
| FullName       | VARCHAR(100)| NOT NULL                      |
| Address        | VARCHAR(100)|                               |
| DateOfBirth    | DATE        | NOT NULL                      |
| Insurance      | VARCHAR(50) |                               |
| Username       | VARCHAR(50) | UNIQUE                        |
| Password       | VARCHAR(50) | NOT NULL                      |
| EmailAddress   | VARCHAR(100)| NOT NULL                      |
| PhoneNumber    | VARCHAR(20) | NOT NULL                      |
| DateLeft       | DATE        |                               |

### Doctors Table
 
| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| DoctorID       | INT         | PRIMARY KEY, AUTO-INCREMENT   |
| FullName       | VARCHAR(100)| NOT NULL                      |
| Speciality     | VARCHAR(50) | NOT NULL                      |

### Appointments Table
 
| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| AppointmentID  | INT         | PRIMARY KEY, AUTO-INCREMENT    |
| PatientID      | INT         | FOREIGN KEY REFERENCES Patients|
| DoctorID       | INT         | FOREIGN KEY REFERENCES Doctors |
| AppointmentTime| TIME        |                                |
| AppointmentDate| DATE        |                                |
| Department     | VARCHAR(50) |                                |
| Status         | VARCHAR(20) | CHECK (IN 'Pending', 'Cancelled', 'Completed')|
| Feedback       | VARCHAR(100)|                                |

### Medical Records Table
 
| Column          | Data Type   | Constraints                   |
|-----------------|-------------|-------------------------------|
| MedicalRecordID | INT         | PRIMARY KEY, AUTO-INCREMENT   |
| PatientID       | INT         | FOREIGN KEY REFERENCES Patients|
| PastAppointments| VARCHAR (100)|                               |
| Diagnoses       | VARCHAR (100)|                               |
| Medicines       | VARCHAR (100)|                               |
| MedicinesPrescribedDate| DATE  |                               |
| Allergies       | VARCHAR (100)|                               |
 
### Departments Table
 
| Column         | Data Type   | Constraints                   |
|----------------|-------------|-------------------------------|
| DepartmentID   | INT         | PRIMARY KEY, AUTO-INCREMENT   |
| DepartmentName | VARCHAR(50) |                               |
 

---

## Normalization
### First Normal Form (1NF)
- Ensures removing repeating groups and ensuring atomicity in attributes.

### Second Normal Form (2NF)
- Involves eliminating partial dependencies by ensuring non-key attributes depend on the primary key.

### Third Normal Form (3NF)
- Involves removing transitive dependencies to ensure that all attributes are dependent solely on the primary key
  
---

## Justification of Design Choices
- The database design choices were guided by normalization principles, scalability, and data integrity. Each data type was selected to balance storage efficiency and operational requirements. Foreign key constraints ensure consistency across related tables, while CHECK constraints enforce business rules like valid appointment statuses and future appointment dates.

---

## Conclusion
- In summary, the process of designing, creating, and populating the hospital database involved key steps in establishing a structured, normalized schema to ensure data integrity and optimize query performance. By creating tables for patients, doctors, appointments, departments, and medical records, we were able to efficiently manage essential data for a hospital setting. The constraints applied, such as foreign keys and check constraints, ensure the database maintains valid relationships and restricts invalid data entries. 
- The queries developed allow for practical use of the database, such as ensuring no appointment is scheduled in the past, identifying patients with specific conditions, and tracking completed appointments by specific doctor specialties. Through this implementation, the database is set up to support accurate reporting and data analysis, contributing to improved hospital operations and patient care.
- The design and execution of this database also emphasize the importance of proper data types and constraints in ensuring efficiency, accuracy, and scalability.
  
---


   
