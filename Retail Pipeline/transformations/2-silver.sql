CREATE OR REFRESH STREAMING TABLE transactions_cleaned (
  CONSTRAINT valid_quantity EXPECT (quantity > 0) ON VIOLATION DROP ROW,
  CONSTRAINT valid_gender EXPECT (Gender IS NOT NULL) ON VIOLATION DROP ROW,
  CONSTRAINT valid_transaction_id EXPECT (transaction_id IS NOT NULL) ON VIOLATION FAIL UPDATE
)
AS
  SELECT transaction_id, Qty AS quantity, total_amt, Store_type,
        to_date(replace(tran_date, '/', '-'), 'd-M-yyyy') AS transaction_date,
        Gender, current_date() - c.DOB AS customer_age
  FROM STREAM(transactions_raw) t
  INNER JOIN customers c
  ON t.cust_id = c.customer_Id