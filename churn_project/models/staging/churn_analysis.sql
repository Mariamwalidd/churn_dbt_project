with customers as (
    select * from {{ ref('stg_customer_churn') }}
),
zips as (
    select * from {{ ref('stg_zip_population') }}
)

select
    gender,
    senior_citizen,
    round(avg(monthlycharges),2) as avg_monthly_charge,
    count(case when churn = 'Yes' then 1 end)*1.0/count(*) as churn_rate
from customers
group by 1,2
