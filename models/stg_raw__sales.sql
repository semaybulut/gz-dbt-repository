with
  source as (
    select * from {{ source('raw', 'sales') }}
  ),

  renamed as (
    select
      date_date,
      orders_id,
      pdt_id as products_id,  -- 💡 burada sütunu yeniden adlandırıyoruz
      revenue,
      quantity
    from source
  )
select * from renamed

