SELECT first_name AS `First Name`, last_name  AS `Last Name` 
FROM hr.employees;

SELECT distinct department_id AS `Department Id`
FROM hr.departments;

SELECT * FROM hr.employees
ORDER BY first_name DESC;

SELECT CONCAT(first_name," ",last_name) AS `Full Name` , salary as Salary, ((salary * 15) / 100)  AS PF
FROM hr.employees;

SELECT employee_id ,first_name,last_name , salary
FROM hr.employees
ORDER BY salary;

SELECT SUM(salary) AS `Total Salary Amount` 
FROM hr.employees;

SELECT MAX(salary) AS `Highest Pay`, MIN(salary) AS `Lowest Pay` 
FROM hr.employees;

SELECT AVG(salary) AS `Average of Total Salary` , COUNT(employee_id) AS `Number of Employees` 
FROM hr.employees;

SELECT COUNT(employee_id) AS `Number of Employees` 
FROM hr.employees;

SELECT DISTINCT job_id AS `Job Category` 
FROM hr.employees;

SELECT UPPER(first_name) as `First Name` 
FROM hr.employees;

SELECT first_name AS `First Name`, LEFT(first_name,3) AS `First 3 Letters` 
FROM hr.employees; 

SELECT first_name AS `First Name`, Trim(first_name) 
FROM hr.employees;

SELECT first_name AS `First Name`, LENGTH(first_name) AS `Length of First Name`, last_name AS `Last Name`, LENGTH(last_name) AS `Length of Last Name`
FROM hr.employees; 

SELECT * FROM hr.employees
WHERE first_name REGEXP '[0-9]';

SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary >15000 or salary <10000;

SELECT first_name, last_name, department_id
FROM hr.employees
WHERE department_id IN (30, 100)
ORDER BY department_id;

SELECT first_name, last_name, department_id, salary
FROM hr.employees
WHERE department_id IN (30,100) AND salary NOT BETWEEN 10000 AND 15000 ;

SELECT first_name, last_name, hire_date
FROM hr.employees
WHERE year(hire_date)=1987;

SELECT first_name
FROM hr.employees
WHERE first_name like '%b%c%';

use hr;

SELECT e.last_name,e.job_id, j.job_title , e.salary
FROM hr.employees e
join hr.jobs j
on e.job_id = j.job_id
where 
(j.job_title="Shipping clerk" or j.job_title="programmer") and
(e.salary<>4500 or e.salary<>10000 or e.salary<>12000);

SELECT last_name
FROM hr.employees
WHERE LENGTH(TRIM(last_name))= 6;

SELECT last_name
FROM hr.employees
WHERE last_name like "__e%";

SELECT job_id, group_concat(employee_id)
FROM hr.employees
GROUP BY job_id
Limit 6;

SELECT *
FROM hr.employees
WHERE LENGTH(TRIM(first_name)) >= 8;

SELECT email, CONCAT("@",email,".com") AS `EMail_Id`
FROM hr.employees;

SELECT phone_number, RIGHT(`phone_number`,4) `Last 4 digits`
FROM hr.employees;

SELECT location_id, street_address,SUBSTRING_INDEX(`street_address`,' ',-1) as `lastword of address`
from hr.locations;

select * from hr.locations
where  length(street_address) <= (select min(length(street_address)) from hr.locations);

SELECT job_title, SUBSTRING_INDEX(`job_title`,' ',1) as `job title`
FROM hr.jobs;

SELECT first_name, last_name
FROM hr.employees
WHERE INSTR(last_name,'c')>2;

SELECT first_name, Length(first_name) as `length of the firstname`
FROM hr.employees 
WHERE first_name LIKE "a%" or first_name like "j%" or first_name like "m%"
ORDER BY first_name;

SELECT first_name, CONCAT("$",salary) AS SALARY
FROM hr.employees;

SELECT left(first_name,8),
REPEAT ('$', FLOOR (salary/1000))
'salary($)', salary
FROM hr.employees
ORDER BY salary DESC;

SELECT employee_id, first_name, last_name, hire_date
FROM hr.employees
WHERE Month(hire_date) =7 OR DAY(hire_date) =7;


use northwind;

SELECT ProductName,QuantityPerUnit 
FROM products;

SELECT ProductID, ProductName
FROM products
WHERE Discontinued =1;

SELECT ProductID, ProductName
FROM products
WHERE Discontinued =0;

SELECT productName, UnitPrice
FROM products as a
WHERE 10 >= (SELECT COUNT( Distinct Unitprice) FROM products as b WHERE b.unitprice >=a.Unitprice);


SELECT ProductID, ProductName, UnitPrice 
FROM products WHERE unitprice <20;

SELECT productname, unitprice
FROM products 
WHERE unitprice > (SELECT AVG(unitprice) FROM products);

SELECT productid, productname, unitprice
FROM products
WHERE unitprice <20 AND unitprice >15;

SELECT COUNT(Productname) AS "Product Count"
FROM products
GROUP BY discontinued 
ORDER BY discontinued;

SELECT productname, unitsonorder,unitsinstock
FROM products
WHERE (((Discontinued)=FALSE) AND (UnitsInStock<UnitsOnOrder));

SELECT * FROM products
WHERE unitprice=(SELECT MAX(unitprice) FROM products) OR unitprice= (SELECT MIN(unitprice) FROM products);

use hr;


select first_name, last_name, Phone_number, replace(phone_number,'124','999') as updated_phone_number
from employees
WHERE phone_number LIKE '%124%';