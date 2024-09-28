/* As a database developer consultant, my role is to design a system that efficiently stores patient, doctor, and medical information. 
This database will manage patient details, doctor records, medical history, prescriptions, appointments, and departments.
The goal is to create a scalable, secure system that improves the hospital’s operations and patient care through seamless access to critical information. 
This will support the hospital's mission to deliver timely and efficient healthcare services.
SQL statements to create the tables based on the extracted schema */


CREATE DATABASE Amina_MedicalCare


CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    FullName VARCHAR(100) NOT NULL,
    Address VARCHAR(100),
    DateOfBirth DATE NOT NULL,
    Insurance VARCHAR(50),
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    DateLeft DATE
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    FullName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(50) NOT NULL
);


CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentTime TIME,
    AppointmentDate DATE,
    Department VARCHAR(50),
    Status VARCHAR(20) CHECK(Status IN ('Pending', 'Cancelled', 'Completed')),
    Feedback VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE MedicalRecords (
    MedicalRecordID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PatientID INT NOT NULL,
    PastAppointments VARCHAR(100),
    Diagnoses VARCHAR(100),
    Medicines VARCHAR(100),
    MedicinePrescribedDate DATE,
    Allergies VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    DepartmentName VARCHAR(50)
);


INSERT INTO Patients (FullName, Address, DateOfBirth, Insurance, Username, Password, Email, PhoneNumber, DateLeft)
VALUES
('John Doe', '123 Main St', '1980-06-01', 'Aetna', 'jdoe', 'password123', 'john.doe@example.com', '+11234567890', NULL),
('Jane Smith', '456 Oak St', '1975-08-12', 'BlueCross', 'jsmith', 'securePass1', 'jane.smith@example.com', '+19876543210', NULL),
('Emily Clark', '789 Pine St', '1990-02-22', 'Cigna', 'eclark', 'emily1234', 'emily.clark@example.com', '+14045551234', NULL),
('Michael Brown', '321 Cedar St', '1985-05-17', 'Medicare', 'mbrown', 'michaelpass', 'michael.brown@example.com', '+14445567890', NULL),
('Emma Johnson', '654 Elm St', '1992-09-30', 'Aetna', 'ejohnson', 'emmajohnson', 'emma.johnson@example.com', '+13025551234', NULL),
('James Davis', '888 Maple St', '1970-03-12', 'UnitedHealth', 'jdavis', 'passjames', 'james.davis@example.com', '+12015551234', NULL),
('Olivia Garcia', '222 Birch St', '1983-07-23', 'Cigna', 'ogarcia', 'olivepass', 'olivia.garcia@example.com', '+19875551234', NULL),
('Lucas Wilson', '111 Spruce St', '1995-12-18', 'Aetna', 'lwilson', 'lucas1234', 'lucas.wilson@example.com', '+15045551234', NULL),
('Sophia Martinez', '333 Chestnut St', '1987-08-25', 'BlueCross', 'smartinez', 'sophiapass', 'sophia.martinez@example.com', '+14125551234', NULL),
('Mason Anderson', '777 Aspen St', '1973-11-04', 'UnitedHealth', 'manderson', 'masonpass', 'mason.anderson@example.com', '+13015551234', NULL),
('Ava Thompson', '999 Cypress St', '1989-06-30', 'Cigna', 'athompson', 'avapass', 'ava.thompson@example.com', '+16025551234', NULL),
('Ethan Lee', '444 Redwood St', '1982-05-15', 'BlueCross', 'elee', 'ethanlee', 'ethan.lee@example.com', '+17025551234', NULL),
('Mia Harris', '666 Oakwood St', '1991-10-10', 'Aetna', 'mharris', 'miapass', 'mia.harris@example.com', '+15015551234', NULL),
('Liam Clark', '123 Sycamore St', '1980-04-28', 'Medicare', 'lclark', 'liam123', 'liam.clark@example.com', '+18015551234', NULL),
('Amelia Walker', '345 Pinewood St', '1993-11-11', 'UnitedHealth', 'awalker', 'amelia123', 'amelia.walker@example.com', '+19025551234', NULL),
('Noah Perez', '678 Oakwood St', '1984-07-14', 'BlueCross', 'nperez', 'noah1234', 'noah.perez@example.com', '+18125551234', NULL),
('Isabella Hall', '890 Aspen St', '1986-01-22', 'Cigna', 'ihall', 'isapass', 'isabella.hall@example.com', '+15015551234', NULL),
('William Young', '432 Cedarwood St', '1978-03-20', 'Medicare', 'wyoung', 'willpass', 'william.young@example.com', '+17015551234', NULL),
('Evelyn King', '101 Redwood St', '1994-02-02', 'UnitedHealth', 'eking', 'evelynking', 'evelyn.king@example.com', '+14115551234', NULL),
('Benjamin Scott', '654 Chestnut St', '1977-12-05', 'Aetna', 'bscott', 'ben123', 'benjamin.scott@example.com', '+19045551234', NULL);



INSERT INTO Doctors (FullName, Specialty)
VALUES
('Dr. Gregory House', 'Gastroenterologists'),
('Dr. Meredith Grey', 'Cardiologists'),
('Dr. John Carter', 'Oncologists'),
('Dr. Derek Shepherd', 'Neurosurgeons'),
('Dr. Miranda Bailey', 'Pediatrics'),
('Dr. Mark Sloan', 'Plastic Surgeons'),
('Dr. Arizona Robbins', 'Orthopedic Surgeons'),
('Dr. Alex Karev', 'Pediatric Surgeons'),
('Dr. Owen Hunt', 'Trauma Surgeons'),
('Dr. Richard Webber', 'Internal Medicine'),
('Dr. April Kepner', 'Trauma Surgeons'),
('Dr. Jackson Avery', 'Plastic Surgeons'),
('Dr. Amelia Shepherd', 'Neurosurgeons'),
('Dr. Teddy Altman', 'Cardiothoracic Surgeons'),
('Dr. Callie Torres', 'Orthopedic Surgeons'),
('Dr. Jo Wilson', 'General Surgeons'),
('Dr. Maggie Pierce', 'Cardiologists'),
('Dr. Andrew DeLuca', 'General Surgeons'),
('Dr. Tom Koracick', 'Neurosurgeons'),
('Dr. Cormac Hayes', 'Pediatrics');


INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Department, Status, Feedback)
VALUES
(1, 1, '2024-10-01', '09:00', 'Gastroenterology', 'Completed', 'Excellent service'),
(2, 2, '2024-10-02', '11:00', 'Cardiology', 'Completed', 'Satisfied'),
(3, 3, '2024-10-03', '14:00', 'Oncology', 'Pending', NULL),
(4, 4, '2024-10-04', '13:30', 'Neurosurgery', 'Completed', 'Well organized'),
(5, 5, '2024-10-05', '10:00', 'Pediatrics', 'Pending', NULL),
(6, 6, '2024-10-06', '16:00', 'Plastic Surgery', 'Cancelled', 'Doctor not available'),
(7, 7, '2024-10-07', '15:30', 'Orthopedics', 'Completed', 'Smooth process'),
(8, 8, '2024-10-08', '08:45', 'Pediatric Surgery', 'Completed', 'Well done'),
(9, 9, '2024-10-09', '09:15', 'Trauma Surgery', 'Completed', 'Great'),
(10, 10, '2024-10-10', '11:00', 'Internal Medicine', 'Completed', 'Very good'),
(11, 11, '2024-10-11', '14:30', 'Trauma Surgery', 'Pending', NULL),
(12, 12, '2024-10-12', '12:00', 'Plastic Surgery', 'Completed', 'Painless experience'),
(13, 13, '2024-10-13', '13:15', 'Neurosurgery', 'Pending', NULL),
(14, 14, '2024-10-14', '16:30', 'Cardiothoracic Surgery', 'Completed', 'Excellent care'),
(15, 15, '2024-10-15', '11:45', 'Orthopedics', 'Completed', 'Efficient service'),
(16, 16, '2024-10-16', '15:00', 'General Surgery', 'Cancelled', 'Family emergency'),
(17, 17, '2024-10-17', '10:30', 'Cardiology', 'Completed', 'Well done'),
(18, 18, '2024-10-18', '09:00', 'General Surgery', 'Pending', NULL),
(19, 19, '2024-10-19', '14:00', 'Neurosurgery', 'Completed', 'Good experience'),
(20, 20, '2024-10-20', '12:30', 'Pediatrics', 'Pending', NULL);


INSERT INTO MedicalRecords (PatientID, PastAppointments, Diagnoses, Medicines, MedicinePrescribedDate, Allergies)
VALUES
(1, 'Gastroenterologist visit on 2023-10-15', 'Gastroenteritis', 'Omeprazole', '2023-10-15', 'None'),
(2, 'Cardiologist visit on 2024-01-12', 'Hypertension', 'Lisinopril', '2024-01-12', 'Penicillin'),
(3, 'Oncologist visit on 2024-03-05', 'Breast Cancer', 'Tamoxifen', '2024-03-05', 'None'),
(4, 'Neurosurgeon visit on 2024-04-22', 'Migraine', 'Sumatriptan', '2024-04-22', 'None'),
(5, 'Pediatrician visit on 2024-05-10', 'Asthma', 'Albuterol', '2024-05-10', 'Peanuts'),
(6, 'Plastic Surgeon visit on 2024-06-14', 'Skin Graft', 'None', '2024-06-14', 'None'),
(7, 'Orthopedic visit on 2024-07-19', 'Fracture', 'Ibuprofen', '2024-07-19', 'None'),
(8, 'Pediatric Surgery on 2024-08-01', 'Appendicitis', 'None', '2024-08-01', 'None'),
(9, 'Trauma Surgery on 2024-09-11', 'Concussion', 'Acetaminophen', '2024-09-11', 'None'),
(10, 'Internal Medicine visit on 2024-10-01', 'Diabetes', 'Metformin', '2024-10-01', 'None'),
(11, 'Trauma Surgery on 2024-11-12', 'Broken Rib', 'Oxycodone', '2024-11-12', 'Shellfish'),
(12, 'Plastic Surgery on 2024-12-22', 'Rhinoplasty', 'None', '2024-12-22', 'None'),
(13, 'Neurosurgery on 2025-01-15', 'Epilepsy', 'Levetiracetam', '2025-01-15', 'None'),
(14, 'Cardiothoracic Surgery on 2025-02-17', 'Aortic Aneurysm', 'Warfarin', '2025-02-17', 'None'),
(15, 'Orthopedics visit on 2025-03-22', 'ACL Tear', 'None', '2025-03-22', 'None'),
(16, 'General Surgery on 2025-04-08', 'Hernia Repair', 'None', '2025-04-08', 'None'),
(17, 'Cardiologist visit on 2025-05-14', 'Arrhythmia', 'Amiodarone', '2025-05-14', 'None'),
(18, 'General Surgery on 2025-06-25', 'Gallstones', 'None', '2025-06-25', 'None'),
(19, 'Neurosurgery on 2025-07-30', 'Brain Tumor', 'Temozolomide', '2025-07-30', 'None'),
(20, 'Pediatrics visit on 2025-08-12', 'Chickenpox', 'None', '2025-08-12', 'None');


SET IDENTITY_INSERT Departments ON;

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1, 'Cardiology'),
(2, 'Gastroenterology'),
(3, 'Oncology'),
(4, 'Pediatrics'),
(5, 'Neurology'),
(6, 'Orthopedics'),
(7, 'General Surgery'),
(8, 'Plastic Surgery'),
(9, 'Trauma Surgery'),
(10, 'Internal Medicine'),
(11, 'Endocrinology'),
(12, 'Dermatology'),
(13, 'Nephrology'),
(14, 'Pulmonology'),
(15, 'Psychiatry'),
(16, 'Urology'),
(17, 'Ophthalmology'),
(18, 'Rheumatology'),
(19, 'Obstetrics and Gynecology'),
(20, 'Otolaryngology');

SET IDENTITY_INSERT Departments OFF;


SELECT * FROM Patients
SELECT * FROM Doctors
SELECT * FROM Appointments
SELECT * FROM MedicalRecords
SELECT * FROM Departments 


-- Adding Constraint to Check Appointment Date Not in the Past
-- This constraint ensures appointments are only scheduled for the current or future dates.

ALTER TABLE Appointments
ADD CONSTRAINT chk_AppointmentDate CHECK (AppointmentDate >= CAST(GETDATE() AS DATE));

-- Query: Patients Older than 40 with Cancer Diagnosis

SELECT FullName, DateOfBirth, Diagnoses
FROM Patients P
JOIN MedicalRecords MR ON P.PatientID = MR.PatientID
WHERE Diagnoses LIKE '%Cancer%' AND DATEDIFF(YEAR, P.DateOfBirth, GETDATE()) > 40;

-- Query: Number of Completed Appointments by Gastroenterologists

SELECT COUNT(*) AS CompletedAppointments
FROM Appointments A
JOIN Doctors D ON A.DoctorID = D.DoctorID
WHERE D.Specialty = 'Gastroenterologists' AND A.Status = 'Completed';
