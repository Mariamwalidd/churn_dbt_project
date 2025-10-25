select
    senior_citizen,
    round(avg(monthlycharges), 2) as avg_monthly_charge,
    sum(case when churn = 'Yes' then 1 else 0 end) as churned_customers,
    count(*) as total_customers,
    round(sum(case when churn = 'Yes' then 1 else 0 end)*100.0/count(*), 2) as churn_percentage
from {{ ref('stg_customer_churn') }}
group by 1
