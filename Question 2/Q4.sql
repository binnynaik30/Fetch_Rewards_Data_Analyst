SELECT COUNT(purchasedItemCount)
FROM Receipts
WHERE rewardsReceiptStatus = 'Accepted'

SELECT COUNT(purchasedItemCount)
FROM Receipts
WHERE rewardsReceiptStatus = 'Rejected'

-- We can compare the above two numbers and then find the highest number of total Items purchased for both Accepted & Reject Reward Receipt Status.
