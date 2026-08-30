--Each person runs it locally against their own Postgres instance to get an identical schema:
--psql -U postgres -d medtracker -f schema.sql
            --        ^^^^^^^^^^DB name in pgAdmin4/postgresql!!

-- once you've run the schema.sql against your Postgres, you run this line in the models/ directory : drogon_ctl create model
-- it connects to the DB and reads any tables created and generates a cpp class per table, you also 
-- run this line after the previous line if there has been a change in this file

-- schema.sql ->  run against your local Postgres ->  tables exist -> drogon_ctl create model models →  C++ model classes

-- now that these cpp classes exist of out DB tables along with built-in methods, in the controller code
-- you can use cpp instead of raw sql.

-- the purpose of this file is for the whole group to end up with identical tables 
-- in each local pgAdmin4/postgreSQL, than to manually create them . it also helps
-- if one of us needs to update the schema for a table, theyll make the change let the
-- team know and the rest of the team will pull and update their local files with the 
-- update to stay in sync.

--example
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);