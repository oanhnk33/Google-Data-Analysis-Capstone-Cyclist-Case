# Google Data Analytics Capstone: Cyclistic Case Study
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)
## Introduction
In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: [Ask](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/README.md#ask), [Prepare](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/README.md#prepare), [Process](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/README.md#process), [Analyze](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/README.md#analyze-and-share), [Share](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/README.md#analyze-and-share), and [Act](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study#act).
### Quick links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)  
  
SQL Queries:  
[01. Data Exploration](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/data%20exploration.sql)
[02. Data Cleaning 1](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/Data%20Cleaning.sql) 
[03. Data Cleaning 1](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/data%20cleaning%202.sql) 
[04. Data Analysis](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/Data%20Analysis.sql)
  
Data Visualizations: [Tableau](https://public.tableau.com/app/profile/oanh.nguyen3466/viz/CaseStudyGoogleDataAnalysis/Biketypeinuse) 
## Background
### Cyclistic
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown
to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations
across Chicago. The bikes can be unlocked from one station and returned to any other station
in the system anytime.
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to
broad consumer segments. One approach that helped make these things possible was the
flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships.
Customers who purchase single-ride or full-day passes are referred to as casual riders.
Customers who purchase annual memberships are Cyclistic members.
Cyclistic’s finance analysts have concluded that annual members are much more profitable
than casual riders. Although the pricing flexibility helps Cyclistic attract more customers,
Moreno believes that maximizing the number of annual members will be key to future growth.
Rather than creating a marketing campaign that targets all-new customers, Moreno believes
there is a solid opportunity to convert casual riders into members. She notes that casual riders
are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.
Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into
annual members. In order to do that, however, the team needs to better understand how
annual members and casual riders differ, why casual riders would buy a membership, and how
digital media could affect their marketing tactics. Moreno and her team are interested in
analyzing the Cyclistic historical bike trip data to identify trends.

### Scenario
I assume I will be a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask
### Business Task
Design marketing strategies aimed at converting casual riders into annual members.
### Analysis Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?
## Prepare
### Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2023 to Dec 2023 which can be  taken from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).  
  
This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.
### Data Organization
There are 12 files with the naming convention of YYYYMM-divvy-trip data, and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, an end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Process
Use the command prompt to combine 12 months of files
SQL SERVER is used to combine the various datasets into one dataset and clean it.    
Reason:  
 The Cyclistic dataset has more than 5.7 million rows so the SQL Server is one of the great platforms to support me resolve the huge amount of data
### Combining the Data
Use the command prompt to combine 12 months of files
![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/SQL%20tables/2024-08-08_16-11-37.png)
12 CSV files are uploaded as tables in the dataset '2023_tripdata'. Another table named "Data_2023" is created, containing 5,719,878 rows of data for the entire year. 
### Data Exploration
SQL Query: [Data Exploration](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/data%20exploration.sql)  

Observations:  
1. Set The __ride_id__ column is our primary key.  

   ![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/SQL%20tables/primary%20key.png)

2.  As ride_id has no null values.  
   
   ![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/SQL%20tables/Null%20value.png)

3.  There are __13 duplicate__ rows in the data, I need to clean it

   ![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/SQL%20tables/duplicate%20rows.png)
4. The length of __ride_id__ is 16, so I need to clean the ride_id rows that have the length is less or more 16

    ![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/SQL%20tables/length%20ride_id.png)

6. There are 3 unique types of bikes(__rideable_type__) in our data.

   ![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/SQL%20tables/unique%20kind%20of%20bike.png)

7. The __started_at__ and __ended_at__ shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format.
8. A new column, ride_length, can be created to find the total trip duration. 0 trips have a duration longer than a day, and 224280 trips have less than a minute duration or have an end time earlier than the start time, so we need to remove them.
9. Other columns, day_of_week and month are also created to support my analysis more effectively
10. Total of 875849 rows have both __start_station_name__ and __start_station_id__ missing values which needs to be removed.  
11. Total of 929344 rows have both __end_station_name__ and __end_station_id__ missing which needs to be removed.
13. __member_casual__ column has 2 unique values as a member or casual rider.
   ![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/SQL%20tables/Unique%20riders.png)

### Data Cleaning
SQL Query: [Data Cleaning 1](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/Data%20Cleaning.sql)  
           [Data Cleaning 2](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/data%20cleaning%202.sql)  
1. All the rows having missing values are deleted.  
2. 3 new columns, ride_length for the duration of the trip, day_of_week, and month, are created.  
3. Trips with a duration of less than a minute and longer than a day are excluded
  
## Analyze and Share
SQL Query: [Data Analysis](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/Data%20Analysis.sql)  
Data Visualization: [Tableau](https://public.tableau.com/app/profile/oanh.nguyen3466/viz/CaseStudyGoogleDataAnalysis/Biketypeinuse)  
The data is stored appropriately and is now prepared for analysis. To analyze and share with stakeholders, I choose Tableau to visualize my data
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?  

First of all, member and casual riders are compared by the type of bikes they are using.  

![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/Chart/Bike%20Type%20In%20Use.png)
While members use electric bikes and classic bikes, casual riders tend to prefer using docked bikes when 100% of the people who use docked bikes are casual riders
  
![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/Chart/avg%20duration%20in%20month.png)
![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/Chart/AVG%20day%20of%20week.png)
![image](https://github.com/oanhnk33/Google-Data-Analysis-Capstone-Cyclist-Case/blob/main/Chart/AVG%20day%20of%20week.png)

  
__Months:__ The chart shows that  both casual and members prefer riding the bikes in spring and summer to winter. This figure reached the peak in July for both casual and members however, the gap in total trips between casual and members is large
__Days of Week:__  In terms of the day of the week, casual and members have the same riding behavior when they ride more on the weekend instead of on the weekdays
__Hours of the Day:__ Both casual and member riders tend to ride less in the early morning. While the number of trips of the member riders is consistent for a whole day, this figure of casual riders increases sharply from 10 am to 14 pm. After that decreased strongly 
  
From the three charts above, we can reveal that most member riders and casual riders  use bikes for leisure purposes because they tend to use them more on the weekend and in summer 
  
After identifying the differences between casual and member riders, marketing strategies to target casual riders can be developed to persuade them to become members.  
Recommendations:  
1. 1. The marketing campaign should be held or invested more money in the summer and engage casual riders 
2. 2. Because casual riders often use bikes on weekends and in summer we can give special promotions for member riders. For example, discount programs for people who convert casual riders into member riders or discounts for member riders when use docked bike
3.  I can create content such as short videos about information discount programs and benefits when becoming member riders 
