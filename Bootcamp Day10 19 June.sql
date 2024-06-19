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

-- Generate Loans with specified conditions
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



-- Count transactions per year
SELECT 
    YEAR(t_date) AS transaction_year,
    COUNT(*) AS total_transactions
FROM transactions
WHERE YEAR(t_date) BETWEEN 2020 AND 2024
GROUP BY YEAR(t_date)
ORDER BY transaction_year;
 
 -- No. of transactions done through UPI
SELECT 
    mode,
    COUNT(*) AS TransactionCount,
    SUM(t_amount) AS TotalAmount
FROM transactions
GROUP BY mode;

-- transactions on weekends
SELECT 
    m.location,
    SUM(t.t_amount) AS 'WeekendTotal'
FROM transactions t
JOIN merchant m ON t.m_id = m.m_id
WHERE DAYOFWEEK(t.t_date) IN (1,7) -- Assuming 1 is Sunday and 7 is Saturday
GROUP BY m.location;


-- transactions on monthly basis 
SELECT 
    MONTH(T_Date) AS Month,
    YEAR(T_Date) AS Year,
    M.Location,
    SUM(T_Amount) AS Total_Transaction_Amount
FROM 
    Transactions
JOIN 
    Merchant M ON Transactions.M_id = M.M_ID
GROUP BY 
    MONTH(T_Date), YEAR(T_Date), M.Location
ORDER BY 
    Year DESC, Month DESC, Total_Transaction_Amount DESC;


-- transactions on yearly basis
SELECT 
    YEAR(T_Date) AS Year,
    M.Location,
    SUM(T_Amount) AS Total_Transaction_Amount
FROM 
    Transactions
JOIN 
    Merchant M ON Transactions.M_id = M.M_ID
GROUP BY 
    YEAR(T_Date), M.Location
ORDER BY 
    Year DESC, Total_Transaction_Amount DESC;


-- Comparison of transactions year to year 
SELECT YEAR(t_date) AS Year, COUNT(*) AS TransactionCount
FROM transactions
WHERE t_date BETWEEN '2020-01-01' AND '2024-12-31'
GROUP BY YEAR(t_date)
ORDER BY Year;


-- completed or failed transactions from different loactions and in range 
SELECT 
    m.location,
    SUM(CASE WHEN t.t_amount BETWEEN 1000 AND 10000 THEN 1 ELSE 0 END) AS '1k_to_10k',
    SUM(CASE WHEN t.t_amount BETWEEN 51000 AND 100000 THEN 1 ELSE 0 END) AS '51k_to_1l',
    SUM(CASE WHEN t.t_amount > 300000 AND t.t_amount <= 1000000 THEN 1 ELSE 0 END) AS '3l_to_10l',
    SUM(CASE WHEN t.status = 'failed' THEN 1 ELSE 0 END) AS 'FailedTransactions',
    SUM(CASE WHEN t.status = 'completed' THEN 1 ELSE 0 END) AS 'CompletedTransactions',
    COUNT(t.t_id) AS 'TotalTransactions'
FROM 
    transactions t
JOIN 
    merchant m ON t.m_id = m.m_id
GROUP BY 
    m.location;

-- -- calculate number of merchants from different locations using qr code , swipe machine and both
SELECT
    M.Location,
    SUM(CASE WHEN T.Qr_id IS NOT NULL AND T.Sm_id IS NULL THEN 1 ELSE 0 END) AS Qr_Merchants,
    SUM(CASE WHEN T.Sm_id IS NOT NULL AND T.Qr_id IS NULL THEN 1 ELSE 0 END) AS Swipe_Machine_Merchants,
    SUM(CASE WHEN T.Qr_id IS NOT NULL AND T.Sm_id IS NOT NULL THEN 1 ELSE 0 END) AS Both_Merchants
FROM 
    Transactions T
JOIN 
    Merchant M ON T.M_id = M.M_id
GROUP BY 
    M.Location;


 -- calculate expected loan revenue from the cnsecutive years 2020 to 2024
 SELECT 
    YEAR(issueDate) AS Year,
    SUM(Expectedrevenue) AS Total_Expected_Revenue
FROM 
    loans
WHERE 
    YEAR(issueDate) BETWEEN 2020 AND 2024
GROUP BY 
    YEAR(issueDate)
ORDER BY 
    Year;


-- calculated number of loans approved or rejected
SELECT 
    M.M_id,
    M.M_Name AS Merchant_Name,
    COUNT(CASE WHEN L.Status = 'Approved' THEN 1 ELSE NULL END) AS Approved_Loans,
    COUNT(CASE WHEN L.Status = 'Rejected' THEN 1 ELSE NULL END) AS Rejected_Loans
FROM 
    Loans L
JOIN 
    Merchant M ON L.M_id = M.M_id
GROUP BY 
    M.M_id, M.M_Name
ORDER BY 
    M.M_id;
    
    
-- No. of merchants from different locations 
SELECT location, COUNT(*) as merchant_count
FROM merchant
GROUP BY location;



-- NORMALIZATION :-
-- 1.	1st Normal Form (1NF) :- No composite or multi-values attribute.
-- 2.	Second Normal Form (2NF):- It should be in 1NF and no partial dependency will be there.
-- 3.	Third Normal Form (3NF) :- It should be in 2NF and no transitive dependency will be there.



-- Merchant Table 							
-- M_ID	M_Name	 Pincode,City	    Phone	                  QR_id1	QR_Id2	QR_Date1	QR_Date2
-- M1	Vansh	  15896,Jaipur	    6598745989 ,98074010000  	Q1	      Q2	09-02-2024	11-07-2023
-- M2	Vanshika  73255,Jalandhar  6589098745 ,9888501000				
-- M2	Vanshika  73255,Jalandhar	6596788745				
-- M3	Reet	  144524,Delhi	    6598854745				

-- After 1NF -							
-- Merchant Table							
-- M_ID(primary key)	M_Name	city	  Pincode	phone1	     phone2	   QR_ID	 QR_Date
-- M1	                 Vansh	 Jaipur	   15896   9807401000	6598745989	Q1	   09-02-2024
-- M2	                Vanshika Jalandhar 73255	9888501000	6589098745	Q2	   11-07-2023
-- M3	                   Reet  Delhi	   144524	6598854745			


-- After 2 NF					
-- Merchant table										
-- M_ID(primary key)	M_Name	city	  Pincode	phone1	     phone2	   
-- M1	                 Vansh	 Jaipur	   15896   9807401000	6598745989
-- M2	                Vanshika Jalandhar 73255	9888501000	6589098745	
-- M3	                   Reet  Delhi	   144524	6598854745					

-- Qr table		
-- QR_ID	QR_Date	M_ID
-- Q1	09-02-2024	M1
-- Q2	11-07-2023	M2

-- After 3 NF
-- Merchant table										
-- M_ID(primary key)	M_Name	city	  Pincode	phone1	     phone2	   
-- M1	                 Vansh	 Jaipur	   15896   9807401000	6598745989
-- M2	                Vanshika Jalandhar 73255	9888501000	6589098745	
-- M3	                   Reet  Delhi	   144524	6598854745					

-- Qr table		
-- QR_ID	QR_Date	M_ID
-- Q1	09-02-2024	M1
-- Q2	11-07-2023	M2

		
-- City Table		
-- Pincode	City	   M_id
-- 15896	Jaipur	    M1
-- 73255	Jalandhar	M2
-- 144524	Lucknow	    M3






