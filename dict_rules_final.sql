-- The script can be executed to create database objects and 
-- illustrate SonarQube PL/SQL analysis triggering rules
-- based on Oracle Data Dictionary (S3641, S3921, S3618, S3651).
-- Once the script is executed under given schema the analysis can be configured similar to
-- what we have in sonar-project.properties (in this example
-- we assume that Oracle driver is present in the folder from
-- which analysis is triggered

-----------------
-- plsql:S3641 --
-----------------
CREATE TABLE my_table (my_column VARCHAR2(10));
CREATE TABLE another_table (nullable_column VARCHAR2(10),ID INT);
-- Noncompliant; "nullable_column" may contain 'NULL' value and the whole SELECT query will return nothing
SELECT * FROM my_table WHERE my_column NOT IN (SELECT nullable_column FROM another_table);
--------------


-----------------
-- plsql:S3921 --
-----------------
create table persons (id number, name varchar2(4));
insert into persons (id, name) values (1, 'Alice'); -- Noncompliant, raises ORA-12899 -- LENGHT('Alice') > 4

-----------------
-- plsql:S3618 --
-----------------
CREATE TABLE my_table_1 (N1 INT, N2 INT NOT NULL, N3 INT DEFAULT 3 NOT NULL);
-- With the table MY_TABLE_1 having a NOT NULL column N2 without default value and a NOT NULL column N3 with default value:
INSERT INTO MY_TABLE_1 (N1) VALUES (1); -- Noncompliant; N2 value omitted


-----------------
-- plsql:S3651 --
-----------------
CREATE TABLE product (id INT, name VARCHAR2(6) NOT NULL, mfg_name VARCHAR2(6), mfg_id INT);
-- First condition always true, second always false so redundant
SELECT name FROM product WHERE name is not null AND mfg_name = 'Too long name';