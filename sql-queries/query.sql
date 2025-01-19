CREATE DATABASE IF NOT EXISTS hospital_managment_system;
USE hospital_managment_system;

-- Table: Patient
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender CHAR(1),
    Address VARCHAR(255),
    ContactNumber VARCHAR(15),
    MedicalHistory TEXT
);

-- Table: Doctor
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Speciality VARCHAR(100),
    Email VARCHAR(100),
    ContactNumber VARCHAR(15)
);

-- Table: Prescription
CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    DateOfPrescription DATE,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Table: MedicalRecord
CREATE TABLE MedicalRecord (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    Diagnosis TEXT,
    TestResults TEXT,
    PrescriptionID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID)
);

-- Table: Appointment
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    Time TIME,
    Status VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Table: Department
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

-- Table: Admin
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Email VARCHAR(100),
    ContactNumber VARCHAR(15)
);

-- Table: Invoice
CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    Status VARCHAR(50),
    IssueDate DATE
);

-- Table: Nurse
CREATE TABLE Nurse (
    NurseID INT PRIMARY KEY,
    Name VARCHAR(100),
    Shift VARCHAR(50),
    ContactNumber VARCHAR(15)
);

-- Table: HospitalStaff
CREATE TABLE HospitalStaff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    ContactNumber VARCHAR(15),
    Salary DECIMAL(10, 2)
);

-- Table: Payment
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    Method VARCHAR(50),
    Date DATE
);
