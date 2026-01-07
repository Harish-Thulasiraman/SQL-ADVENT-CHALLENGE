-- SQL Advent Calendar - Day 5
-- Title: Elf Vacation Status
-- Difficulty: medium
--
-- Question:
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
--
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
--

-- Table Schema:
-- Table: elves
--   elf_id: INT
--   elf_name: VARCHAR
--
-- Table: vacations
--   elf_id: INT
--   start_date: DATE
--   return_date: DATE
--

-- My Solution:
SQLite(Used SQLite because PGsql doesnt allowed solution in two column as described, need to check on that later)

SELECT 
    e.elf_name,
    COALESCE(return_date, 'Still resting') AS returned_date
FROM elves AS e
LEFT JOIN vacations AS v
ON e.elf_id = v.elf_id;
