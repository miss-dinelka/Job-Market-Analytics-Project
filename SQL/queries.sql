
        -- JOB MARKET ANALYTICS --
              SQL ANALYSIS

-- Database: job_market_analytics
-- Table: job_postings
-- Dataset: 10,000 job postings


==========================================
1. DATASET OVERVIEW
==========================================


-- Total number of job postings
SELECT COUNT(*) AS total_jobs
FROM job_postings;


==========================================
2. JOB DISTRIBUTION
==========================================


-- Jobs by industry
SELECT 
    industry,
    COUNT(*) AS job_count
FROM job_postings
GROUP BY industry
ORDER BY job_count DESC;

This query ;
# Groups the 10,000 postings according to industry
# Counts the number of jobs in each industry
# Sorts them from highest to lowest


-- Jobs by location
SELECT 
    location,
    COUNT(*) AS job_count
FROM job_postings
GROUP BY location
ORDER BY job_count DESC;

This query ;
# Groups the postings according to location
# Counts jobs in each location
# Sorts them from highest to lowest 


==========================================
3. EMPLOYMENT CHARACTERISTICS
==========================================


-- Remote vs. non-remote jobs
SELECT
    remote_option,
    COUNT(*) AS job_count
FROM job_postings
GROUP BY remote_option
ORDER BY job_count DESC;


-- Jobs by company size
SELECT
    company_size,
    COUNT(*) AS job_count
FROM job_postings
GROUP BY company_size
ORDER BY job_count DESC;


-- Remote availability by industry
SELECT
    industry,
    remote_option,
    COUNT(*) AS job_count
FROM job_postings
GROUP BY industry, remote_option
ORDER BY industry, job_count DESC;


==========================================
4. SALARY ANALYSIS
==========================================

-- Minimum, maximum, and average salary
SELECT
    MIN(salary_usd) AS minimum_salary,
    MAX(salary_usd) AS maximum_salary,
    ROUND(AVG(salary_usd), 2) AS average_salary
FROM job_postings;


-- Average salary by industry
SELECT
    industry,
    ROUND(AVG(salary_usd), 2) AS average_salary
FROM job_postings
GROUP BY industry
ORDER BY average_salary DESC;


-- Average salary by job title
SELECT
    job_title,
    ROUND(AVG(salary_usd), 2) AS average_salary
FROM job_postings
GROUP BY job_title
ORDER BY average_salary DESC;


==========================================
5. SKILLS ANALYSIS
==========================================

-- Skill frequency
SELECT
    TRIM(SUBSTRING_INDEX(skills_required, ',', 1)) AS skill,
    COUNT(*) AS skill_count
FROM job_postings
GROUP BY skill

UNION ALL

SELECT
    TRIM(SUBSTRING_INDEX(skills_required, ',', -1)) AS skill,
    COUNT(*) AS skill_count
FROM job_postings
GROUP BY skill

ORDER BY skill_count DESC;

This query ;
# Extracts the first skill
# Extracts the second skill
# Counts how often each skill appears
# Combines the results
# Sorts them by frequency


==========================================
