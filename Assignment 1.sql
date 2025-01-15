CREATE DATABASE hrm;


CREATE TABLE company (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100),
    location VARCHAR(100),
    founded_date DATE,
    managing_director VARCHAR(100)
);


CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    number_of_employees INT,
    manager_id INT,
    employee_id INT,
    company_id INT,
    FOREIGN KEY (manager_id) REFERENCES Employee(id),
    FOREIGN KEY (employee_id) REFERENCES Employee(id),
    FOREIGN KEY (company_id) REFERENCES Company(id)
);


CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    joining_date DATE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    designation VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    job_title VARCHAR(100),
    
);


CREATE TABLE Address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    village_name VARCHAR(100),
    post_office VARCHAR(100),
    post_code VARCHAR(20),
    upazila VARCHAR(100),
    district VARCHAR(100),
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);


CREATE TABLE Phone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(15),
    code VARCHAR(5),
    employee_id INT,
    sim_operator VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);


CREATE TABLE JobPosition (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(100),
    employee_id INT,
    name_of_employee VARCHAR(100),
    name_of_department VARCHAR(100),
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);


CREATE TABLE Project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    number_of_employees INT,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15, 2),
    company_id INT,
    description TEXT,
    FOREIGN KEY (company_id) REFERENCES Company(id)
);


FOREIGN KEY (department_id) REFERENCES Department(department_id)