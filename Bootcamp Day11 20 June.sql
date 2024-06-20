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

-- 	Subqueries:-
-- 1. List of merchants whom the loans are approved:-

select M.M_id,M.M_name,M.Shop_Name,M.Location,L.L_amount,L.Status
from Loans L
join Merchant M ON L.M_id = M.M_id
order by M.M_id;

-- 2. Transactions made by a specific merchant:-

select T.T_id,T.T_Amount,T.T_Date,T.Status,T.Mode
from Transactions T
join Merchant M ON T.M_id = M.M_id
where M.M_name = 'Rajesh Kumar';

-- 3. Total amount of transactions by mode and location:-

select T.Mode,M.Location, SUM(T.T_Amount) AS TotalAmount
from Transactions T
join Merchant M ON T.M_id = M.M_id
group by T.mode,M.Location
order by TotalAmount desc;

-- 4. Average transaction amount by merchant:-

select m.m_name,avg(T.T_amount) as AverageTransactionAmount
from Transactions T
join merchant M on T.M_id = M.M_id
group by M.M_name
order by AverageTransactionAmount desc;

-- 5. Merchants with no transactions:-

select M.M_id,M.M_name,M.shop_name,M.location
from merchant M
left join Transactions T on M.M_id = T.M_id
where T.T_id is null;

-- 6. Total loans issued each year:-

select year(issueDate) as Year, count(L_id) as TotalLoansIssued,sum(l_amount) as TotalLoanAmount
from loans
group by year(issueDate)
order by year;

-- 7. Details of failed transactions:- 
select T.T_id, T.T_Amount, T.T_Date, T.Mode, M.M_name, M.Shop_Name,M.Location
from transactions T 
join Merchant M ON T.M_id = M.M_id
where  T.Status = 'Failed'
order by T.T_Date DESC;

-- 8.Merchants using both QR codes and swipe machines:-

select M.M_id, M.M_name,M.Shop_Name, M.Location
from Merchant M
where exists (select 1 from QrCode Q where Q.M_id = M.M_id) 
    and exists (select 1 from SwipeMachine S where S.M_id = M.M_id);

-- 9. Total transaction amount per merchant:-

select  M.M_id, M.M_name, sum(T.T_Amount) as TotalTransactionAmount
from Transactions T
join Merchant M on T.M_id = M.M_id
group by M.M_id, M.M_name
order by TotalTransactionAmount desc;

-- 10.Number of transactions per month:- 

select year(T_Date) as year, month(T_Date) as month, count(T_id) as NumberOfTransactions
from Transactions
group by year(T_Date), month(T_Date)
order by year desc , month desc;

-- Advanced functions:-

-- 1. Using RANK to rank all transactions by amount:-
-- RANK() gives a 'rank' to each row within a partition, based on an ordered set. If rows have the same value, they get the same rank. 
-- However, the ranks will have gaps when there are ties.

select M.M_name, T.T_id, T.T_Amount, T.T_Date,
    RANK() OVER (ORDER BY T.T_Amount DESC) AS RankByAmount
from Transactions T
join  Merchant M ON T.M_id = M.M_id
order by M.M_name, RankByAmount;

-- 2. Using DENSE_RANK to rank all transactions by amount:-
-- DENSE_RANK() is similar to RANK(), but it does not create gaps when there are ties. 
-- Rows with the same value will get the same rank, but the next rank will be consecutive.

SELECT T.T_id, T.T_Amount,T.T_Date, M.M_name,
    DENSE_RANK() OVER (ORDER BY T.T_Amount DESC) AS DenseRankByAmount
FROM Transactions T
JOIN Merchant M ON T.M_id = M.M_id
ORDER BY DenseRankByAmount;

-- 3. Using ROW_NUMBER to assign a unique number to each transaction
-- ROW_NUMBER() assigns a unique row number to each record in a partitioned or ordered set. 
-- This always gives unique numbers, even if there are ties.

SELECT T.T_id, T.T_Amount, T.T_Date, M.M_name,
    ROW_NUMBER() OVER (ORDER BY T.T_Amount DESC) AS RowNumber
FROM Transactions T
JOIN Merchant M ON T.M_id = M.M_id
ORDER BY RowNumber;

-- 4. Using CUME_DIST to calculate the cumulative distribution of transaction amounts
--  It shows the relative position of a row within a data set, indicating what fraction of the data set is at or below a particular value.
-- The value is always between 0 and 1.
-- The values which will have be closer to 0 will have better score and thus will be identified as being in top percentages

SELECT T.T_id, T.T_Amount, T.T_Date, M.M_name,
    CUME_DIST() OVER (ORDER BY T.T_Amount DESC) AS CumulativeDistribution
FROM Transactions T
JOIN Merchant M ON T.M_id = M.M_id
ORDER BY CumulativeDistribution;

-- 5. Using LAG to find the previous transaction amount:-
-- The LAG() function provides access to a row at a specified physical offset prior to the current row within the partition.
-- It's often used to retrieve values from a previous row in the result set without using a self-join.
SELECT T.T_id, T.T_Amount, T.T_Date, M.M_name,
    LAG(T.T_Amount, 1) OVER (ORDER BY T.T_Date) AS PreviousTransactionAmount
FROM Transactions T
JOIN Merchant M ON T.M_id = M.M_id
ORDER BY T.T_Date;

-- 6. Using LEAD to find the next transaction amount
-- -- The LEAD() function provides access to a row at a specified physical offset after the current row within the partition.
-- It's useful for fetching values from subsequent rows in the result set without a self-join.
-- For instance, you could use LEAD() to get the value of the next row's amount.

SELECT T.T_id, T.T_Amount, T.T_Date, M.M_name, LEAD(T.T_Amount, 1) OVER (ORDER BY T.T_Date) AS NextTransactionAmount
FROM Transactions T
JOIN Merchant M ON T.M_id = M.M_id
ORDER BY T.T_Date;
