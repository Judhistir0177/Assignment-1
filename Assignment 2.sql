CREATE DATABASE ums;


CREATE TABLE Department (
    Department_id INT AUTO_INCREMENT PRIMARY KEY,
    Department_name VARCHAR(100),
	Head_of_department INT,
);
FOREIGN KEY (Head_of_department) REFERENCES Faculty(Faculty_id)

CREATE TABLE Faculty (
    Faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone_number VARCHAR(15),
    Department_id INT,
    Joining_date DATE,
    FOREIGN KEY (Department_id) REFERENCES Department(Department_id)
);



CREATE TABLE Student (
    Student_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Date_of_birth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Phone_number VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Department_id INT,
    Enrollment_date DATE,
    FOREIGN KEY (Department_id) REFERENCES Department(Department_id)
);



CREATE TABLE Course (
    Course_id INT AUTO_INCREMENT PRIMARY KEY,
    Course_name VARCHAR(100),
    Credits INT,
    Department_id INT,
    Course_description TEXT,
    FOREIGN KEY (Department_id) REFERENCES Department(Department_id)
);



CREATE TABLE Class (
    Class_id INT AUTO_INCREMENT PRIMARY KEY,
    Faculty_id INT,
    Course_id INT,
    Semester VARCHAR(20),
    Year INT,
	FOREIGN KEY (Faculty_id) REFERENCES Faculty(Faculty_id),
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
);


CREATE TABLE Enrollment (
    Enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    Student_id INT,
    Class_id INT,
    Grade CHAR(2),
    Enrollment_date DATE,
    FOREIGN KEY (Student_id) REFERENCES Student(Student_id),
    FOREIGN KEY (Class_id) REFERENCES Class(Class_id)
);