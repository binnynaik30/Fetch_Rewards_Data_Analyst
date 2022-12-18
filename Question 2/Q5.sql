SELECT User.user_id, Users.createdDate, Receipts.receipt_id as rid, Receipts.totalSpent, Transaction.receipt_id as tid, Transaction.brand_id as tbid, brand._id
FROM 
((( Users JOIN Receipts ON User.user_id = Receipts.userid)
JOIN Transactions on tid = Receipts.receipt_id)
JOIN Brands on Brand.brand_id = tbid)
Top (totalSpent)
WHERE createdDate = Dateadd(Month, datediff(Month, 0, Dateadd(m, -6, current_timestamp)), 0)
