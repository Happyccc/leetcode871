spark-sql --queue root.shangyeshiyebu-qicheshiyebu.da -e"
set mapred.input.dir.recursive=true;set hive.mapred.supports.subdirectories=true;
    select city_name,batch_id,activity_id,(case when activity_id=150268 then 1 else 0 end) as is_zongbu,sum(coupon_cost) as coupon_cost
	from
    (
        select business_cityid, batch_id,activity_id,passenger_id,spend_time,coupon_cost
		from finance_dw.dwv_coupon_spend
		where concat_ws('-',year,month,day) between '2017-11-01' and '2017-11-30'
    )a
    inner join 		
	(
			select batch_number,city_id
			from whinstone.ods_wh_order
			where concat_ws('-',year,month,day) between '2017-10-01' and '2017-11-30'
			and pay_status=1
			and substr(from_unixtime(pay_time),1,10) between '2017-10-01' and '2017-11-30'
			group by batch_number,city_id
	) b
	on a.business_cityid=b.city_id and a.batch_id=b.batch_number
	inner join 
	(
			select city_id,city_name
			from g_bi.kuai_city_delta1
	) d
	on a.business_cityid = d.city_id
	group by city_name,batch_id,activity_id,case when activity_id=150268 then 1 else 0 end
;
">ly.txt


spark-sql --queue root.shangyeshiyebu-qicheshiyebu.da -e"
set mapred.input.dir.recursive=true;set hive.mapred.supports.subdirectories=true;
select a.city_name,batch_id,activity_id,is_zongbu,coupon_cost,pay_amount
from 
(
	select city_name,batch_id,activity_id,(case when activity_id=150268 then 1 else 0 end) as is_zongbu,sum(coupon_cost) as coupon_cost
	from
    (
        select business_cityid, batch_id,activity_id,passenger_id,spend_time,coupon_cost
		from finance_dw.dwv_coupon_spend
		where concat_ws('-',year,month,day) between '2017-11-01' and '2017-11-30'
    )a
    inner join 		
	(
			select batch_number,city_id
			from whinstone.ods_wh_order
			where concat_ws('-',year,month,day) between '2017-10-01' and '2017-11-30'
			and pay_status=1
			and substr(from_unixtime(pay_time),1,10) between '2017-10-01' and '2017-11-30'
			group by batch_number,city_id
	) b
	on a.business_cityid=b.city_id and a.batch_id=b.batch_number
	inner join 
	(
			select city_id,city_name
			from g_bi.kuai_city_delta1
	) d
	on a.business_cityid = d.city_id
	group by city_name,batch_id,activity_id,case when activity_id=150268 then 1 else 0 end
)a 
left join
(
	    select city_name,batch_number,pay_amount
	    from 
		(
			select city_name,batch_number,sum(pay_amount) as pay_amount
			from
			(
				select city_id,batch_number,pay_amount/100 as pay_amount
				from whinstone.ods_wh_order
				where concat_ws('-',year,month,day) between '2017-11-01' and '2017-11-30'
				and pay_status=1
				and substr(from_unixtime(pay_time),1,10) between '2017-11-01' and '2017-11-30'
		    )a 
			inner join
			(
				select city_id,city_name
				from g_bi.kuai_city_delta1
			) d 
			on a.city_id = d.city_id
			group by city_name,batch_number
		 
		)b 
)b 	
on a.city_name=b.city_name and a.batch_id = b.batch_number
group by a.city_name,batch_number,activity_id,is_zongbu,pay_amount,coupon_cost;
">ly1.txt

	





