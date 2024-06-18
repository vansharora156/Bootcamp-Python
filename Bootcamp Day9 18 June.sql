-- Create the database universitydb
CREATE DATABASE universitydb;

-- Use the universitydb database
USE universitydb;

-- Create a table called students with columns student_id, student_name, phone no., and enrollment_year
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
	phone_no VARCHAR(100),
    enrollment_year INT
);

-- Create a table called courses with columns course_id, course_name, and credits
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);

-- Create a table called faculty with columns faculty_id, faculty_name, and department
CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100),
    department VARCHAR(100)
);

-- Create a table called enrollments with columns enrollment_id, student_id, course_id, and grade
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert data into the students table
INSERT INTO students (student_id, student_name, phone_no , enrollment_year) VALUES 
(1, 'Ravi Yadav', 9874561230, 2022),
(2, 'Saryansh Kumar', 9874561231, 2023),
(3, 'Anjali Sharma', 9874561232, 2021),
(4, 'Priya Singh', 9874561233, 2020),
(5, 'Karan Mehta', 9874561234, 2022),
(6, 'Neha Patel', 9874561235, 2019),
(7, 'Amit Gupta', 9874561241, 2021),
(8, 'Sneha Desai', 9964723150, 2023),
(9, 'Rohit Verma', 7894561230, 2020),
(10, 'Simran Kaur',9563214800 , 2021);

-- Insert data into the courses table
INSERT INTO courses (course_id, course_name, credits) VALUES 
(101, 'Introduction to Programming', 4),
(102, 'Calculus I', 3),
(103, 'Microeconomics', 3),
(104, 'Physics I', 4),
(105, 'English Literature', 3);

-- Insert data into the faculty table
INSERT INTO faculty (faculty_id, faculty_name, department) VALUES 
(1, 'Sanjay Sharma', 'Engineering'),
(2, 'Vinay Jain', 'Business Administration'),
(3, 'Abdul Kalam', 'Science'),
(4, 'Vikram Sheikh', 'Arts'),
(5, 'Sheena Mehta', 'Commerce');

-- Insert data into the enrollments table
INSERT INTO enrollments (enrollment_id, student_id, course_id, grade) VALUES 
(1, 2, 101, 'A'),
(2, 3, 103, 'B'),
(3, 4, 104, 'A'),
(4, 5, 101, 'C'),
(5, 6, 105, 'B'),
(6, 7, 102, 'A'),
(7, 8, 103, 'C'),
(8, 9, 104, 'B'),
(9, 10, 105, 'A'),
(10, 2, 102, 'A');

-- Update the enrollment_year of the student with student_id = 1 to 2023
UPDATE students SET enrollment_year = 2023 WHERE student_id = 1;

-- Delete the record from the students table where student_id = 1
DELETE FROM students WHERE student_id = 1;

-- Retrieve all columns from the students table
SELECT * FROM students;

-- Select the student_name and phone_no of students enrolled after 2021 from the students table
SELECT student_name, phone_no FROM students WHERE enrollment_year > 2021;

-- Select the distinct phone_no from the students table
SELECT DISTINCT phone_no FROM students;

-- Retrieve all students from the students table and order them by enrollment_year in descending order
SELECT student_name, phone_no, enrollment_year FROM students ORDER BY enrollment_year DESC;

-- Count the number of students in the students table
SELECT COUNT(*) FROM students;

-- Retrieve the student_name and phone_no of students enrolled between 2020 and 2022 from the students table
SELECT student_name, phone_no FROM students WHERE enrollment_year BETWEEN 2020 AND 2022;

-- Retrieve the student_name and course_name of all students enrolled in 'Introduction to Programming'
SELECT s.student_name, c.course_name 
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Introduction to Programming';

-- Retrieve the student_name and course_name of all students who received a grade 'A'
SELECT s.student_name, c.course_name 
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade = 'A';


