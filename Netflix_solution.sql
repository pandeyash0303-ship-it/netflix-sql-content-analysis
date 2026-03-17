-- ═══════════════════════════════════════════════════════════
--  NETFLIX CONTENT ANALYSIS — SQL PROJECT
--  Tool: PostgreSQL
--  Dataset: Netflix Movies and TV Shows
--  Business Problems Solved: 15
--  Skills: Aggregations · Window Functions · CTEs · 
--          unnest() · string_to_array() · Date Functions
--  Author: Yash Pandey | IIT Guwahati Certified
-- ═══════════════════════════════════════════════════════════

-- ── EXPLORATORY QUERIES ──────────────────────────────────────

-- View all records
SELECT * FROM netflix_details;

-- Total content count
SELECT COUNT(*) AS total_count
FROM netflix_details;

-- ── BUSINESS PROBLEMS ────────────────────────────────────────

-- Q1. Count the number of Movies vs TV Shows
SELECT type, COUNT(*) AS total_count
FROM netflix_details
GROUP BY type;

-- Q2. Find the most common rating for Movies and TV Shows
SELECT type, rating
FROM (
    SELECT type, rating,
           COUNT(*),
           RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
    FROM netflix_details
    GROUP BY 1, 2
) AS t1
WHERE ranking = 1;

-- Q3. List all Movies released in 2020
SELECT * FROM netflix_details
WHERE type = 'Movie'
AND release_year = 2020;

-- Q4. Find the Top 5 countries with the most content on Netflix
SELECT 
    UNNEST(string_to_array(country, ',')) AS new_country,
    COUNT(show_id) AS total_count
FROM netflix_details
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Q5. Identify the longest Movie duration
SELECT * FROM netflix_details
WHERE type = 'Movie'
AND duration = (SELECT MAX(duration) FROM netflix_details);

-- Q6. Find content added in the last 5 years
SELECT * FROM netflix_details
WHERE TO_DATE(date_added, 'Month DD, YYYY') 
    >= CURRENT_DATE - INTERVAL '5 years';

-- Q7. Find all Movies/TV Shows directed by 'Rajiv Chilaka'
SELECT * FROM netflix_details
WHERE director ILIKE '%Rajiv Chilaka%';

-- Q8. List all TV Shows with more than 5 seasons
SELECT * FROM netflix_details
WHERE type = 'TV Show'
AND SPLIT_PART(duration, ' ', 1)::NUMERIC > 5;

-- Q9. Count the number of content items in each genre
SELECT
    UNNEST(string_to_array(listed_in, ',')) AS genre,
    COUNT(show_id) AS total_content
FROM netflix_details
GROUP BY 1
ORDER BY 2 DESC;

-- Q10. Find yearly content addition % for India
SELECT
    EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
    COUNT(*) AS yearly_count,
    ROUND(
        COUNT(*)::NUMERIC / 
        (SELECT COUNT(*) FROM netflix_details WHERE country = 'India')::NUMERIC * 100, 2
    ) AS avg_count_per_year
FROM netflix_details
WHERE country = 'India'
GROUP BY 1
ORDER BY 1;

-- Q11. List all Movies that are Documentaries
SELECT * FROM netflix_details
WHERE listed_in ILIKE '%Documentaries%';

-- Q12. Find all content without a Director (NULL handling)
SELECT * FROM netflix_details
WHERE director IS NULL;

-- Q13. Find how many Movies Salman Khan appeared in 
--      over the last 10 years
SELECT * FROM netflix_details
WHERE cast ILIKE '%Salman Khan%'
AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;

-- Q14. Find the Top 10 actors with the highest number 
--      of Movies produced in India
SELECT 
    UNNEST(string_to_array(cast, ',')) AS actor,
    COUNT(*) AS total_count
FROM netflix_details
WHERE country ILIKE '%India%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Q15. Categorize content as 'Bad Content' or 'Good Content'
--      based on keywords 'kill' or 'violence' in description
WITH categorized AS (
    SELECT *,
        CASE 
            WHEN description ILIKE '%kill%'
              OR description ILIKE '%violence%' 
            THEN 'Bad Content'
            ELSE 'Good Content'
        END AS category
    FROM netflix_details
)
SELECT category, COUNT(*) AS total_content
FROM categorized
GROUP BY 1;
