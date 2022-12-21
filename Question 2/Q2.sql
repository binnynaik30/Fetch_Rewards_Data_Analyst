-- Top 5 Brands in the most recent month
SELECT top 5
	i.brandCode,
	SUM(ti.finalPrice) AS spend
FROM transactionItems AS ti
INNER JOIN (SELECT month(MAX(dateScanned)) - 1 m, year(MAX(dateScanned)) y FROM receipts) AS recent ON 1 = 1
INNER JOIN transactions AS t ON ti.transactionId = t.id
INNER JOIN receipts AS r ON t.receiptId = r.id AND month(r.dateScanned) = recent.m AND year(r.dateScanned) = recent.y
INNER JOIN items AS i ON ti.barcode = i.barcode
GROUP BY i.brandCode
ORDER BY spend DESC

-- Top 5 Brands in the prior to the most recent month
SELECT top 5
	i.brandCode,
	SUM(ti.finalPrice) AS spend
FROM transactionItems AS ti
INNER JOIN (SELECT month(MAX(dateScanned)) - 2 m, year(MAX(dateScanned)) y FROM receipts) AS recent ON 1 = 1
INNER JOIN transactions AS t ON ti.transactionId = t.id
INNER JOIN receipts AS r ON t.receiptId = r.id AND month(r.dateScanned) = recent.m AND year(r.dateScanned) = recent.y
INNER JOIN items AS i ON ti.barcode = i.barcode
GROUP BY i.brandCode
ORDER BY spend DESC

-- By comparing the results of the above queries, we can compare the ranking of the top 5 brands.
