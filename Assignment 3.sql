CREATE DATABASE cic;



CREATE TABLE Customer (
    Customer_id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone_number VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);


CREATE TABLE Car (
    Car_ID INT AUTO_INCREMENT PRIMARY KEY,
    License_Plate VARCHAR(20),
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(Customer_id)
);


CREATE TABLE Accident (
    Accident_ID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    Location VARCHAR(255),
    Description TEXT,
    Car_ID INT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID)
);



CREATE TABLE Insurance_Policy (
    Policy_ID INT AUTO_INCREMENT PRIMARY KEY,
    Policy_Number VARCHAR(50),
    Coverage_Details TEXT,
    CustomerID INT,
	FOREIGN KEY (CustomerID) REFERENCES Customer(Customer_id)
);


CREATE TABLE Payment (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    Period VARCHAR(50),
    Due_Date DATE,
    Payment_Date DATE,
    Policy_ID INT,
    FOREIGN KEY (Policy_ID) REFERENCES Insurance_Policy(Policy_ID)
);