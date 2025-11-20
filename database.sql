    SELECT * FROM user WHERE email = 'alex@gmail.com';
    SELECT email, pass FROM user WHERE email = 'alex@gmail.com' AND pass = '1234';
    SELECT * FROM Products WHERE Price <> 100;
    SELECT * FROM Orders WHERE Quantity > 5;
    SELECT * FROM Employees WHERE Salary < 50000;
    SELECT * FROM Sales WHERE OrderDate BETWEEN '2025-01-01' AND '2025-12-31';
    SELECT * FROM Customers WHERE City IN ('London', 'Paris', 'Berlin');

-- Inserting into specific columns
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department)
VALUES (101, 'Alice', 'Smith', 'Marketing');

-- Inserting into all columns (assuming default order matches the above)
INSERT INTO Employees
VALUES (102, 'Bob', 'Johnson', 'Sales');

-- INSERT INTO users (id, names, email, phone_no, passwords, created_date)
-- VALUES (NULL, 'Bob', 'Johnson@gmail.com', '32098765', '12345', NOW());

INSERT INTO `users`(`id`, `names`, `email`, `phone_no`, `passwords`, `created_date`) 
VALUES (NULL, 'Bob', 'Johnson@gmail.com', '32098765', '12345', NOW());

INSERT INTO `users`(`id`, `names`, `email`, `phone_no`, `passwords`, `created_date`) 
VALUES (NULL, 'Bob', 'Johnson@gmail.com', '32098765', '12345', NOW());


CREATE TABLE users (
    id INT PRIMARY KEY,
    names VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_no BIGINT,
    passwords VARCHAR(50),
    created_date DATE DEFAULT CURRENT_DATE
);

CREATE DATABASE foodie;



CREATE TABLE registerUsers (
        user_id INT PRIMARY KEY,
        username VARCHAR(50)
    );

    CREATE TABLE UserProfiles (
        profile_id INT PRIMARY KEY,
        user_id INT UNIQUE, -- Ensures one-to-one
        bio TEXT,
        FOREIGN KEY (user_id) REFERENCES registerUsers(user_id)
    );


CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);


SELECT
    A.author_name,
    B.title
FROM
    Authors AS A
INNER JOIN
    Books AS B ON A.author_id = B.author_id;


SELECT 
    Authors.author_id,
    Authors.author_name,
    Books.book_id,
    Books.title
FROM Authors
LEFT JOIN Books
    ON Authors.author_id = Books.author_id;


SELECT
    Authors.author_id,
    Authors.author_name,
    Books.book_id,
    Books.title
FROM Authors
RIGHT JOIN Books
    ON Authors.author_id = Books.author_id;


SELECT
    Authors.author_id,
    Authors.author_name,
    Books.book_id,
    Books.title
FROM Authors
FULL OUTER JOIN Books
    ON Authors.author_id = Books.author_id;


-- If you're using MySQL (NO FULL JOIN support)

-- You must emulate it using a UNION:

SELECT
    Authors.author_id,
    Authors.author_name,
    Books.book_id,
    Books.title
FROM Authors
LEFT JOIN Books
    ON Authors.author_id = Books.author_id

UNION

SELECT
    Authors.author_id,
    Authors.author_name,
    Books.book_id,
    Books.title
FROM Authors
RIGHT JOIN Books
    ON Authors.author_id = Books.author_id;


