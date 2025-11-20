CREATE OR REFRESH STREAMING TABLE transactions_raw
AS SELECT * FROM STREAM read_files(
                          '/Volumes/workspace/retail/dataset/transactions/',
                          format => 'csv');

CREATE OR REFRESH MATERIALIZED VIEW customers
AS SELECT * FROM read_files(
                  '/Volumes/workspace/retail/dataset/Customer.csv',
                  format => 'csv');