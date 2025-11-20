CREATE OR REFRESH MATERIALIZED VIEW monthly_sales
AS
  SELECT trunc(transaction_date, 'MM') transaction_month, sum(total_amt) sales
  FROM LIVE.transactions_cleaned
  GROUP BY transaction_month;


CREATE OR REFRESH MATERIALIZED VIEW stores_statistics
AS
  SELECT Store_type, Gender, count(*) transaction_count
  FROM LIVE.transactions_cleaned
  GROUP BY Store_type, Gender