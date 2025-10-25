with source as (
    select * from {{ ref('telecom_zipcode_population') }}
),

renamed as (
    select
        "Zip Code" as zip_code,
        "Population" as population
    from source
)

select * from renamed


