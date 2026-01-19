-- SQL Advent Calendar - Day 20
-- Title: Hot Cocoa Break Logs
-- Difficulty: medium
--
-- Question:
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--

-- Table Schema:
-- Table: cocoa_logs
--   log_id: INT
--   break_id: INT
--   cocoa_id: INT
--
-- Table: break_schedule
--   break_id: INT
--   location_id: INT
--
-- Table: cocoa_types
--   cocoa_id: INT
--   cocoa_name: VARCHAR
--
-- Table: locations
--   location_id: INT
--   location_name: VARCHAR
--

-- My Solution:

PostgreSQL:

--SFWGHOL
SELECT t1.break_id, t2.location_id, 
  t3.cocoa_name,
  t4.location_name
FROM cocoa_logs AS t1
INNER JOIN break_schedule AS t2 ON t1.break_id = t2.break_id
INNER JOIN cocoa_types AS t3 ON t3.cocoa_id = t1.cocoa_id
INNER JOIN locations AS t4 ON t4.location_id = t2.location_id
