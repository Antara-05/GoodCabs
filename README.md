# 🚕 Goodcabs_Operations_Analysis

This repository contains resources for analyzing and improving Goodcabs' operations in tier-2 cities across India. It includes:

- 🛠️ **SQL Queries** for data extraction and analysis.
- 📊 **Dashboards_pdf** showcasing visual insights.
- 📑 **Presentations(pptx)** with actionable recommendations for operational improvements.

## 🔎 Problem Statement

Goodcabs has been operating in tier-II cities for two years, but it is still far from reaching its market penetration goals. Despite establishing a solid presence in these areas, the company is struggling to meet its ambitious 2024 targets.  
To overcome this challenge, Goodcabs needs an in-depth analysis of key performance metrics. This analysis will help identify critical growth opportunities and resolve operational inefficiencies that are hindering progress.

## 🎯 Project Objective

The objective of this project is to conduct a comprehensive analysis of Goodcabs' performance across key metrics—such as trip volume, passenger satisfaction, retention rates, trip distribution, and the balance between new and repeat passengers. By evaluating these metrics, the project aims to identify critical growth opportunities, address operational inefficiencies, and provide actionable insights to help Goodcabs achieve its market penetration goals and meet its ambitious targets for 2024.  
The insights from this analysis will support strategic decision-making and drive the company’s growth in tier-2 cities.

## 🛢 Data Overview

Received two SQL databases and eight CSV files for analysis.
The two databases are as follows:

1. trips_db: Contains fact tables (fact_trips, fact_passenger_summary) and dimension tables (dim_date, dim_city, dim_repeat_trip_distribution).
2. targets_db: Contains city- and month-specific target tables (monthly_target_trips, monthly_target_new_passengers, city_target_passenger_rating).

The dataset spans from January 1, 2024, to June 30, 2024.

## 🛠 Tech Stack
- **SQL** → Ad-Hoc Analysis  
- **Power BI** → Dashboard design and visualization  
- **Excel/CSV** → Data validation and cross-checking  
- **GitHub** → Project documentation  


## 📊 Dashboards

### 🏠 Home
![Home](https://github.com/Antara-05/GoodCabs/blob/main/Dashboard_Images/Screenshot%202025-08-25%20012318.png?raw=true)

### 🚘 Trip Summary
![Trip_Summary](https://github.com/Antara-05/GoodCabs/blob/main/Dashboard_Images/Screenshot%20(41).png?raw=true)

### 👥 Passenger Summary
![Passenger_Summary](https://github.com/Antara-05/GoodCabs/blob/main/Dashboard_Images/Screenshot%20(42).png?raw=true)

### 💰 Revenue Analysis
![Revenue_Analysis](https://github.com/Antara-05/GoodCabs/blob/main/Dashboard_Images/Screenshot%20(39).png?raw=true)

### ⭐ Rating & Performance
![Rating & Performance Summary](https://github.com/Antara-05/GoodCabs/blob/main/Dashboard_Images/Screenshot%20(43).png?raw=true)

## 🔑 Key Insights

- **Revenue Performance**:  
  - Total revenue of **108M** recorded in 6 months.  
  - Jaipur, Kochi, and Chandigarh are the **top-performing cities**.  
  - Revenue peaked in **February (19.9M)** but showed a **decline towards June (15.4M)**.  

- **Trip Analysis**:  
  - Total trips: **426K** (249K repeated, 177K new).  
  - Jaipur (76.9K trips) leads in trip volume, followed by Lucknow and Surat.  
  - Targets achieved in **Kochi, Mysore, Coimbatore**, but **missed in Chandigarh & overall (-0.72%)**.  

- **Passenger Trends**:  
  - Total passengers: **238K**.  
  - **74% new passengers** vs **26% repeat passengers** → indicates low retention.  
  - Highest repeat passenger rate (RPR%) in **Indore (32.7%)**, lowest in **Mysore (11.2%)**.  

- **Ratings & Satisfaction**:  
  - Average passenger rating: **7.85**.  
  - Jaipur and Kochi achieved the **highest driver ratings (~9.0)**.  
  - Consistency in passenger ratings (mostly between **7.5–8.5**), but still below the 2024 target in some cities.
 
## 💡 Recommendations  

Based on the analysis, the following actions are suggested to help Goodcabs achieve its 2024 targets:  

1. **Boost Repeat Trips** – Launch loyalty programs and discounts to improve passenger retention.  
2. **Expand High-Performing Cities** – Allocate more resources (drivers, marketing) in Jaipur, Kochi, and Chandigarh where revenue is strong.  
3. **Improve Underperforming Cities** – Run city-specific campaigns in low-revenue regions to balance growth.  
4. **Enhance Passenger Ratings** – Train drivers and improve service quality in cities with below-target ratings.  
5. **Target Seasonal Demand** – Adjust operations to handle peak demand months (Feb & May) more efficiently.  
6. **Optimize New Passenger Acquisition** – Strengthen marketing and referral programs to increase first-time users.  


## 📂 Project Structure

├── Dashboard_Images/          # Screenshots of Power BI dashboards  
├── Challenge_13_AD_HOC.sql    # SQL queries used for analysis  
├── GoodCabs_Dashboard.pdf     # Exported dashboard in PDF format  
├── GoodCabs.pptx              # Project presentation with problem, insights & recommendations  
└── README.md                  # Project documentation  

## 👩‍💻 Author
- **Antara Ghosh**    
- 🔗 [LinkedIn Profile](http://www.linkedin.com/in/antaraghosh09)   




