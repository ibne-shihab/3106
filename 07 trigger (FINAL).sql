USE master;
CREATE DATABASE Triger_Example;
USE Triger_Example;

-- To see all the table names within the database
SELECT table_name
FROM information_schema.tables
WHERE table_type = 'Base table';

DROP TABLE IF EXISTS backup_ins;
DROP TABLE IF EXISTS backup_del;
DROP TABLE IF EXISTS instructor;

CREATE TABLE instructor (
    ID INT,
    name NVARCHAR(50),
    dept_name NVARCHAR(50),
    salary INT
);

INSERT INTO instructor VALUES (1234, 'Doland Trump', 'ICE', 95000);
INSERT INTO instructor VALUES (12121, 'Vladimir Putin', 'CSE', 90000);
INSERT INTO instructor VALUES (32343, 'Kim-jon-un', 'EEE', 60000);
INSERT INTO instructor VALUES (45565, 'John Cina', 'CE', 75000);
INSERT INTO instructor VALUES (45995, 'Virat Kohli', 'CE', 75000);

SELECT * FROM instructor;

-- Create another table for inserted value keeping
CREATE TABLE backup_ins (
    ID INT,
    name NVARCHAR(50),
    dept_name NVARCHAR(50),
    salary INT
);

-- Create another table for deleted value keeping
CREATE TABLE backup_del (
    ID INT,
    name NVARCHAR(50),
    dept_name NVARCHAR(50),
    salary INT
);

-- Creating trigger for insert
CREATE TRIGGER ins_trigger
ON instructor
AFTER INSERT
AS
BEGIN
    INSERT INTO backup_ins SELECT ID, name, dept_name, salary FROM inserted;
    PRINT 'The trigger inserted successfully';
END;

INSERT INTO instructor VALUES (45862, 'Shihab', 'CE', 75000);
INSERT INTO instructor VALUES (58642, 'Ibne', 'EEE', 80000);
INSERT INTO instructor VALUES (89652, 'Shihab', 'ICE', 90000);

SELECT * FROM instructor;
SELECT * FROM backup_ins;

-- Delete trigger
CREATE TRIGGER del_trigger
ON instructor
AFTER DELETE
AS
BEGIN
    INSERT INTO backup_del SELECT ID, name, dept_name, salary FROM deleted;
END;

DELETE FROM instructor WHERE ID = 32343;

SELECT * FROM instructor;
SELECT * FROM backup_del;
