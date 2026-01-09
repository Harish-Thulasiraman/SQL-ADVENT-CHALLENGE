-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:
PostgreSQL Solution:
WITH daily_counts AS(
  SELECT 
    DATE(sent_at) AS message_date, 
    sender_id,
    COUNT(*) AS total_messages,
  
    RANK() OVER( 
      PARTITION BY DATE(sent_at) 
      ORDER BY COUNT(*) DESC 
  ) AS rnk_messages
  FROM npn_messages
  GROUP BY DATE(sent_at), sender_id 
)
-- top-ranked users
SELECT
  dc.message_date,
  u.user_name,
  dc.total_messages
FROM daily_counts dc
JOIN npn_users u
  ON dc.sender_id = u.user_id
WHERE dc.rnk_messages = 1  
ORDER BY dc.message_date;
