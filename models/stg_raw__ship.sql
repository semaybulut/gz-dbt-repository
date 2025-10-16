with
    source as (select * from {{ source("raw", "ship") }}),
    renamed as (
        select
            orders_id,
            shipping_fee,
            logcost as log_cost,
            cast(ship_cost as int64) as ship_cost
        from source
    )
select *
from
    renamed

    -- ship dönüşümleri için, BigQuery'de shipping_fee ile shipping_fee_1 arasındaki
    -- farkı kontrol edin:
    -- SELECT
    -- *
    -- FROM data-analytics-bootcamp-363212.gz_raw_data.raw_gz_ship
    -- WHERE shipping_fee <> shipping_fee_1
    -- Hiçbir satır döndürmez. Bu, iki sütundaki verilerin tam olarak aynı olduğu
    -- anlamına gelir. DBT'deki sorgudan shipping_fee_1'i kaldırabilirsiniz.
    
