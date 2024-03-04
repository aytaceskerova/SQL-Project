
--1.Select top 5 Bestselling Books
SELECT 
		b.book_name,
	    o.order_amount
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.book_name,order_amount
ORDER BY order_amount DESC
OFFSET 0 ROWS
FETCH NEXT 5 ROWS ONLY
 --2.Select avarage order Amount per Category

SELECT 
		b.book_category,
		AVG(o.order_amount) AS [Avarage Order]
FROM Books b
JOIN Orders o
ON o.book_id = b.book_id
GROUP BY book_category
--3.Select books with Low Stock and High Orders
SELECT 
		b.book_name,
		MIN(b.book_stock) AS 'Minimum Stock',
		MAX(o.order_amount) AS 'Maximim Orders'
FROM Books b
JOIN Orders o
ON o.book_id = b.book_id
GROUP BY b.book_name
--4.Calculate the total sales amount for each publisher
SELECT
	p.publisher_name,
	SUM(b.book_price * o.order_amount) AS total_sales
FROM Publisher p
JOIN Books b 
ON p.book_id = b.book_id
JOIN Orders o
ON b.book_id = o.book_id
GROUP BY p.publisher_name
--5.Select customers along with their order details and tracking information
SELECT
		c.customer_id, 
		c.customer_name, 
		c.customer_surname, 
		o.order_id, o.order_amount, 
		o.order_date, 
		td.carrier_name, 
		td.deliver_date
FROM Customers c
JOIN Orders o ON c.order_id = o.order_id
JOIN TrackingDetails td ON o.tracking_no = td.tracking_no
--6.Select orders placed on weekends
SELECT o.*
FROM Orders o
WHERE DATENAME(WEEKDAY,CAST(o.order_date as DATE)) IN ('Saturday','Sunday')
--7. Find all books with a price over $15 and published before 2000.
SELECT
		b.book_name,
		b.book_price,
	    p.publish_date
FROM Books b
JOIN Publisher p
ON b.book_id = p.book_id
WHERE b.book_price>15  AND YEAR(CONVERT(DATE, p.publish_date)) <2000
--8.Select books with Orders Placed by Customers Whose Last Names Start with 'S
SELECT 
		c.customer_name,
		b.book_id ,
		b.book_name
FROM Books b
JOIN Orders o
ON b.book_id = o.book_id
JOIN Customers c
ON c.order_id = o.order_id
WHERE c.customer_name LIKE 'S%'

--9.Select books with Orders Delivered by FedEx
SELECT
		book_id, book_name
FROM Books
WHERE book_id IN (
    SELECT book_id
    FROM Orders
    JOIN TrackingDetails ON Orders.tracking_no = TrackingDetails.tracking_no
    WHERE carrier_name = 'FedEx'
)
--10.Select books Ordered by Customers with Customer Email and Website URd Website URL
SELECT
		b.book_name, c.customer_email, w.website_url
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
JOIN Customers c ON o.order_id = c.order_id
JOIN BookOrderWebsite w ON b.book_id = w.book_id



