-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(_TableName_);

-- Report 1 - my solution
SELECT
    COUNT(b.BookID) AS Qty,
    --b.Title,
    b.Published
FROM 
    Books b
GROUP BY
    b.Published
ORDER BY
    Qty DESC,
    b.Title ASC,
    b.Published DESC
;

-- report 2 - my solution 
SELECT
    Count(l.LoanID) AS LoanQty,
    --RANK() OVER (ORDER BY Count(l.loanID) DESC) AS Rank,
    DENSE_RANK() OVER (ORDER BY Count(l.loanID) DESC) AS Rank,
    b.Title,
    b.BookID
FROM
    Loans AS l 
    JOIN Books b ON b.BookID = l.BookID
GROUP BY
    b.Title
ORDER BY
    Rank,
    b.Title
    --LoanQty DESC
;

SELECT * FROM Loans WHERE BookID = 112;
SELECT * FROM Books WHERE Title ='The War of the Worlds';

-- contribute from xoqx
-- April 8th 
