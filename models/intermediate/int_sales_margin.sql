--satın_alma_maliyeti ve marj hesaplamalarını gerçekleştirin.
--Önceki iki modeli bağlamak için hangi tür JOIN kullanmalısınız?
--left ile. sales ana tablo, product eklenecek tablo.

SELECT
  s.products_id,
  s.date_date,
  s.orders_id,
  s.revenue,
  s.quantity,
  p.purchase_price,
  ROUND (s.quantity*p.purchase_price,2) AS purchase_cost,
  ROUND (s.revenue - s.quantity*p.purchase_price,2) AS margin
  FROM {{ref("stg_raw__sales")}}  AS s
  LEFT JOIN {{ref("stg_raw__product")}} AS p
      USING (products_id)
