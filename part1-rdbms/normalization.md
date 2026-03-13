## Anomaly Analysis

### Insert Anomaly
If a new product needs to be added but no order exists yet, it cannot be inserted into the table because product information is stored only when an order is placed.

Example:
Columns: product_id, product_name, price
Without an order_id the product cannot be stored.

### Update Anomaly
If the price of a product changes, it must be updated in multiple rows.

Example:
Product "Laptop" appears in rows 5, 12, and 18.  
If the price changes from 50000 to 52000, all rows must be updated.  
If one row is missed, inconsistent data will occur.

### Delete Anomaly
If the last order of a product is deleted, product information will also be lost.

Example:
Deleting order_id = 101 may remove product details for that product entirely.