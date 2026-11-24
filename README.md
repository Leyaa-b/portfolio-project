# Data Analytics Portfolio

SQL and Excel projects covering data exploration, cleaning, and dashboards.

## 1. COVID-19 Data Exploration (SQL Server)

- **File:** [covid portfolioproject.sql](covid%20portfolioproject.sql)
- **Skills used:** joins, CTEs, window functions, temp tables, views
- **Dataset:** https://1drv.ms/x/c/4530e1aeab86b5a9/IQCv96w8r8yjTIhGfSG5baIyAVtCbcsDBmUXP93YlLaxmO8?e=xy6gRX
- **What I looked at:** infection rate against population by country, and rolling vaccination totals

## 2. Nashville Housing Data Cleaning (SQL Server)

- **File:** [dataCleaningProject.sql](dataCleaningProject.sql)
- **Skills used:** self-joins to fill missing addresses, string parsing (SUBSTRING, CHARINDEX, PARSENAME), duplicate detection with ROW_NUMBER
- **Dataset:** https://1drv.ms/x/c/4530e1aeab86b5a9/IQBXn66RfpIkQY5pkdXYSM9mAdSNgpSyQOuxXLGiaJ1nUV4?e=lzqTUX
## 3. Bike Sales Dashboard (Excel)

<img width="1315" height="712" alt="Bike Sales Dashboard" src="https://github.com/user-attachments/assets/ab351608-6394-4a82-83c0-9fed5f779479" />

- **File:** https://1drv.ms/x/c/4530e1aeab86b5a9/IQAAtX-spKFtT5XEwvkzdnL7AVmbONicgXCotHKTkwfQ408?e=fXWXe6
- **What it does:** Shows which customers buy bikes, with filters for marital status, education, and region.
- **Skills used:** data cleaning with lookup functions, pivot tables, pivot charts, slicers

**Key insights:**
- Bike buyers have a higher average income than non-buyers, for both women and men.
- Middle-aged customers are the largest group and include the most buyers.
- Customers with the shortest commutes (0-1 miles) are the most likely to buy.
  
## 4. Seattle Airbnb Price Dashboard (Tableau)

![Seattle Airbnb Price Dashboard](https://github.com/user-attachments/assets/9561f6c5-a098-4604-9052-34be36a0c156)


- **Live dashboard:** [View on Tableau Public](https://public.tableau.com/app/profile/leya.babu/viz/Tableauproject_17940442092780/Dashboard1)
- **What it shows:** How Airbnb listing prices in Seattle vary by zipcode and across the weeks of the year.
- **Views:** a bar chart of average price by zipcode, a line chart of average price by week, and a map of Seattle zipcodes coloured by average price.
- **Skills used:** Tableau, data cleaning (zipcode field), interactive dashboard design, map visualisation


**Key insights**
- Average nightly prices vary widely by zipcode: 98146 is the highest at about $200, followed by 98178 ($169) and 98134 ($150), while the lowest, such as 98106, are around $86.
- A small group of zipcodes (98146, 98178, 98134, 98121) is priced well above the rest, and most zipcodes fall between roughly $85 and $100.
- Weekly average prices stay between about $85 and $110, with the highest point at the start of the year and smaller peaks around weeks 31 and 40 to 43.

## 5. Data Professional Survey Dashboard (Power BI)

![Data Professional Survey Dashboard](https://github.com/user-attachments/assets/067fa05e-deef-410e-898c-fc451393cfb3)  

- **What it shows:** A breakdown of 261 data professionals from a survey: where they live, their job titles and average salaries, favourite programming languages, how hard it was to break into data, and how happy they are with their work-life balance and salary.
- **Skills used:** Power BI, data modelling, DAX measures, interactive dashboard design (treemap, bar, stacked column, donut, KPI cards, gauges)
- **Dataset:** https://1drv.ms/x/c/4530e1aeab86b5a9/IQAvY_-lV7sBTrcwF40C2Y2IAR1QvNWGopYb20Zezyq_dIc?e=7LeiGd

**Key insights**
- The survey has 261 respondents with an average age of about 31.
- Most respondents live in the United States, followed by India, the United Kingdom, and Canada.
- Data Scientists report the highest average salary, followed by Data Engineers, while students and those looking for work report the lowest.
- Average happiness with work-life balance is 6.4 out of 10, while happiness with salary is lower at 5.0 out of 10.


## 6.PySpark Sales Analysis (Databricks)

Sales analysis of restaurant orders using PySpark and a Databricks dashboard.

## Data Source
The raw input files are stored in a Databricks Unity Catalog volume (`workspace.default.pysparkproject`):
- Products data: `/Volumes/workspace/default/pysparkproject/product.txt`
- Sales data: `/Volumes/workspace/default/pysparkproject/sales.txt`
## What I did
- Loaded the data into Spark DataFrames
- Cleaned the data
- Joined the tables on the common factor ie., productid
- Aggregated with groupBy: sales by year, month, order source, country, customer, product
- Built a dashboard 

## Dashboard
<img width="1296" height="652" alt="image" src="https://github.com/user-attachments/assets/5f9821b3-8d47-4577-814e-2bca980fa56a" />
<img width="1257" height="605" alt="image" src="https://github.com/user-attachments/assets/07be399b-1440-40d4-8228-3b02acb9f4a0" />
<img width="1263" height="642" alt="image" src="https://github.com/user-attachments/assets/7b706f8c-3628-4399-9574-2c738b3d29bf" />



## Key findings
- Sandwich is the top ordered item
- UK has the highest total sales, followed by India and the USA
- Customers A and B spend the most

## How to run
Import the notebook into Databricks and run all cells.
  
## Tools

SQL Server, Microsoft Excel, Tableau, Power BI, PySpark, Spark SQL, Databricks(Free Edition)
