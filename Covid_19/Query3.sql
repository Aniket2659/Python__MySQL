-- 3. To find out the countries with the highest infection 

use covid_19;

WITH joined_table AS (
    SELECT 
        cl.`Country/Region`, 
        cl.Confirmed, 
        cl.Deaths, 
        cl.Recovered, 
        cl.Active, 
        cc.Date, 
        wd.Population 
    FROM country_wise_latest cl
    INNER JOIN covid_19_clean_complete cc ON cl.`Country/Region` = cc.`Country/Region`
    INNER JOIN full_grouped fg ON cl.`Country/Region` = fg.`Country/Region`
    INNER JOIN worldometer_data wd ON cl.`Country/Region` = wd.`Country/Region`
)
SELECT 
    `Country/Region`, 
    (Confirmed / Population) * 100 AS infection_rate
FROM joined_table
ORDER BY infection_rate DESC
LIMIT 1;

