create database BharatPedb;
use Bharatpedb;
Create table Merchant(
M_id int Primary key,
M_name varchar(30) not null,
Shop_Name varchar(30) not null,
Location varchar(30),
Email varchar(50) unique not null ,
Phone1 varchar(30) unique not null,
Phone2 varchar(30) unique);

create table Transactions(
T_id int primary key,
T_Amount int not null,
T_Date date not null,
Status varchar(30) check(Status in("Completed","Failed")),
Mode varchar(30) ,
M_id int references  Merchant(M_id) on delete cascade on update cascade,
Qr_id int references  QrCode(Qr_id)  on delete cascade on update cascade,
Sm_id int references  SwipeMachine(Sm_id) on delete cascade on update cascade);

create table QrCode(
Qr_id int Primary key,
Qr_Date date not null,
M_id int references Merchant(M_id) on delete cascade on update cascade);


create table SwipeMachine(
Sm_id int Primary key,
Sm_Date date not null,
M_id int references Merchant(M_id) on delete cascade on update cascade);

-- Inserting records into Merchant table
INSERT INTO Merchant (M_id, M_name, Shop_Name, Location, Email, Phone1, Phone2) VALUES
(1, 'Rajesh Kumar', 'Kumar Mart', 'Amritsar', 'rajesh.kumar@example.com', '1234567899', '0987654320'),
(2, 'Laxmi Patel', 'Patel Emporium', 'Jodhpur', 'laxmi.patel2@example.com', '2345678909', '9876543200'),
(3, 'Ravi Sharma', 'Sharma Traders', 'Srinagar', 'ravi.sharma3@example.com', '3456789019', '8765432100'),
(4, 'Preeti Gupta', 'Gupta Stores', 'Jaipur', 'preeti.gupta4@example.com', '4567890129', '7654321090'),
(5, 'Sunil Yadav', 'Yadav Shop', 'Jalandhar', 'sunil.yadav5@example.com', '5678901239', '6543210980'),
(6, 'Meera Desai', 'Desai Boutique', 'Rajasthan', 'meera.desai6@example.com', '6789012349', '5432109870'),
(7, 'Arjun Bansal', 'Bansal Market', 'Moga', 'arjun.bansal7@example.com', '7890123459', '4321098760'),
(8, 'Aarti Singh', 'Singh Shoppe', 'Ludhiana', 'aarti.singh8@example.com', '8901234569', '3210987650'),
(9, 'Suresh Joshi', 'Joshi Enterprises', 'Delhi', 'suresh.joshi9@example.com', '9012345679', '2109876540'),
(10, 'Rekha Verma', 'Verma Store', 'Nakodar', 'rekha.verma10@example.com', '0123456789', '1098765430');

INSERT INTO QrCode (Qr_id, Qr_Date, M_id)
VALUES
    (101, '2019-04-15', 1),
    (102, '2021-09-20', 3),
    (103, '2023-12-25', 7),
    (104, '2022-06-30', 5),
    (105, '2021-02-05', 9),
    (106, '2023-03-10', 4),
    (107, '2021-11-15', 6),
    (108, '2022-09-25', 2),
    (109, '2023-05-01', 10),
    (110, '2022-03-20', 8);

 
INSERT INTO SwipeMachine (Sm_id, Sm_Date, M_id) VALUES
(201, '2020-01-01', 2),
(202, '2020-01-05', 8),
(203, '2020-01-10', 4),
(204, '2020-01-15', 7),
(205, '2020-01-20', 5),
(206, '2020-01-25', 6),
(207, '2020-01-30', 9),
(208, '2020-02-04', 3),
(209, '2020-02-09', 1),
(210, '2020-02-14', 10);


INSERT INTO Transactions (T_id, T_Amount, T_Date, Status, Mode, M_id, Qr_id, Sm_id) VALUES
(1001, 50000, '2023-04-01', 'Completed', 'UPI', 1, 101, NULL),
(1002, 55000, '2023-03-20', 'Completed', 'UPI', 2, NULL,201),
(1003, 60000, '2023-02-15', 'Completed', 'UPI', 4, 106, NULL),
(1004, 70000, '2023-01-10', 'Failed', 'UPI', 5,  NULL, 205),
(1005, 45000, '2022-12-05', 'Completed', 'UPI', 1, 101, NULL),
(1017, 48000, '2021-12-05', 'Completed', 'UPI', 3, 102, NULL),
(1018, 45000, '2021-11-01', 'Completed', 'UPI', 6,  NULL,206),
(1019, 49000, '2021-10-15', 'Completed', 'UPI', 7, 103, NULL),
(1020, 46000, '2021-09-10', 'Failed', 'UPI', 8, NULL,202),
(1021, 50000, '2021-09-05', 'Completed', 'UPI', 9, 105, NULL),
(1022, 47000, '2021-09-01', 'Completed', 'UPI', 10, NULL,210),
(1023, 52000, '2021-09-15', 'Completed', 'UPI', 5, NULL,205);

create table Loans(
   L_id int primary key,
   L_amount int not null,
   Interest_rate int not null,
   Timeperiod int not null,
   Status varchar(30) check(status in("Approved","Rejected")),
   issueDate Date not null,
   Expectedrevenue int generated always as((L_Amount* Interest_rate*Timeperiod)/100)stored,
   M_id int references merchant(M_id) on delete cascade on update cascade,
   A_id int references admin(A_id) on update cascade on delete cascade);


INSERT INTO Loans (L_id, L_amount, Interest_rate, Timeperiod, Status, issueDate, M_id, A_id)
VALUES
    (301, 80000, 8, 3, 'Approved', '2021-01-01', 5, 500),
    (302, 100000, 8, 4, 'Approved', '2022-01-02',  2 , 500),
    (303, 300000, 9, 5, 'Approved', '2022-01-03',  3, 500),
    (304, 500000, 9, 3, 'Approved', '2021-01-04', 6, 500),
    (305, 1500000, 12, 4, 'Approved', '2021-01-05',  4, 500),
    (306, 2000000, 12, 5, 'Approved', '2023-01-06', 2, 500),
    (307, 80000, 8, 3, 'Approved', '2024-01-07',  9, 500),
    (308, 100000, 8, 5, 'Approved', '2024-01-08',  10, 500),
    (309, 300000, 9, 4, 'Approved', '2024-01-09',  8, 500),
    (310, 500000, 9, 3, 'Approved', '2021-01-10', 1, 500);
    
-- The DELIMITER command in SQL is used to change the default delimiter (usually a semicolon ;) to another character or string.

-- 1. Write a query to create a function that calculates the total revenue from the Transactions table for completed orders and call the function to get the total revenue.

DELIMITER //
CREATE FUNCTION get_total_revenue()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_revenue INT; 
    SELECT SUM(T_Amount) INTO total_revenue
    FROM Transactions
    WHERE Status = 'Completed';
    RETURN total_revenue; 
END//
DELIMITER ;
SELECT get_total_revenue();

-- 2. Write a query to create a procedure with an IN parameter to retrieve details of a specific merchant based on the merchant ID passed as a parameter. Call the procedure for merchant ID 1.

DELIMITER //
CREATE PROCEDURE get_merchant_details(IN merchant_id INT)
BEGIN
    SELECT * FROM Merchant WHERE M_id = merchant_id;
END//
DELIMITER ;
CALL get_merchant_details(1);

-- 3. Write a query to create a procedure with an OUT parameter to get the count of merchants in the Merchant table, store it in a variable, and select the variable to display the count.

DELIMITER //
CREATE PROCEDURE get_merchant_count(OUT total_count INT)
BEGIN
    SELECT COUNT(*) INTO total_count FROM Merchant;
END//
DELIMITER ;
CALL get_merchant_count(@count);
SELECT @count AS total_merchants;

-- 4. Write a query to use the predefined SUM() cursor to calculate the total amount of all completed transactions in the Transactions table.

DELIMITER //
CREATE PROCEDURE calc_total_completed_transactions(OUT total_amount INT)
BEGIN
    SELECT SUM(T_Amount) INTO total_amount
    FROM Transactions
    WHERE Status = 'Completed';
END//
DELIMITER ;
CALL calc_total_completed_transactions(@total);
SELECT @total AS total_completed_transactions;

-- 5. Write a query to declare and use a cursor to iterate through the Merchant table and print the merchant name for each merchant.

DELIMITER //
CREATE PROCEDURE print_merchant_names()
BEGIN
    DECLARE merchant_name VARCHAR(100);
    DECLARE done INT DEFAULT FALSE;
    DECLARE merchant_cursor CURSOR FOR SELECT M_name FROM Merchant;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN merchant_cursor;

    get_names: LOOP
        FETCH merchant_cursor INTO merchant_name;
        IF done THEN
            LEAVE get_names;
        END IF;
        SELECT merchant_name;
    END LOOP get_names;

    CLOSE merchant_cursor;
END//
DELIMITER ;
CALL print_merchant_names();

-- 6. Write a query to create a procedure with IN and OUT parameters to update the status of a transaction and return the number of affected rows. Call the procedure to update the status for a transaction ID.

DELIMITER //
CREATE PROCEDURE update_transaction_status(IN trans_id INT, IN new_status VARCHAR(20), OUT affected_rows INT)
BEGIN
    UPDATE Transactions
    SET Status = new_status
    WHERE T_id = trans_id;
    SELECT ROW_COUNT() INTO affected_rows;
END//
DELIMITER ;
CALL update_transaction_status(1, 'Pending', @affected_rows);
SELECT @affected_rows AS affected_rows;

-- 7. Write a query to create a function that calculates the average transaction amount for a specific merchant. Call the function for a merchant ID.

DELIMITER //
CREATE FUNCTION get_avg_transaction_amount(merchant_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_amount DECIMAL(10,2);
    SELECT AVG(T_Amount) INTO avg_amount
    FROM Transactions
    WHERE M_id = merchant_id;
    RETURN avg_amount;
END//
DELIMITER ;
SELECT get_avg_transaction_amount(1);

