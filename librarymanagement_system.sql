create database its_library;
use its_library;

CREATE TABLE Branch
(
  manager_id INT NOT NULL,
  branch_id INT NOT NULL,
  Address VARCHAR(255) NOT NULL,
  PRIMARY KEY (branch_id)
);

CREATE TABLE Customer
(
  customer_id INT NOT NULL,
  book_issued VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  reg_date VARCHAR(255) NOT NULL,
  branch_id INT NOT NULL,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

CREATE TABLE Authentication_system
(
  login_id INT NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (login_id)
);

CREATE TABLE Publisher
(
  publisher_id INT NOT NULL,
  category VARCHAR(255) NOT NULL,
  retail_price INT NOT NULL,
  publish_year INT NOT NULL,
  PRIMARY KEY (publisher_id)
);

CREATE TABLE Author
(
  title VARCHAR(255) NOT NULL,
  author_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (title)
);

CREATE TABLE Staff
(
  staff_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  salary INT NOT NULL,
  branch_id INT NOT NULL,
  login_id INT NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (staff_id),
  FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
  FOREIGN KEY (login_id) REFERENCES Authentication_system(login_id),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Book
(
  book_id INT NOT NULL,
  branch_id INT NOT NULL,
  publisher_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  PRIMARY KEY (book_id),
  FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
  FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id),
  FOREIGN KEY (title) REFERENCES Author(title)
);

CREATE TABLE updates
(
  login_id INT NOT NULL,
  book_id INT NOT NULL,
  PRIMARY KEY (login_id, book_id),
  FOREIGN KEY (login_id) REFERENCES Authentication_system(login_id),
  FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

CREATE TABLE Issue_Status
(
  issue_id INT NOT NULL,
  issue_date VARCHAR(255) NOT NULL,
  staus VARCHAR(255) NOT NULL,
  customer_id INT NOT NULL,
  book_id INT NOT NULL,
  PRIMARY KEY (issue_id),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (book_id) REFERENCES Book(book_id)
);


INSERT INTO book (book_id, branch_id, publisher_id, title) VALUES
(110, 275, 6669, "Duckly Inheritance"),
(111, 275, 6668, "The Lost Symbol"),
(112, 276, 6667, "To Kill a Mockingbird"),
(113, 269, 6666, "The Great Gatsby"),
(114, 269, 6669, "1984"),
(115, 269, 6669, "Pride and Prejudice"),
(116, 270,6668, "The Catcher in the Rye"),
(117, 270, 6665, "Animal Farm"),
(118, 270, 6664, "Brave New World"),
(119, 272, 6666, "Lord of the Flies"),
(120, 272, 6665, "The Alchemist"),
(121, 272, 6663, "The Hobbit"),
(122, 273, 6664, "The Kite Runner"),
(123, 273, 6669, "The Da Vinci Code"),
(124, 273, 6668, "Harry Potter and the Sorcerer's Stone");


INSERT INTO branch (manager_id, branch_id, address) VALUES
(1, 269, "BLOCK-20, F-SITE"),
(2, 270, "BLOCK-20, G-SITE"),
(3, 271, "BLOCK-21, H-SITE"),
(4, 272, "BLOCK-21, I-SITE"),
(5, 273, "BLOCK-23, J-SITE"),
(6, 274, "BLOCK-23, K-SITE"),
(7, 275, "BLOCK-24, L-SITE"),
(8, 276, "BLOCK-24, M-SITE"),
(9, 277, "BLOCK-25, N-SITE"),
(10, 278, "BLOCK-25, O-SITE");


INSERT INTO publisher (publisher_id, category, retail_price, publish_year) VALUES
(6660, "Science", 5000, 1996),
(6661, "Fiction", 4000, 2001),
(6662, "History", 5500, 2010),
(6663, "Biography", 6000, 1999),
(6664, "Fantasy", 4500, 2005),
(6665, "Mystery", 4800, 2008),
(6666, "Romance", 5200, 2015),
(6667, "Thriller", 5300, 2003),
(6668, "Adventure", 4700, 2006),
(6669, "Self-Help", 5100, 2018);


INSERT INTO author (title, author_name) VALUES
("Duckly Inheritance", "Nazi Hitler"),
("The Lost Symbol", "Dan Brown"),
("To Kill a Mockingbird", "Harper Lee"),
("The Great Gatsby", "F. Scott Fitzgerald"),
("1984", "George Orwell"),
("Pride and Prejudice", "Jane Austen"),
("The Catcher in the Rye", "J.D. Salinger"),
("Animal Farm", "George Orwell"),
("Brave New World", "Aldous Huxley"),
("Lord of the Flies", "William Golding"),
("The Alchemist", "Paulo Coelho"),
("The Hobbit", "J.R.R. Tolkien"),
("The Kite Runner", "Khaled Hosseini"),
("The Da Vinci Code", "Dan Brown"),
("Harry Potter and the Sorcerer's Stone", "J.K. Rowling");


INSERT INTO Issue_status (issue_id, issue_date, staus, customer_id, book_id) VALUES
(19, '2007-01-01', 'returned', 7, 111),
(20, '2007-02-01', 'borrowed', 8, 112),
(21, '2007-03-01', 'returned', 9, 113),
(22, '2007-04-01', 'borrowed', 10, 114),
(23, '2007-05-01', 'returned', 1, 115),
(24, '2007-06-01', 'borrowed', 2, 116),
(25, '2007-07-01', 'returned', 3, 117),
(26, '2007-08-01', 'borrowed', 4, 118),
(27, '2007-09-01', 'returned', 5, 119),
(28, '2007-10-01', 'borrowed', 6, 120);


INSERT INTO Authentication_system (login_id, password) VALUES
(1, 'password123'),
(2, 'securePassword'),
(3, '123456'),
(4, 'password!@#'),
(5, 'strongPassword123'),
(6, 'qwerty'),
(7, 'password1234'),
(8, 'P@ssw0rd'),
(9, 'admin123'),
(10, 'letmein');


INSERT INTO Staff (staff_id, name, salary, branch_id, login_id, customer_id) VALUES
(1, 'John Doe', 50000, 269, 1, 1),
(2, 'Jane Smith', 60000, 270, 2, 2),
(3, 'Michael Johnson', 55000, 269, 3, 3),
(4, 'Emily Williams', 52000, 271, 4, 4),
(5, 'David Brown', 48000, 270, 5, 5),
(6, 'Sarah Wilson', 53000, 272, 6, 6),
(7, 'Robert Jones', 51000, 271, 7, 7),
(8, 'Jessica Davis', 54000, 273, 8, 8),
(9, 'Matthew Miller', 49000, 272, 9, 9),
(10, 'Jennifer Taylor', 56000, 273, 10, 10);


INSERT INTO Customer (customer_id, book_issued, name, address, reg_date, branch_id) VALUES
(1, 'The Great Gatsby', 'Alice Johnson', '123 Main Street, Cityville', '2023-01-15', 269),
(2, 'To Kill a Mockingbird', 'Bob Smith', '456 Elm Street, Townsville', '2023-02-20', 270),
(3, '1984', 'Charlie Brown', '789 Oak Avenue, Villagetown', '2023-03-25', 269),
(4, 'Pride and Prejudice', 'Diana Williams', '101 Pine Road, Hamletville', '2023-04-30', 271),
(5, 'The Catcher in the Rye', 'Eleanor Davis', '202 Maple Lane, Boroughburg', '2023-05-05', 270),
(6, 'Animal Farm', 'Frank Johnson', '303 Cedar Street, Burgville', '2023-06-10', 272),
(7, 'Brave New World', 'Grace Taylor', '404 Birch Avenue, Townburg', '2023-07-15', 271),
(8, 'Lord of the Flies', 'Henry Miller', '505 Oak Street, Citytown', '2023-08-20', 273),
(9, 'The Alchemist', 'Isabella Wilson', '606 Pine Lane, Villaburg', '2023-09-25', 272),
(10, 'The Hobbit', 'Jack Brown', '707 Elm Road, Hamlettown', '2023-10-30', 273);

-- QUERIES
SELECT * 
FROM publisher 
WHERE publish_year 
IN (
SELECT publish_year 
FROM publisher 
WHERE retail_price > 500
);

SELECT book_issued,name,reg_date 
FROM customer 
GROUP BY customer_id 
HAVING customer_id >= ( 
SELECT MIN(customer_id) 
FROM customer 
WHERE customer_id> 4
);

SELECT * 
FROM publisher 
WHERE publish_year IN (
SELECT publish_year 
FROM publisher 
WHERE publish_year BETWEEN 1990 AND 2010
);

SELECT * 
FROM publisher 
WHERE publish_year 
IN (
SELECT publish_year 
FROM publisher 
WHERE publish_year > 2000
);

SELECT * 
FROM updates 
WHERE login_id 
IN (
SELECT login_id 
FROM updates 
WHERE login_id > 2
);

SELECT * 
FROM branch 
WHERE branch_id 
IN (
SELECT branch_id 
FROM branch 
WHERE branch_id=265
);
-- AGGREGATE
SELECT AVG(retail_price),MAX(retail_price),MIN(retail_price),MAX(retail_price) 
FROM publisher;

SELECT COUNT(DISTINCT branch_id) 
FROM book;

SELECT login_id,AVG(Password/2) 
FROM authentication_system 
GROUP BY login_id;

SELECT book_issued,name,reg_date 
FROM customer 
GROUP BY customer_id,branch_id;

SELECT book_issued,name,reg_date 
FROM customer 
GROUP BY customer_id,branch_id 
HAVING MAX(customer_id)>5;
-- join
SELECT staff.name,staff.login_id,authentication_system.password 
FROM staff 
INNER JOIN authentication_system 
ON staff.login_id = authentication_system.login_id;

SELECT staff.name,authentication_system.password 
FROM staff 
LEFT JOIN authentication_system 
ON staff.login_id = authentication_system.login_id;

SELECT book.title,book.publisher_id,issue_status.staus 
FROM book 
RIGHT JOIN issue_status 
ON book.book_id = issue_status.book_id;

SELECT * 
FROM branch 
CROSS JOIN staff;

-- VIEW
CREATE VIEW new_Staff_264 
AS 
SELECT book_issued,name,address,reg_date 
FROM customer 
WHERE branch_id=264;

CREATE VIEW Staff_view 
AS 
SELECT name,book_issued,address 
FROM customer;

CREATE VIEW Books_information_Customers
AS
SELECT a.author_name,a.title,b.branch_id,b.publisher_id
FROM author a,book b
WHERE a.title = b.title;

CREATE VIEW branch_employees_overview 
AS 
SELECT s.name,s.login_id,s.branch_id,b.Address 
FROM branch b,staff s 
WHERE b.branch_id = s.branch_id;

DELIMITER //

CREATE TRIGGER log_new_book
AFTER INSERT ON Book
FOR EACH ROW
BEGIN
    INSERT INTO Book_Log (book_id, branch_id, publisher_id, title, log_date)
    VALUES (NEW.book_id, NEW.branch_id, NEW.publisher_id, NEW.title, NOW());
END;
//

DELIMITER ;

-- JOIN QUERY
SELECT issue_date, c.name
FROM Issue_Status i
JOIN Customer c ON i.customer_id = c.customer_id;

SELECT i.issue_date, c.name
FROM Issue_Status i
JOIN Customer c ON i.customer_id = c.customer_id
JOIN Book b ON i.book_id = b.book_id
WHERE b.title = 'The Kite Runner';

SELECT i.issue_date, c.name
FROM Issue_Status i
JOIN Customer c ON i.customer_id = c.customer_id
JOIN Book b ON i.book_id = b.book_id
WHERE b.title = 'To Kill a Mockingbird';



