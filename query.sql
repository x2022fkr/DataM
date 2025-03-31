SELECT p.PostID,
       p.Title,
       u.Username AS PostedBy,
       p.PostedOn
FROM Posts p
JOIN Users u
    ON p.UserID = u.UserID;

SELECT p.PostID,
       p.Title,
       COUNT(c.CommentID) AS CommentCount
FROM Posts p
LEFT JOIN Comments c
    ON p.PostID = c.PostID
GROUP BY p.PostID, p.Title;

SELECT t.TransactionID,
       u.Username,
       t.Amount,
       t.TransactionDate,
       (t.Amount * 0.15) AS EstimatedTax
FROM EcommerceTransaction t
JOIN Users u
    ON t.UserID = u.UserID;

SELECT u.Username,
       a.AdTitle,
       COUNT(v.ViewDateID) AS TimesViewed
FROM Users u
JOIN ViewDate v
    ON u.UserID = v.UserID
JOIN Ads a
    ON a.AdID = v.AdID
GROUP BY u.Username, a.AdTitle;

SELECT m.MessageID,
       sender.Username   AS SenderName,
       receiver.Username AS ReceiverName,
       m.Content,
       m.SentOn
FROM Messages m
JOIN Users sender
    ON m.SenderID = sender.UserID
JOIN Users receiver
    ON m.ReceiverID = receiver.UserID;
