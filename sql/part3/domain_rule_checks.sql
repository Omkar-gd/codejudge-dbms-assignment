-- PART 3 : DOMAIN RULE CHECKS


SELECT * 
FROM attendance
WHERE attendance_status NOT IN ('Present', 'Absent');

SELECT *
FROM problems
WHERE difficulty_level NOT IN ('Easy', 'Medium', 'Hard');


