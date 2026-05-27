# Normalization Notes

# Introduction
The raw CodeJudge dataset contained repeated data, dependencies, and multiple relationships between entities.
The database was normalized to improve:
- data consistency
- storage efficiency
- maintainability
The design is approximately normalized up to Third Normal Form (3NF).


# Examples of Redundant Data

## 1. Student Information Repetition
Student details such as:
- student_name
- email
- batch_name
could appear repeatedly in multiple CSV files.
Solution:
Student information was separated into the students table.

## 2. Course Information Repetition
Course details were repeated for multiple enrollments.
Solution:
Created a separate courses table.

## 3. Problem Information Repetition
Problem titles and difficulty levels appeared repeatedly in submissions.
Solution:
Problem details moved into the problems table.


# Examples of Dependency Problems
## Partial Dependency
In enrollments:
- student_id
- course_id
- course_name
course_name depends only on course_id.
Solution:
course_name moved to courses table.

## Functional Dependency
In students:
- student_id → student_name, email, batch_id
Student information depends entirely on student_id.

# First Normal Form (1NF)
The schema satisfies 1NF because:
- atomic values are used
- repeating groups are removed
- each row is unique

# Second Normal Form (2NF)
The schema satisfies 2NF because:
- partial dependencies were removed
- data was separated into related tables
Example:
Course details separated from enrollments.

# Third Normal Form (3NF)
The schema satisfies 3NF because:
- transitive dependencies were removed
- non-key columns depend only on primary keys
Example:
Batch details stored separately from students.

# Design Improvements
The normalized schema improves:
- data consistency
- scalability
- easier updates
- reduced redundancy

# Trade-Offs
Normalization increases:
- number of tables
- number of joins required in queries
However, it greatly improves database quality and integrity.
