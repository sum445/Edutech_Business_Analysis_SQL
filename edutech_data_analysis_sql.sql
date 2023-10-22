create database edutech_analysis;
use edutech_analysis;
show tables;
select*from coaching_sales;
select*from course_tb;
select*from edutech_marketing;
select*from student_tb1;

#s001_How many leads are generated in may 2023

select count(*) month_lead from edutech_marketing where l_months="may";

#s002_Which months generated maximum leads

select l_months , count(Lead_id) max_L_month 
 from edutech_marketing
 group by l_months  order by max_L_month desc 
 limit 2 ;
 
 #s003_how many leads are convered into admission
 
 select count(*) as converts from ( select distinct(a.lead_id),a.l_city,b.stu_id,b.stu_name from
 edutech_marketing  a inner join student_tb1 b on a.lead_id=b.stu_id) C;
 
 #s004_City from which most no of leads generated 
 
 select l_city , count(l_city) max_L_month
  from edutech_marketing 
  group by  l_city  order by max_L_month desc
  limit 2 ;
  
  #s005_list down best coaching in terms of enrollments
  
  select coach_name, count(stu_card)  enrollment_wise  from coaching_sales 
  group by coach_name  order by enrollment_wise desc limit 1 ;

#s006_identify the best coaching in terms of revenue

select coach_name,sum(sales) as total_income from coaching_sales group by coach_name limit 1; 

#s007_most preferred course by students

select course_id, count(course_id) high_demand_course 
  from student_tb1 group by  course_id  order by high_demand_course desc limit 2 ;
  
#s008_Divide the student into three age group and how many students are in each group(20-25,2530,30-35)

SELECT sum(CASE WHEN age < 25 THEN 1 ELSE 0 END) AS below25,
sum(CASE WHEN age BETWEEN 24 AND 31 THEN 1 ELSE 0 END) AS bw25_31,
sum(CASE WHEN age BETWEEN 30 AND 35 THEN 1 ELSE 0 END) AS bw30_35
FROM student_tb1;

#s009_Find out the top 5 coachings according to students enrolled

select coach_name, count(stu_card)  enrollment_wise  from coaching_sales 
group by coach_name  order by enrollment_wise desc limit 5 ;

#s010_group the course enrolled by students enrolled in descending order

select distinct course_id ,count(stu_id) as student_enrolled from student_tb1
 group by course_id order by student_enrolled desc;


#s011_how many students opted from delhi and in vajram

 select distinct a.stu_id,a.stu_name, a.city,b.stu_card,b.coach_name from student_tb1 A 
 inner join coaching_sales b on a.stu_id=b.stu_card 
 where coach_name = 'vajiram'and city='delhi'

#s012_Find top three  channel  for lead generation

select lead_source,count(lead_id) as Best_channel from edutech_marketing  
group by lead_source order by Best_channel desc limit 3;

#s013_which channel is best for lead conversion

select*from 
(
select lead_source, count(lead_source) channel_in_uniit ,l_status as chann 
from  edutech_marketing 
group by lead_source, l_status  order by lead_source desc) 
sharmaji where chann ='stage_3' order by  channel_in_uniit  desc;

#s014_find the average age of students

select avg(avg_age) from
(select distinct stu_id,age avg_age from student_tb1)
soo;

#s015_citywise income from top to bottom of each coaching 

select city,sum(sales) Each_city from
 (select distinct a.stu_id, a.city ,b.sales from
 student_tb1  a left join coaching_sales  b on a.stu_id=b.stu_card) yes_b 
 group by city order by each_city desc ;
 
 #s016_how many students did not joined any coaching 
 
  select count(lead_id)as not_converts from edutech_marketing where l_status!='stage_3';
  
  #s017_how many leads are not converted into admission 
  
  select  distinct(a.lead_id),a.l_city,b.stu_id,b.stu_name from edutech_marketing  a left join 
 student_tb1 b on a.lead_id=b.stu_id where stu_id is null;
 select count(*) as not_convert from
 (select  distinct(a.lead_id),a.l_city,b.stu_id,b.stu_name from edutech_marketing  a left join 
 student_tb1 b on a.lead_id=b.stu_id where stu_id  is null)
 c;

#s018_number of students as per there age group who purchased the course 

select distinct age, count(course_id) as nos from 
 (select course_id,age from student_tb1 order by age desc)
 jai_india group by age order by nos desc
 ;
 
 #s019_ find the %enrollment of student from total leads generated 
 select*from(
select*from(
 select a.lead_id,a.l_city,b.stu_id,b.stu_name from
 edutech_marketing  a left join student_tb1 b on a.lead_id=b.stu_id ) D
union
select*from ( 
select a.lead_id,a.l_city,b.stu_id,b.stu_name from
 edutech_marketing  a right  join student_tb1 b on a.lead_id=b.stu_id) E
 ) as prithvi ;
















 






  

 





