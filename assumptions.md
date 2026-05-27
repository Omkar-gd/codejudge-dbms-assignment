# Assumptions
During the database design process, the following assumptions were made based on the raw CSV dataset.


# General Assumptions
- Each student has a unique student_id.
- Each course has a unique course_id.
- Each batch has a unique batch_id.
- Each problem has a unique problem_id.
- Each submission belongs to exactly one student.
- Each submission belongs to exactly one problem.


# Enrollment Assumptions
- A student can enroll in multiple courses.
- A course can contain multiple students.
- Duplicate enrollments are not allowed.


# Attendance Assumptions
- Attendance is recorded for each session.
- Attendance status contains only:
  - Present
  - Absent


# Problem Assumptions
Problem difficulty can only contain:
- Easy
- Medium
- Hard


# Submission Assumptions
- A student can submit multiple solutions.
- Multiple submissions are allowed for the same problem.
- Submission timestamps are stored properly.


# Test Result Assumptions
- Each submission can contain multiple test results.
- Test results are connected using submission_id.


# Data Cleaning Assumptions
Since raw CSV files may contain inconsistent data:
- duplicate records may exist
- NULL values may appear
- formatting inconsistencies may exist
These issues are assumed to be cleaned during preprocessing.


# Normalization Assumptions
The schema was designed approximately up to Third Normal Form (3NF) to reduce redundancy and improve consistency.
