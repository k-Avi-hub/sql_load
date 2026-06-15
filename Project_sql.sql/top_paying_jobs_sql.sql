SELECT 
    job_id,
    job_country,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
from job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id=company_dim.company_id
where job_title_short IN('Data Analyst','Business Analyst') AND
    job_location= 'India' AND
    salary_year_avg IS NOT NULL 
ORDER BY 
    salary_year_avg DESC
LIMIT 10


![Top Paying Jobs Result](screenshots/top_paying_jobs_result.png)
