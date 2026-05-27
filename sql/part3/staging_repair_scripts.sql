-- PART 3 : STAGING REPAIR SCRIPTS


-- Remove duplicate student emails safely
BEGIN TRANSACTION;
DELETE FROM students
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM students
    GROUP BY email
);
ROLLBACK;

-- Remove duplicate batch names safely
BEGIN TRANSACTION;
DELETE FROM batches
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM batches
    GROUP BY batch_name
);
ROLLBACK;

-- Remove submissions with invalid student references
BEGIN TRANSACTION;
DELETE FROM submissions
WHERE student_id NOT IN (
    SELECT student_id FROM students
);
ROLLBACK;

-- Fix invalid attendance status values
BEGIN TRANSACTION;
UPDATE attendance
SET attendance_status = 'Absent'
WHERE attendance_status NOT IN ('Present', 'Absent');
ROLLBACK;

-- Fix invalid problem difficulty values
BEGIN TRANSACTION;
UPDATE problems
SET difficulty_level = 'Medium'
WHERE difficulty_level NOT IN ('Easy', 'Medium', 'Hard');
ROLLBACK;