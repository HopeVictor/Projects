#Awesome Chocolate Analysis
# Tables
# Geo containing columns GeoID, Geo, Region
#People containing columns Salesperson, SPID, Team, location and Salary
#Products containing columns ProductID, Product, Category, Size and Costperbox
#Sales containing columns SPID, geoId, PID, Salesdate, Amount, Customers, Boxes

# Total boxes sold by product Id
Select s.PID, p.product, count(s.PID) as product_count, sum(s.boxes) as Total_boxes
From Sales s
join products p
using(PID)
group by PID
Order by Total_boxes desc
  # Product Id P09 Orange Choco sold highest with 192189 total boxes.
 
# Amount Sold by Products 
Select s.PID, p.product, sum(s.Amount) as Sales
From Sales s
join products p
using(PID)
group by PID
Order by Sales desc
 #PID P11 After Nines made highjest Sales
 
 #Categorical sales
 Select p.category, sum(s.amount) as Sales
From Sales s
join products p
using(PID)
group by p.category
Order by Sales desc
 # Bars made highest sales
 
 #Regional Sales
Select g.geo, sum(s.amount) as Sales
From Sales s
join Geo g
using(GeoID)
group by g.geo
Order by Sales desc
 # New Zealand Recorded highest Sales
 
 #yearly Sales
 Select year(saledate) as Years, sum(Amount) as Total_Sales
 From Sales 
 Group By Years
 
 #monthly Sales
 Select month(saledate) as months, sum(amount) as Total_Sales
 From Sales
 Group by months
 Order by Total_sales desc
 
#first Sales 
Select s.SPID,pe.Salesperson, s.PID, pr.Product, s.SaleDate, s.Amount, s.customers, s.Boxes
From sales s
Join products pr using(PID)
Join people pe using (SPID)
where s.Saledate=(Select min(Saledate) from Sales) 
limit 1

#last sales 
Select s.SPID,pe.Salesperson, s.PID, pr.Product, s.SaleDate, s.Amount, s.customers, s.Boxes
From sales s
Join products pr using(PID)
Join people pe using (SPID)
where s.SPid=(Select max(SPID) from Sales) 
limit 1

#total sales person
Select count(SPID)
From people
 # 33 sales person
 
 #highest selling team
 Select p.team, sum(s.Amount) as Total_Sales
 from Sales s
 Join People p
 Using(SPID)
 Group By 1
 Order By Total_Sales Desc
  #Team Delish
 
# Top 5 sales person
Select s.SPID,pe.Salesperson, sum(s.amount) as Total_Sales
From sales s
Join people pe using (SPID)
Group by 1, 2
Order by Total_Sales Desc
limit 5
# SP04, SP03, SP24, SP18, SP12

#20% salary increase for top 5 sales person
 select SPID, Salesperson, Salary,
      Case  when SPID in ( "SP04", "SP24", "SP18", "SP03", "SP12") then Salary+(Salary*0.2)
      else Salary
      End As 'New_Salary'
 From people 
 # Salary increased to 36000 for top5 sales person.

