-- reads lead_scoring.csv from bigquery
-- splits it into multiple tables 

-- populate cookie with random variable
--TODO: website_table(session_id, session_duration, cookie)
--TODO: create converted table
-- Converted - The target variable. Indicates whether a lead has been successfully converted or not.

-- TODO: Figure out a relational table structure (how are the tables related or connected? Will they all have the prospect_ID?)
-- TODO: create some fake data to add to the tables that you can then edit out in your dbt pipeline
-- TODO: figure out how to build a feature set in continual 
-- TODO: converted wouldn't just appear out of no where. it would be derived from payment system or something. 

-- THE CODE BELOW THIS WORKED. Each model is a select statement. Break out each "create table" into a select statement and name the file what you want the table to be named. 

select Prospect_ID, converted, GENERATE_UUID() as Cookie_ID 
from `continual-dev.dbt_brendan.lead_scoring`