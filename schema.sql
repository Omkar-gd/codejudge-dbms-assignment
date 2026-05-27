CREATE TABLE batches (
    batch_id INTEGER PRIMARY KEY,
    batch_name TEXT NOT NULL UNIQUE
);

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    student_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    batch_id INTEGER NOT NULL,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL UNIQUE
);

CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    UNIQUE(student_id, course_id)
);

CREATE TABLE problems (
    problem_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    difficulty TEXT NOT NULL,
    CHECK (difficulty IN ('Easy', 'Medium', 'Hard'))
);

CREATE TABLE submissions (
    submission_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    problem_id INTEGER NOT NULL,
    submitted_at TEXT NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

CREATE TABLE test_results (
    result_id INTEGER PRIMARY KEY,
    submission_id INTEGER NOT NULL,
    passed INTEGER NOT NULL,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id)
);

CREATE TABLE sessions (
    session_id INTEGER PRIMARY KEY,
    session_date TEXT NOT NULL,
    batch_id INTEGER NOT NULL,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
);

CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    attendance_status TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (session_id) REFERENCES sessions(session_id),
    CHECK (attendance_status IN ('Present', 'Absent'))
);
