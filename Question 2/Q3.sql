SELECT "rewardsReceiptStatus", SUM("purchasedItemCount") totalItemsPurchased ,AVG("totalSpent") avg_totalSpent 
FROM "Receipts" 
WHERE "rewardsReceiptStatus" in ('REJECTED','FINISHED') AND COALESCE("totalSpent") > 0  AND COALESCE("purchasedItemCount") > 0
GROUP BY "rewardsReceiptStatus"
