# PART 3 : Repair Plan

## Objective
The goal of this repair plan is to identify and safely correct data quality and integrity issues found in the raw dataset.

# Types of Issues Checked
## Duplicate Records
Duplicate emails or batch names can create inconsistency.
Examples checked:
- duplicate student emails
- duplicate batch names

## Invalid Foreign Keys
Some records may reference IDs that do not exist.
Examples:
- submissions referencing missing students
- enrollments referencing missing courses

## Invalid Domain Values
Certain columns should contain only predefined values.
Examples:
- attendance_status should contain only:
  - Present
  - Absent
- difficulty_level should contain only:
  - Easy
  - Medium
  - Hard

# Repair Strategy
## Step 1
Identify invalid records using SQL audit queries.
## Step 2
Store problematic records separately for review.
## Step 3
Use transactions before performing updates or deletes.
## Step 4
Validate repaired data again after corrections.

# Safety Measures
- Backups should be maintained before repairs.
- Repair operations should use transactions.
- Rollback should be used if errors occur.

# Expected Result
After repair:
- duplicate data is minimized
- invalid references are removed
- domain values become consistent
- overall database quality improves