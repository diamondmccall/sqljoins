/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.name as productname, c.name as categoryname
from products as p
inner join categories as c
on c.categoryid = p.categoryid
where c.name = 'computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select products.Name, products.Price, reviews.rating 
from products
inner join reviews on reviews.ProductID = products.ProductID
where reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName , e.Lastname, sum(s.quantity) as total 
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name as 'Department Name', c.Name as 'Category Name' 
from departments as d
inner join categories as c on c.DepartmentID = d.DepartmentID
where c.Name = 'Appliances' or c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select p.Name, sum(s.Quantity) as 'Total Sold', sum(s.Quantity * s.PricePerUnit ) as 'Total Price'
 from products as p
 inner join sales as s on s.ProductID = p.ProductID
 where p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name, r.Reviewer, r.Rating, r.Comment
from products as p
inner join reviews as r on r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.EmployeeID , e.FirstName , e.LastName , p.Name , sum(s.Quantity) as TotalSold
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID;
