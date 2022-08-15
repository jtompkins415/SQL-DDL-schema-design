DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialization TEXT,
    years_working INT CHECK (years_working >= 1) DEFAULT 1
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    patient_name TEXT NOT NULL,
    insured_by TEXT
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL,
    curable BOOLEAN
);

CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors ON DELETE CASCADE,
    patient_id INT REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE patients_diseases (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients ON DELETE CASCADE,
    disease_id INT REFERENCES diseases ON DELETE CASCADE
);


-- DOCTORS 

INSERT INTO doctors (name, specialization, years_working)
VALUES
('Dan Vekna', 'Cardiac Surgeon', 8),
('Michelle Morel', 'Respitory Illness', 3),
('Clark Michaels', 'Pediatric Specialist', 15),
('Lisa Castel', 'Brainiac Surgeon', 35);

-- PATIENTS 

INSERT INTO patients (patient_name, insured_by)
VALUES
('Doug Mack', 'Blue Shield'),
('Kieth Roth', 'Kaiser Permanente'),
('Jules Noriega', 'Anthem'),
('Joey Citra', 'Cigna'),
('Noel Hightower', 'UnitedHealth');

-- DISEASES

INSERT INTO diseases (disease_name, curable)
VALUES
('Asthma', true),
('Athlete`s Foot', true),
('Brain Cancer', false),
('Chicken Pox', true),
('Arrhythmia', false);

-- DOCTOR_PATIENTS

INSERT INTO doctors_patients (doctor_id, patient_id)
VALUES
(1, 3),
(1, 2),
(3, 3),
(2, 4),
(4, 1);

-- PATIENTS_DISEASES

INSERT INTO patients_diseases (patient_id, disease_id)
VALUES
(1, 3),
(3, 3),
(4, 1),
(2, 3);

