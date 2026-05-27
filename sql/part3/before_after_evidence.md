# PART 3 : Before and After Evidence

# Duplicate Email Check
## Before Repair
```sql
SELECT email, COUNT(*) AS duplicate_count
FROM students
GROUP BY email
HAVING COUNT(*) > 1;
```
This query identifies duplicate student emails.

## Repair Script Used
```sql
BEGIN TRANSACTION;

DELETE FROM students
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM students
    GROUP BY email
);
ROLLBACK;
```

## After Repair
```sql
SELECT email, COUNT(*) AS duplicate_count
FROM students
GROUP BY email
HAVING COUNT(*) > 1;
```
Expected Result:
- No duplicate rows returned.


# Invalid Student Reference Check
## Before Repair
```sql
SELECT *
FROM submissions
WHERE student_id NOT IN (
    SELECT student_id FROM students
);
```
This query identifies invalid foreign key references.

## Repair Script Used
```sql
BEGIN TRANSACTION;
DELETE FROM submissions
WHERE student_id NOT IN (
    SELECT student_id FROM students
);
ROLLBACK;
```

## After Repair
```sql
SELECT *
FROM submissions
WHERE student_id NOT IN (
    SELECT student_id FROM students
);
```
Expected Result:
- No invalid submission rows returned.


# Invalid Attendance Status Check
## Before Repair
```sql
SELECT *
FROM attendance
WHERE attendance_status NOT IN ('Present', 'Absent');
```

## Repair Script Used
```sql
BEGIN TRANSACTION;
UPDATE attendance
SET attendance_status = 'Absent'
WHERE attendance_status NOT IN ('Present', 'Absent');
ROLLBACK;
```

## After Repair
```sql
SELECT *
FROM attendance
WHERE attendance_status NOT IN ('Present', 'Absent');
```
Expected Result:
- Only valid attendance status values remain.