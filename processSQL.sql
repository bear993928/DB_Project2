--*範例1--查詢特定行政區之所有交通事故
---搜尋所有交通事故成本
select * from group7.vehicle_collisions;

---搜尋布魯克林區之交通事故
select * from group7.vehicle_collisions where borough = 'BROOKLYN';

---為group7.vehicle_collisions.borough 建立 INDEX (borough_idx)
create index borough_idx on group7.vehicle_collisions(borough desc);

------------------------------------------------------------------------------------------------
--*範例2--查詢人口數>50000 人且受傷人數超過 10 人的各區所屬的委員會資料
---起初使用巢狀查詢做搜尋
select p.zip_code, c.communityboard, c.cbofficeaddress, c.cbofficephone, c.cbchair, p.pop_est
from group7.personbyzipcode p, group7.communityboardsinfo c 
where p.zip_code = c.postcode and p.pop_est > 5000 
and p.zip_code in (
        select zip_code from vehicle_collisions where number_of_persons_injured > 10
    );

--為group7.personbyzipcode.pop_est 建立 INDEX (pop_idx)
create index pop_idx on group7.personbyzipcode(pop_est);

--為group7.vehicle_collisions.number_of_persons_injured 建立 INDEX (injure_idx)
create index injure_idx on group7.vehicle_collisions(number_of_persons_injured);

------------------------------------------------------------------------------------------------
--*範例3--找出最多事故的地區的主委
--初始我們使用 group by 和 Max 的方式查詢最多事故的地區
SELECT c.postCode, c.BOROUGH, c.CBCHAIR, x.totalCases FROM group7.communityboardsinfo c RIGHT JOIN 
(SELECT zip_code, count(*) AS totalCases FROM group7.vehicle_collisions where zip_code is not null group by zip_code 
	HAVING count(*) = (SELECT Max(count(*)) as totalCases from group7.vehicle_collisions 
							where zip_code is not null group by zip_code
					  ) 
) x ON c.POSTCODE = x.zip_code ;

--改用 order by 後取第一筆
SELECT c.postCode, c.BOROUGH, c.CBCHAIR, x.totalCases FROM group7.communityboardsinfo c RIGHT JOIN 	
(SELECT zip_code, count(*) AS totalCases from group7.vehicle_collisions 
	where zip_code is not null group by zip_code ORDER BY totalCases DESC fetch first 1 rows only
) x ON c.POSTCODE = x.zip_code;
--為group7.vehicle_collisions.zip_code 建立 INDEX (zip_idx)
create index zip_idx on group7.vehicle_collisions(zip_code)

------------------------------------------------------------------------------------------------