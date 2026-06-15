WITH top_paying_jobs as (
    SELECT 
        job_id,
        job_country,
        job_title_short,
        salary_year_avg,
        name as company_name
    from job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id=company_dim.company_id
    where job_title_short IN('Data Analyst','Business Analyst') AND
        job_location= 'India' AND
        salary_year_avg IS NOT NULL 
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*,
        skills
from top_paying_jobs
inner JOIN skills_job_dim on skills_job_dim.job_id=top_paying_jobs.job_id
inner JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id