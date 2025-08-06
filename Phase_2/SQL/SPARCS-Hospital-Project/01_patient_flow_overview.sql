-- Project Data: Phase 2 - SQL
-- SPARCS Hospital 2M Data Analysis
-- 01_patient_flow_overview.sql
-- This SQL script provides an overview of patient flow data from a CSV file.
-- This SQL script runs on Google Colab using DuckDB.

-- Total patients per hospital
SELECT "Facility Name", COUNT("Facility Name") AS "Patient Count"
FROM read_csv_auto('{csv_path}')
GROUP BY "Facility Name"
ORDER BY "Facility Name" ASC;

-- Average Length of Stay per hospital
SELECT "Facility Name", ROUND(AVG(CAST(REPLACE("Length of Stay", '+', '')AS DOUBLE)),2) AS "Avg. Patient Length of Stay"
FROM read_csv_auto('{csv_path}')
GROUP BY "Facility Name"
ORDER BY "Avg. Patient Length of Stay" DESC

--- Length of Stay of Specific "Facility Name"
SELECT "Facility Name", "Length of Stay"
FROM read_csv_auto('{csv_path}')
WHERE "Facility Name" = 'Henry J. Carter Specialty Hospital'

-- Most common diagnoses
SELECT "CCS Diagnosis Code", "CCS Diagnosis Description", COUNT("CCS Diagnosis Code") AS "Patient Count"
FROM read_csv_auto('{csv_path}')
GROUP BY "CCS Diagnosis Code", "CCS Diagnosis Description"
ORDER BY "Patient Count" DESC

--- Most common diagnoses - TOP 5
SELECT "CCS Diagnosis Code", "CCS Diagnosis Description", COUNT("CCS Diagnosis Code") AS "Patient Count"
FROM read_csv_auto('{csv_path}')
GROUP BY "CCS Diagnosis Code", "CCS Diagnosis Description"
ORDER BY "Patient Count" DESC
LIMIT 5

-- Distribution by age group and gender
SELECT "Age Group", COUNT("Age Group") AS "Patient Count"
FROM read_csv_auto('{csv_path}')
GROUP BY "Age Group"
ORDER BY "Age Group" ASC