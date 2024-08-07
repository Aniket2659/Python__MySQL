-- 5. Average number of deaths by day (Continents and Countries)

use covid_19;

WITH joined_table AS (
    SELECT 
        cl.`Country/Region`, 
        wd.Continent, 
        cc.Deaths, 
        cc.Date
    FROM country_wise_latest cl
    INNER JOIN covid_19_clean_complete cc ON cl.`Country/Region` = cc.`Country/Region`
    INNER JOIN full_grouped fg ON cl.`Country/Region` = fg.`Country/Region`
    INNER JOIN worldometer_data wd ON cl.`Country/Region` = wd.`Country/Region`
)
SELECT 
    `Country/Region`,
    Continent,
    AVG(Deaths) AS avg_deaths_per_day
FROM joined_table
GROUP BY `Country/Region`, Continent
ORDER BY Continent, avg_deaths_per_day DESC;
