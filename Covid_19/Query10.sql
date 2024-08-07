-- 10 To find out the recovery percentage locally and globally

use covid_19;

WITH joined_table AS (
    SELECT 
        cl.`Country/Region`, 
        cl.Confirmed, 
        cl.Deaths, 
        cl.Recovered, 
        cl.Active, 
        cc.Date, 
        wd.Population, 
        wd.Continent
    FROM country_wise_latest cl
    INNER JOIN covid_19_clean_complete cc ON cl.`Country/Region` = cc.`Country/Region`
    INNER JOIN full_grouped fg ON cl.`Country/Region` = fg.`Country/Region`
    INNER JOIN worldometer_data wd ON cl.`Country/Region` = wd.`Country/Region`
)
SELECT 
    `Country/Region`,
    (Recovered / Confirmed) * 100 AS local_recovery_percentage,
    (SUM(Recovered) OVER () / SUM(Confirmed) OVER ()) * 100 AS global_recovery_percentage
FROM joined_table
WHERE Confirmed > 0
ORDER BY local_recovery_percentage DESC;