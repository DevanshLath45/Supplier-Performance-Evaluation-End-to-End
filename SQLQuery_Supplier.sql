USE inventory

-- See all Tables 

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES

-- See column names from each table

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sales';

-- DATA CLEANING

-- Changing Column names in sales table

SELECT TOP 5 * FROM sales;

EXEC sp_rename 'sales.InventoryId', 'inventory_id', 'COLUMN';
EXEC sp_rename 'sales.Store', 'store_id', 'COLUMN';
EXEC sp_rename 'sales.Brand', 'brand_id', 'COLUMN';
EXEC sp_rename 'sales.Description', 'brand_name', 'COLUMN';
EXEC sp_rename 'sales.Size', 'size', 'COLUMN';
EXEC sp_rename 'sales.SalesQuantity', 'quantity', 'COLUMN';
EXEC sp_rename 'sales.SalesPrice', 'selling_price', 'COLUMN';
EXEC sp_rename 'sales.SalesDollars', 'sales_revenue', 'COLUMN';
EXEC sp_rename 'sales.SalesDate', 'sale_date', 'COLUMN';
EXEC sp_rename 'sales.Volume', 'volume', 'COLUMN';
EXEC sp_rename 'sales.Classification', 'classification', 'COLUMN';
EXEC sp_rename 'sales.ExciseTax', 'excise_tax', 'COLUMN';
EXEC sp_rename 'sales.VendorNo', 'vendor_id', 'COLUMN';
EXEC sp_rename 'sales.VendorName', 'vendor_name', 'COLUMN';

-- Changing Column names in begin_inventory table

SELECT TOP 5 * FROM begin_inventory;

EXEC sp_rename 'begin_inventory.InventoryId', 'inventory_id', 'COLUMN';
EXEC sp_rename 'begin_inventory.Store', 'store_id', 'COLUMN';
EXEC sp_rename 'begin_inventory.Brand', 'brand_id', 'COLUMN';
EXEC sp_rename 'begin_inventory.City', 'city', 'COLUMN';
EXEC sp_rename 'begin_inventory.Description', 'brand_name', 'COLUMN';
EXEC sp_rename 'begin_inventory.Size', 'size', 'COLUMN';
EXEC sp_rename 'begin_inventory.onHand', 'on_hand', 'COLUMN';
EXEC sp_rename 'begin_inventory.Price', 'price', 'COLUMN';
EXEC sp_rename 'begin_inventory.startDate', 'start_date', 'COLUMN';

-- Changing Column names in end_inventory table

SELECT TOP 5 * FROM end_inventory;

EXEC sp_rename 'end_inventory.InventoryId', 'inventory_id', 'COLUMN';
EXEC sp_rename 'end_inventory.Store', 'store_id', 'COLUMN';
EXEC sp_rename 'end_inventory.Brand', 'brand_id', 'COLUMN';
EXEC sp_rename 'end_inventory.City', 'city', 'COLUMN';
EXEC sp_rename 'end_inventory.Description', 'brand_name', 'COLUMN';
EXEC sp_rename 'end_inventory.Size', 'size', 'COLUMN';
EXEC sp_rename 'end_inventory.onHand', 'on_hand', 'COLUMN';
EXEC sp_rename 'end_inventory.Price', 'price', 'COLUMN';
EXEC sp_rename 'end_inventory.endDate', 'end_date', 'COLUMN';

-- Changing Column names in purchase_prices table

SELECT TOP 5 * FROM purchase_prices;

EXEC sp_rename 'purchase_prices.Brand', 'brand_id', 'COLUMN';
EXEC sp_rename 'purchase_prices.Description', 'brand_name', 'COLUMN';
EXEC sp_rename 'purchase_prices.Price', 'price', 'COLUMN';
EXEC sp_rename 'purchase_prices.Size', 'size', 'COLUMN';
EXEC sp_rename 'purchase_prices.Volume', 'volume', 'COLUMN';
EXEC sp_rename 'purchase_prices.Classification', 'classification', 'COLUMN';
EXEC sp_rename 'purchase_prices.PurchasePrice', 'purchase_price', 'COLUMN';
EXEC sp_rename 'purchase_prices.VendorNumber', 'vendor_id', 'COLUMN';
EXEC sp_rename 'purchase_prices.VendorName', 'vendor_name', 'COLUMN';

-- Changing Column names in purchases table

SELECT TOP 5 * FROM purchases;

EXEC sp_rename 'purchases.InventoryId', 'inventory_id', 'COLUMN';
EXEC sp_rename 'purchases.Store', 'store_id', 'COLUMN';
EXEC sp_rename 'purchases.Brand', 'brand_id', 'COLUMN';
EXEC sp_rename 'purchases.Description', 'brand_name', 'COLUMN';
EXEC sp_rename 'purchases.Size', 'size', 'COLUMN';
EXEC sp_rename 'purchases.VendorNumber', 'vendor_id', 'COLUMN';
EXEC sp_rename 'purchases.VendorName', 'vendor_name', 'COLUMN';
EXEC sp_rename 'purchases.PONumber', 'purchase_order_id', 'COLUMN';
EXEC sp_rename 'purchases.PODate', 'purchase_order_date', 'COLUMN';
EXEC sp_rename 'purchases.ReceivingDate', 'receiving_date', 'COLUMN';
EXEC sp_rename 'purchases.InvoiceDate', 'invoice_date', 'COLUMN';
EXEC sp_rename 'purchases.PayDate', 'pay_date', 'COLUMN';
EXEC sp_rename 'purchases.PurchasePrice', 'purchase_price', 'COLUMN';
EXEC sp_rename 'purchases.Quantity', 'quantity', 'COLUMN';
EXEC sp_rename 'purchases.Dollars', 'dollars', 'COLUMN';
EXEC sp_rename 'purchases.Classification', 'classification', 'COLUMN';

-- Changing Column names in vendor_invoice table

SELECT TOP 5 * FROM vendor_invoice;

EXEC sp_rename 'vendor_invoice.VendorNumber', 'vendor_id', 'COLUMN';
EXEC sp_rename 'vendor_invoice.VendorName', 'vendor_name', 'COLUMN';
EXEC sp_rename 'vendor_invoice.InvoiceDate', 'invoice_date', 'COLUMN';
EXEC sp_rename 'vendor_invoice.PONumber', 'purchase_order_id', 'COLUMN';
EXEC sp_rename 'vendor_invoice.PODate', 'purchase_order_date', 'COLUMN';
EXEC sp_rename 'vendor_invoice.PayDate', 'pay_date', 'COLUMN';
EXEC sp_rename 'vendor_invoice.Quantity', 'quantity', 'COLUMN';
EXEC sp_rename 'vendor_invoice.Dollars', 'dollars', 'COLUMN';
EXEC sp_rename 'vendor_invoice.Freight', 'freight', 'COLUMN';
EXEC sp_rename 'vendor_invoice.Approval', 'approval', 'COLUMN';

--Table Overview

SELECT TOP 5 * FROM sales
SELECT TOP 5 * FROM purchase_prices
SELECT TOP 5 * FROM purchases
SELECT TOP 5 * FROM vendor_invoice
SELECT TOP 5 * FROM begin_inventory
SELECT TOP 5 * FROM end_inventory

SELECT DISTINCT start_date FROM begin_inventory;
SELECT DISTINCT end_date FROM end_inventory;
--Since begin and end inventory tables doesnot show day wise data throughout the year, we will not use these tables in our analysis as the data is insufficient.

--Quick tables Overview

SELECT * FROM sales
WHERE vendor_id = 4466

SELECT * FROM purchase_prices
WHERE vendor_id = 4466

SELECT * FROM purchases
WHERE vendor_id = 4466

SELECT * FROM vendor_invoice
WHERE vendor_id = 4466

--Looking at similarities in purchase and purchase_price tables

SELECT * FROM purchase_prices    --Shows the purchase price and actual price of the brand
WHERE vendor_id = 4466

SELECT * FROM purchases   --Shows purchase_id, purchase_date, receiving_date, pay_date, purchase_price, qty, total_price
WHERE vendor_id = 4466

SELECT DISTINCT brand_id 
FROM purchases
WHERE vendor_id = 4466

SELECT brand_id, brand_name, purchase_price, SUM(quantity) AS total_qty, SUM(dollars) AS total_purchases
FROM purchases
WHERE vendor_id = 4466
GROUP BY brand_id, brand_name, purchase_price;
--This query shows that purchases table gives date wise purchase information of purchase_price

--CREATING AN AGGREGATED TABLE by merging:
--freight costs for each vendor
--purchase transactions made by vendors with actual price of brands
--sales transaction data

SELECT TOP 5 * FROM sales
SELECT TOP 5 * FROM purchase_prices
SELECT TOP 5 * FROM purchases
SELECT TOP 5 * FROM vendor_invoice

--1) Freight Costs for each vendor

SELECT vendor_id, vendor_name, ROUND(SUM(freight),2) AS freight_costs
FROM vendor_invoice
GROUP BY vendor_id, vendor_name

--2) Purchase transactions made by vendors

SELECT a.vendor_id, a.vendor_name, a.brand_id, a.brand_name, b.volume ,ROUND(b.price,2) AS actual_price, 
ROUND(b.purchase_price,2) AS purchased_price, SUM(quantity) AS total_qty, ROUND(SUM(dollars),2) AS total_purchases
FROM purchases AS a
INNER JOIN purchase_prices AS b
ON a.brand_id = b.brand_id
WHERE b.purchase_price > 0
GROUP BY a.vendor_id, a.vendor_name, a.brand_id, a.brand_name, b.price, b.purchase_price, b.volume
ORDER BY total_purchases

--3) Sales transactions made by vendors

SELECT vendor_id, vendor_name, brand_id, brand_name, selling_price ,SUM(quantity) AS qty_sold,
SUM(selling_price) AS total_sales_price, SUM(sales_revenue) AS total_revenue, SUM(excise_tax) AS total_excise_tax
FROM sales
GROUP BY vendor_id, vendor_name, brand_id, brand_name, selling_price;

--4) Making a FINAL AGGREGATED TABLE and Store back into Database using INTO

WITH Freight_Sum AS (
	SELECT vendor_id, vendor_name, ROUND(SUM(freight),2) AS total_freight_costs
	FROM vendor_invoice
	GROUP BY vendor_id, vendor_name
),
Purchase_Sum AS (
	SELECT a.vendor_id, a.vendor_name, a.brand_id, a.brand_name, b.volume,
	ROUND(MIN(b.price),2) AS actual_price_per_unit, 
	ROUND(MIN(b.purchase_price),2) AS purchased_price_per_unit, SUM(quantity) AS total_qty_purchased, 
	ROUND(SUM(dollars),2) AS total_purchases_amount
	FROM purchases AS a
	INNER JOIN purchase_prices AS b
	ON a.brand_id = b.brand_id
	WHERE b.purchase_price > 0
	GROUP BY a.vendor_id, a.vendor_name, a.brand_id, a.brand_name, b.volume
),
Sales_Sum AS (
	SELECT vendor_id, vendor_name, brand_id, brand_name,
	SUM(quantity) AS total_qty_sold,
	ROUND(MIN(selling_price),2) AS selling_price_per_unit, 
	ROUND(SUM(sales_revenue),2) AS total_sales_amount, 
	ROUND(SUM(selling_price),2) AS total_sales_price,
	ROUND(SUM(excise_tax),2) AS total_excise_tax
	FROM sales
	GROUP BY vendor_id, vendor_name, brand_id, brand_name
)
SELECT p.vendor_id, p.vendor_name, p.brand_id, p.brand_name, p.volume, p.actual_price_per_unit, p.purchased_price_per_unit,  
p.total_qty_purchased, p.total_purchases_amount,
s.selling_price_per_unit, s.total_qty_sold, s.total_sales_amount, s.total_sales_price, s.total_excise_tax, 
f.total_freight_costs
INTO supplier_performance_evaluation -- Makes a new table in Database and stores the data into it
FROM Purchase_Sum AS p
LEFT JOIN Sales_Sum AS s
ON p.vendor_id = s.vendor_id AND p.brand_id = s.brand_id
LEFT JOIN Freight_Sum AS f
ON p.vendor_id = f.vendor_id
ORDER BY p.total_purchases_amount DESC;

--5) Analyzing Aggregated Table

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM supplier_performance_evaluation
ORDER BY total_purchases_amount DESC

--6) Analyzing the Final Table

--Rounding to 2 decimal places for better readability

UPDATE supplier_performance_summary
SET
gross_profit_loss_amount = ROUND(gross_profit_loss_amount, 2);

SELECT * FROM supplier_performance_summary