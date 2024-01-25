-- Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
-- Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. 
-- Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 
-- If more than one wand has same power, sort the result in order of descending age.

select id, age, coins_needed, power
from Wands c
LEFT JOIN Wands_Property d ON c.code = d.code
where (age, power, coins_needed) in (
    select 
    age, power, min(coins_needed)
    from
        Wands a
    LEFT JOIN Wands_Property b ON a.code = b.code
    where is_evil != 1 
    group by age, power)
order by power desc, age desc
