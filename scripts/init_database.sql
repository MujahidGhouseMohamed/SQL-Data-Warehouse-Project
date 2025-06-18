/*
=============================================================
Create Database and Schemas (PostgreSQL Version)
=============================================================
Script Purpose:
    This script creates a new database named 'datawarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'datawarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

-- Connect to default 'postgres' database to manage other databases
\c postgres;

-- Drop and recreate the 'datawarehouse' database
DROP DATABASE IF EXISTS datawarehouse;
CREATE DATABASE datawarehouse;

-- Connect to the newly created 'datawarehouse' database
\c datawarehouse;

-- Confirm current database
SELECT current_database();

-- Create Schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
