Create DATABASE Portfoliopro
CREATE TABLE Books(
		book_id INT PRIMARY KEY,
		book_name NVARCHAR(50),
		book_category NVARCHAR(50),
		book_price FLOAT,
		book_stock INT,

)

INSERT INTO Books (book_id, book_name, book_category, book_price, book_stock)
VALUES 
    (1, 'To Kill a Mockingbird', 'Fiction', 12.99, 50),
    (2, 'A Tale of Two Cities', 'Fiction', 14.95, 30),
    (3, 'Pride and Prejudice', 'Fiction', 9.99, 45),
    (4, 'The Great Gatsby', 'Fiction', 11.99, 60),
    (5, 'Harry Potter and the Philosopher''s Stone', 'Fantasy', 19.99, 25),
    (6, 'Ugly Love', 'Fantasy', 10.99, 40),
    (7, 'The Catcher in the Rye', 'Fiction', 8.95, 55),
    (8, 'Lord of the Rings', 'Fantasy', 25.99, 20),
    (9, 'The Da Vinci Code', 'Fiction', 13.99, 71),
    (10, 'The Hunger Games', 'Science Fiction', 13.99, 35)

SELECT * FROM Books

CREATE TABLE Orders(
		order_id INT PRIMARY KEY,
		order_amount INT,
		order_date NVARCHAR(50),
		book_id INT,
		tracking_no INT
)
INSERT INTO Orders (order_id, order_amount, order_date,book_id,tracking_no)
VALUES 
    (1, 100, '2024-02-01',1,1),
    (2, 75, '2023-12-15',2,2),
    (3, 50, '2024-01-10',3,3),
    (4, 120, '2022-11-20',4,4),
    (5, 90, '2024-03-05',5,5),
    (6, 110, '2023-10-25',6,6),
    (7, 65, '2024-04-02',7,7),
    (8, 80, '2021-09-12',8,8),
    (9, 95, '2024-05-15',9,9),
    (10, 70, '2023-08-08',10,10)

SELECT * FROM Orders


CREATE TABLE Publisher(
		publisher_id INT PRIMARY KEY,
		publish_date NVARCHAR(50),
		publisher_name NVARCHAR(50),
		book_id INT
)
INSERT INTO Publisher (publisher_id, publish_date, publisher_name,book_id)
VALUES 
    (1, '1960-07-11', 'J.B.Lippincott',1),
    (2, '1859-11-26', 'Chapman & Hall',2),
    (3, '1813-01-28', 'T.Egerton, Whitehall',3),
    (4, '1925-04-10', 'Charles Scribner''s Sons',4),
    (5, '1997-06-26', 'Bloomsbury',5),
    (6, '2014-05-08', 'Atria Books',6),
    (7, '1951-07-16', 'Little,Brown',7),
    (8, '1954-07-29', 'Allen & Unwin',8),
    (9, '2003-03-18', 'Doubleday',9),
    (10, '2012-03-23', 'Scholastic',10)



CREATE TABLE Customers(
		customer_id INT PRIMARY KEY,
		customer_name NVARCHAR(50),
		customer_surname NVARCHAR(50),
		customer_email NVARCHAR(50),
		order_id INT
)
ALTER TABLE Customers
ADD FOREIGN KEY (order_id) REFERENCES Orders(order_id);
ALTER TABLE Orders
ADD FOREIGN KEY (book_id) REFERENCES Books(book_id);
ALTER TABLE Orders
ADD FOREIGN KEY (tracking_no) REFERENCES TrackingDetails(tracking_no);
ALTER TABLE Publisher
ADD FOREIGN KEY (book_id) REFERENCES Books(book_id);
ALTER TABLE Author
ADD FOREIGN KEY (book_id) REFERENCES Books(book_id);
ALTER TABLE BookOrderWebsite
ADD FOREIGN KEY (book_id) REFERENCES Books(book_id);

INSERT INTO Customers (customer_id, customer_name, customer_surname, customer_email,order_id)
VALUES 
    (1, 'John', 'Doe', 'john.doe@example.com',1),
    (2, 'Jane', 'Smith', 'jane.smith@example.com',2),
    (3, 'Michael', 'Johnson', 'michael.johnson@example.com',3),
    (4, 'Emily', 'Brown', 'emily.brown@example.com',4),
    (5, 'David', 'Williams', 'david.williams@example.com',5),
    (6, 'Jennifer', 'Jones', 'jennifer.jones@example.com',6),
    (7, 'William', 'Miller', 'william.miller@example.com',7),
    (8, 'Jessica', 'Davis', 'jessica.davis@example.com',8),
    (9, 'Daniel', 'Garcia', 'daniel.garcia@example.com',9),
    (10, 'Sarah', 'Martinez', 'sarah.martinez@example.com',10)

SELECT * FROM Customers

CREATE TABLE TrackingDetails(
		tracking_no INT PRIMARY KEY,
		carrier_name NVARCHAR(50),
		deliver_date NVARCHAR(50)
)

INSERT INTO TrackingDetails (tracking_no, carrier_name, deliver_date)
VALUES 
    (1, 'UPS', '2024-02-10'),
    (2, 'FedEx', '2023-06-12'),
    (3, 'USPS', '2022-10-18'),
    (4, 'DHL', '2023-08-20'),
    (5, 'UPS', '2024-01-25'),
    (6, 'FedEx', '2023-12-05'),
    (7, 'USPS', '2022-11-15'),
    (8, 'DHL', '2023-09-30'),
    (9, 'UPS', '2024-03-03'),
    (10, 'FedEx', '2023-04-08')

SELECT * FROM TrackingDetails

CREATE TABLE Author(
		author_id INT PRIMARY KEY,
		author_name NVARCHAR(50),
		author_surname NVARCHAR(50),
		date_of_birthday NVARCHAR(50),
		book_id INT
)

INSERT INTO Author(author_id, author_name, author_surname, date_of_birthday,book_id)
VALUES 
    (1, 'Harper', 'Lee', '1926-04-28',1),
    (2, 'Charles', 'Dickens', '1812-02-07',2),
    (3, 'Jane', 'Austen', '1775-12-16',3),
    (4, 'F. Scott', 'Fitzgerald', '1896-09-24',4),
    (5, 'J. K.', 'Rowling', '1965-07-31',5),
    (6, 'Colleen', 'Hoover', '1979-12-11',6),
    (7, 'J. D.', 'Salinger', '1919-01-01',7),
    (8, 'John Ronald Reuel', 'Tolkien', '1892-01-03',8),
    (9, 'Dan', 'Brown', '1964-06-22',9),
    (10, 'Suzanne', 'Collins', '1962-08-10',10)


CREATE TABLE BookOrderWebsite(
		website_id INT PRIMARY KEY,
		website_name NVARCHAR(50),
		website_url NVARCHAR(50),
		book_id INT,
		website_rating FLOAT
)
INSERT INTO BookOrderWebsite (website_id, website_name, website_url,book_id,website_rating)
VALUES 
    (1, 'Amazon', 'https://www.amazon.com',1,4.5),
    (2, 'Barnes & Noble', 'https://www.barnesandnoble.com',2,4.2),
    (3, 'Book Depository', 'https://www.bookdepository.com',3,4.8),
    (4, 'Books-A-Million', 'https://www.booksamillion.com',4,4),
    (5, 'IndieBound', 'https://www.indiebound.org',5,4.6),
    (6, 'ThriftBooks', 'https://www.thriftbooks.com',6,4.1),
    (7, 'Powell''s Books', 'https://www.powells.com',7,4.7),
    (8, 'AbeBooks', 'https://www.abebooks.com',8,4.3),
    (9, 'Bookshop', 'https://www.bookshop.org',9,4.9),
    (10, 'Alibris', 'https://www.alibris.com',10,4.4)

SELECT * FROM BookOrderWebsite

CREATE TABLE written_by (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
)
CREATE TABLE has(
    order_id INT,
    tracking_no INT,
    PRIMARY KEY (order_id, tracking_no),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (tracking_no) REFERENCES TrackingDetails(tracking_no)
)
CREATE TABLE contain (
    book_id INT,
    order_id INT,
    PRIMARY KEY (book_id, order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
)
CREATE TABLE make (
    order_id INT,
    customer_id INT,
    PRIMARY KEY (order_id, customer_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)
CREATE TABLE buy (
    book_id INT,
    customer_id INT,
    PRIMARY KEY (book_id, customer_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)
CREATE TABLE located (
    book_id INT,
    website_id INT,
    PRIMARY KEY (book_id, website_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (website_id) REFERENCES BookOrderWebsite(website_id)
)
CREATE TABLE [Print] (
    book_id INT,
    publisher_id INT,
    PRIMARY KEY (book_id, publisher_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
)
SELECT * FROM has
INSERT INTO written_by (book_id, author_id) VALUES
     (4, 4), (5, 5), 
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO has (order_id, tracking_no) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO contain (book_id, order_id) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);


INSERT INTO make (order_id, customer_id) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);


INSERT INTO buy (book_id, customer_id) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO located (book_id, website_id) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO [Print] (book_id, publisher_id) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);