create database cartesian_task2;
use cartesian_task2;
# Creating Customer Table

create table Custm(Customer_Id varchar(20));
insert into Custm values('Abhinash'),('Vipin'),('Mahesh'),('Bijoy'),('Bhabani'),('Ashutosh');

# Creating Voucher Table
 
create table Vouch (Voucher_Id varchar(100));
insert into Vouch values('ABXFH'),('SDFGH'),('ERTYY'),('PPLKM');
select * from Vouch;

create table cust_voch(Customer_Key varchar(20),Gift_Voucher_Key varchar(20));

;with cte 
 as(select *,row_number() over(order by Customer_Id) rr from Customer)
 ,cte2 as(select *,row_number() over(order by Voucher_Id) rr from Voucher)
 select Customer_Id Customer_Key,Voucher_Id Gift_Voucher_Key
 from cte c1 left
 join cte2 c2 on c1.rr=c2.rr


 