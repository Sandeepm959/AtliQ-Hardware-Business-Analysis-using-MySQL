# AtliQ-Hardware-Business-Analysis-using-MySQL
This project involved analyzing business data from AtliQ Hardware using MySQL to address key business challenges and provide actionable insights.

### About the Company
AtliQ Hardware is an electronics manufacturer that sells various items such as PCs, keyboards, mice, printers, and other peripherals. The company caters to different customers, including Amazon, Croma, Flipkart, and others.

## Problem Statements Solved

### 1. Monthly Product Sales Report for Croma India
**Objective:** As a product owner, I want to generate a report of individual product sales (aggregated on a monthly basis at the product code level) for Croma India customer for FY 2021. This report will help track individual products and allow further product analytics in Excel.

**Solution:** 
- Utilized multi-table joins to fetch sales data.
- Aggregated sales at the product code level on a monthly basis.
- Created a view to streamline the process for further analysis.

### 2. Aggregate Monthly Gross Sales Report for Croma India
**Objective:** As a product owner, I need an aggregate monthly gross sales report for Croma India customers to track how much sales this particular customer generates from AtliQ and manage our relationship accordingly.

**Solution:**
- Employed aggregate functions to calculate gross sales.
- Generated a monthly report showing total sales figures for Croma India.
- Ensured the report could be easily updated and queried using a stored procedure.

### 3. Top Market, Top Products, and Top Customers by Net Sales
**Objective:** Identify the top market, top products, and top customers by net sales in millions for a given financial year.

**Solution:**
- Used multiple views in MySQL Workbench to aggregate and rank data.
- Implemented window functions and Common Table Expressions (CTEs) to extract the top entities.
- Created detailed views to facilitate easy access to this information for further analysis.

### 4. Top N Products by Quantity Sold for Each Division
**Objective:** Get the top N products of each division by their quantity sold in a given financial year.

**Solution:**
- Designed a query to rank products based on quantity sold using window functions.
- Created a view to dynamically fetch the top N products for each division.
- Utilized CTEs and temporary tables to manage intermediate calculations.

### 5. Forecast Accuracy for Customers
**Objective:** Calculate and analyze forecast accuracy for customers.

**Solution:**
- Developed user-defined functions to compute forecast accuracy.
- Created stored procedures to automate the calculation process.
- Utilized historical sales data and forecast figures to determine accuracy.

## Key Learnings

### Multi-Table Joins
- Mastered the art of joining multiple tables to fetch relevant data for analysis.
- Ensured data integrity and optimized query performance.

### Stored Procedures
- Automated repetitive tasks and complex calculations using stored procedures.
- Enhanced the maintainability and scalability of SQL queries.

### Views
- Created views to simplify complex queries and present data in an easily understandable format.
- Leveraged views for quick and efficient data retrieval.

### User-Defined Functions
- Developed custom functions to perform specific calculations.
- Improved code reusability and clarity.

### Window Functions
- Used window functions for advanced calculations and data ranking.
- Enhanced the ability to perform analytics directly within SQL queries.

### Common Table Expressions (CTEs)
- Utilized CTEs for breaking down complex queries into simpler parts.
- Improved query readability and maintainability.

### Ranking
- Implemented ranking functions to identify top-performing products, markets, and customers.
- Enhanced the ability to perform comparative analysis.

### Temporary Tables
- Used temporary tables for intermediate data storage during complex calculations.
- Ensured efficient use of resources and optimized query performance.

## Conclusion

This project involved analyzing AtliQ Hardware's business data using MySQL to solve various business problems. The insights gained from this analysis help in better decision-making and relationship management with customers. The project also provided hands-on experience with advanced SQL concepts, which are crucial for any data-driven business analysis.

