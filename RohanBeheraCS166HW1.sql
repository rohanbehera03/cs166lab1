DROP TABLE IF EXISTS Airplane, Model, Employee, Technician, Traffic_Controller, Test, Exam, Can_Take, Testing_Event

CREATE TABLE Airplane (
	registration_num INT NOT NULL,
	companyName CHAR(50),
	PRIMARY KEY(register_num)
);

CREATE TABLE Model (
	modelNum CHAR(20) NOT NULL,
	capacity INT,
	weight DECIMAL,
	fuelType CHAR(20)
	PRIMARY KEY(modelNum)
);

CREATE TABLE Employee (
	ssn CHAR(11) NOT NULL,
	unionMemNum INT,
	PRIMARY KEY(ssn)
);

CREATE TABLE Technician (
	ssn CHAR(11) NOT NULL,
	unionMemNum INT,
	phone_num CHAR(15) NOT NULL,
	address CHAR(50),
	last_name CHAR(50),
	salary MONEY,
	PRIMARY KEY(ssn, phone_num)
	FOREIGN KEY(ssn) REFERENCES Employee,
	FOREIGN KEY(unionMemNum) REFERENCES Employee
);

CREATE TABLE Traffic_Controller (
	ssn CHAR(11) NOT NULL,
	unionMemNum INT,
	yearsExperience INT,
	age INT NOT NULL,
	PRIMARY KEY(ssn, age),
	FOREIGN KEY(ssn) REFERENCES Employee,
	FOREIGN KEY(unionMemNum) REFERENCES Employee
);

CREATE TABLE Test (
	FAA_Num INT NOT NULL,
	name CHAR(50),
	MaxScore INT,
	PRIMARY KEY(FAA_Num)
);

CREATE TABLE Exam (
	exam_date DATE NOT NULL,
	duration TIME,
	level CHAR,
	PRIMARY KEY(exam_date)
);

CREATE TABLE Can_Take (
	exam_date DATE NOT NULL,
	ssn CHAR(11) NOT NULL,
	age INT NOT NULL,
	PRIMARY KEY(exam_date, ssn, age),
	FOREIGN KEY(ssn) REFERENCES Employee,
	FOREIGN KEY(unionMemNum) REFERENCES Employee
);

CREATE TABLE Testing_Event (
	testing_date DATE NOT NULL,
	numHours INT,
	score INT,
	FAA_Num INT NOT NULL,
	registration_num INT NOT NULL,
	PRIMARY KEY(testing_date, FAA_Num, registration_num),
	FOREIGN KEY(FAA_Num) REFERENCES Test,
	FOREIGN KEY(registration_num) REFERENCES Airplane
);

