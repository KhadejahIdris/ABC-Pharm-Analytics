# ABC-Pharmaceutical-Company-Sales-Analytics
A comprehensive analysis of ABC Pharmaceutical Company sales data

## Introduction
This project delves into the sales performance of ABC Pharmaceuticals using Python, SQLite, and Power BI to extract actionable business insights. The dataset provides a comprehensive view of sales transactions, customer demographics, product details, geographic information, and sales channels. By integrating advanced analytics, database management, and visualization tools, the analysis aims to support data-driven decision-making.

The primary objectives include uncovering sales trends, evaluating product and channel performance, understanding customer purchasing behavior, and identifying the geographic impact on sales. These insights will help refine business strategies, optimize operations, and enhance product offerings.
# Table of Contents

1. [Introduction](#introduction)
2. [Problem Statement](#problem-statement)
3. [Methodology and Skills Applied](#methodology-and-skills-applied)
4. [Findings/Insights](#findingsinsights)
5. [Recommendations](#recommendations)
6. [Tools Used](#tools-used)


## Problem Statement
Businesses often face challenges in effectively analyzing sales data due to fragmented datasets, limited geographic insights, and inadequate understanding of customer behavior. Key issues include:

Identifying seasonal and yearly sales trends.
Evaluating product performance across regions and sales channels.
Understanding customer demographics and preferences.
Utilizing geospatial and visual analytics to drive actionable insights.

## Methodology and Skills Applied
This project followed a structured approach:

* Database creaation and Modeling:

Created a star schema with fact and dimension tables using SQLite and Power BI.
FactSales table linked with dimension tables (Products, Customers, Locations, Channels, Sales Teams, and Date).
* Data Cleaning and Preparation:

Handled missing values, duplicates, and inconsistencies in city, country, and product data.
Converted text-based date columns into proper date formats.
* Exploratory Data Analysis (EDA):

Examined data distributions, correlations, and trends.
Conducted year-over-year and seasonal trend analysis.
* Regional and Geospatial Analysis:

Analyzed geographic impact using geospatial tools like GeoPandas and Plotly.
* Hypothesis Testing and Statistical Analysis

  Performed hypothesis testing (Pearson correlation, ANOVA, T-tests) to compare performance across regions, products, and channels.
  
* Visualization and Dashboarding:

Built an interactive Power BI dashboard to display key metrics and insights.

## Findings/Insights

* Pricing strategies might not be directly influencing sales volume in the business, or other factors (such as demand, marketing efforts, distribution channels, etc.) could be playing a more significant role

* Sales Trends:

Peak sales occured in August and November, while January and May recorded the lowests sales, reflecting seasonal demand and restocking trends.
2018 recorded the highest sales, while 2020 experienced a dip, potentially due to global influence of the covid-19 Pandemic.
* Product Performance:

Ionclotide (Analgesics) emerged as the top-selling product, while Factofribate (Mood Stabilizer) underperformed.
Antipyretics commanded the highest average price, likely due to advanced formulations or strong demand.
* Channel and Region Performance:

The Pharmacy channel and Retail subchannel led sales, highlighting their direct connection with consumers.    
Poland had sales record for just 2018, while Germany had records from 2017 to 2020
Germany dominated in sales performance, while Poland lagged, likely due to market size and purchasing power.               
Of the 749 cities contained in the dataset, 708 were rural cities, while just 41 where urban cities. This indicates that the business operates mostly in the rural areas where population density and purchasing power is low.
* Customer and Sales Teams:

Delta team led in sales performance, while Alfa team underperformed.
Jimmy Fret was the top sales representative, indicating exceptional sales strategies or a favorable territory.
* Geographical Insights:

Butzbach recorded the highest city-level sales, while Szczytno had the lowest.
## Recommendations
* Optimize Sales Strategies:
There is need for expansion of business to the urban cities  where spending power is higher.

Focus promotional campaigns during peak periods (July, December).    
Strengthen Alfa team's performance with additional training or support.
* Enhance Product Offerings:

Invest in marketing for underperforming products like mood stabilizers.
Leverage the high demand for analgesics with targeted promotions.
* Geographic Expansion:

Strengthen distribution networks in low-performing regions like Poland and Szczytno.
* Channel Optimization:

Continue prioritizing retail and pharmacy channels while exploring opportunities in hospitals and government subchannels.
## Tools Used
SQLite: For database creation, querying, and schema design.
Python: For data analysis, visualization, and statistical testing.
Libraries: Pandas, NumPy, Matplotlib, Seaborn, GeoPandas, Plotly.
Power BI: For creating dashboards and visualizing insights.
