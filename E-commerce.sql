---E-commerce Customer Analysis

---All Columns
SELECT*
  FROM [E-commerce ]

---Checking for nulls
Select *
from [E-commerce ]
Where Gender is null
---No null

Select*
from [E-commerce ]
where Age is null
---No null

Select*
From [E-commerce ]
Where City is null
---No null

Select *
From [E-commerce ]
Where Membership_type is null
--No null

Select *
From [E-commerce ]
Where Total_spend is null
---No null

Select *
From [E-commerce ]
Where Items_purchased is null
---No Null

Select *
From [E-commerce ]
Where Average_rating is null
---No null

Select *
From [E-commerce ]
Where Discount_Applied is null
---NO null

Select *
From [E-commerce ]
Where Days_Since_last_purchase is null
---No Null

Select *
From [E-commerce ]
Where Satisfaction_level is null
---No null

---Adding additional Columns
Alter table [E-commerce ]
Add Age_group varchar(55)

Alter table [E-commerce ]
Add Discount varchar(55);

Update [E-commerce ]
SET Age_group  = Case 
              when Age between 24 and 30 then '24-30'
			  when Age between 31 and 40 then '31-40'
			  when Age >40 then '41-50'
			  End

Update [E-commerce ]
SET Discount = Case
               when Discount_Applied = 1 then 'Yes'
			   else 'No'
			   end


---- Analysis

---Customer Segment

---City Spending
Select City, round(sum(total_spend),0) as Total_Spend
From [E-commerce ]
Group By City
Order by 2 Desc

---San Francisco City has the highest spending Customers.

---Membership type Spending/Rating
Select membership_type, round(sum(total_spend),0) as Total_Spend, avg(Average_Rating) As Avg_Rating
From [E-commerce ]
Group by Membership_Type
Order by 2 Desc
---Gold Membership type spent more.

---Gender wise Spending
Select gender, round(sum(total_spend),0) as Total_Spend
from [E-commerce ]
group by gender
order by 2 Desc
---Male Customers spent more.


---Satisfaction Analysis/ Promotion Strategy
Select Satisfaction_level,round(sum(total_spend),0) as Total_Spend,
       avg(Days_since_last_purchase) as Avg_Days_Since_last_Purchase
From [E-commerce ]
Group by Satisfaction_Level
Order by 2 Desc
--- Satisfied Customers spent more and return within an average space of 11 days to purchase more goods.


Select Discount,round(sum(total_spend),0) as Total_Spend, sum(items_purchased) as Total_Items
From [E-commerce ]
Group by Discount
---Customers given discount purchased more goods.

---Age wise
Select Age_group,satisfaction_level,round(sum(total_spend),0) as Total_Spend, avg(Average_Rating) As Avg_Rating
From [E-commerce ]
Group by Age_group, Satisfaction_Level
Order by 1
--- 24-30 years Satisfied customers purcahsed more goods and got an average rating of 4.5





