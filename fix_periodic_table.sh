#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#rename weight column to atomic_mass
RENAME_WEIGHT_COLUMN_RESULT=$($PSQL "ALTER TABLE properties RENAME weight TO atomic_mass")

#Rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius
RENAME_MELTING_POINT_COLUMN_RESULT=$($PSQL "ALTER TABLE properties RENAME melting_point TO melting_point_celsius")
RENAME_BOILING_POINT_COLUMN_RESULT=$($PSQL "ALTER TABLE properties RENAME boiling_point TO boiling_point_celsius")

#Melting_point_celsius and boiling_point_celsius columns should not accept null values
ADD_CONSTRAINT_MELTING_POINT_COLUMN_RESULT=$($PSQL "ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL")
ADD_CONSTRAINT_BOILING_POINT_COLUMN_RESULT=$($PSQL "ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL")

#You should add the UNIQUE constraint to the symbol and name columns from the elements table
ADD_UNIQUE_CONSTRAINT_SYMBOL_NAME_RESULT=$($PSQL "ALTER TABLE elements ADD CONSTRAINT unique_symbol_name UNIQUE (symbol, name)")

#Your symbol and name columns should have the NOT NULL constraint
ADD_NOT_NULL_CONSTRAINT_SYMBOL_RESULT=$($PSQL "ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL")
ADD_NOT_NULL_CONSTRAINT_NAME_RESULT=$($PSQL "ALTER TABLE elements ALTER COLUMN name SET NOT NULL")

#You should set the atomic_number column from the properties table as a foreign key that references the column of the same name in the elements table
ADD_FOREIGN_KEY_ATOMIC_NUMBER_RESULT=$($PSQL "ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number)")

#You should create a types table that will store the three types of elements
#Your types table should have a type_id column that is an integer and the primary key
#Your types table should have a type column that's a VARCHAR and cannot be null. It will store the different types from the type column in the properties table
CREATE_TYPES_TABLE_RESULT=$($PSQL "CREATE TABLE types(type_id INT PRIMARY KEY, type VARCHAR(30) NOT NULL)")

#You should add three rows to your types table whose values are the three different types from the properties table
INSERT_ROWS_TYPES_RESULT=$($PSQL "INSERT INTO types(type_id, type) VALUES(1, 'nonmetal'),(2, 'metal'),(3, 'metalloid')")

#Your properties table should have a type_id foreign key column that references the type_id column from the types table. It should be an INT with the NOT NULL constraint
# Add the type_id column first without NOT NULL constraint
ADD_ID_RESULT=$($PSQL "ALTER TABLE properties ADD COLUMN type_id INT")

# Update existing rows by matching the type column to the types table
UPDATE_TYPE_ID_RESULT=$($PSQL "UPDATE properties SET type_id = (SELECT type_id FROM types WHERE types.type = properties.type)")

# Add NOT NULL constraint and foreign key
ADD_CONSTRAINTS_RESULT=$($PSQL "ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL, ADD FOREIGN KEY(type_id) REFERENCES types(type_id)")

# drop the old type column since it's now replaced by type_id and the types table
DROP_TYPE_RESULT=$($PSQL "ALTER TABLE properties DROP COLUMN type")

#You should capitalize the first letter of all the symbol values in the elements table. Be careful to only capitalize the letter and not change any others
CAPITALIZE_RESULT=$($PSQL "UPDATE elements SET symbol = CONCAT(
        UPPER(SUBSTRING(symbol, 1, 1)),
        LOWER(SUBSTRING(symbol, 2, LENGTH(symbol)))
    )")

# You should remove all the trailing zeros after the decimals from each row of the atomic_mass column. You may need to adjust a data type to DECIMAL for this. The final values they should be are in the atomic_mass.txt file
CONVERT_TO_DECIMAL_RESULT=$($PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass TYPE REAL")

#You should add the element with atomic number 9 to your database. Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal
INSERT_FLUORINE1_RESULT=$($PSQL "INSERT INTO elements(atomic_number,symbol,name) VALUES(9, 'F', 'Fluorine')")
INSERT_FLUORINE2_RESULT=$($PSQL "INSERT INTO properties(atomic_number,type,atomic_mass,melting_point_celsius,boiling_point_celsius,type_id) VALUES(9, 'nonmetal', 18.998, -220, -188.1,1)")

#You should add the element with atomic number 10 to your database. Its name is Neon, symbol is Ne, mass is 20.18, melting point is -248.6, boiling point is -246.1, and it's a nonmetal
INSERT_NEON1_RESULT=$($PSQL "INSERT INTO elements(atomic_number,symbol,name) VALUES(10, 'Ne', 'Neon')")
INSERT_NEON2_RESULT=$($PSQL "INSERT INTO properties(atomic_number,type,atomic_mass,melting_point_celsius,boiling_point_celsius,type_id) VALUES(10, 'nonmetal', 20.18, -248.6, -246.1,1)")

#You should delete the non existent element, whose atomic_number is 1000, from the two tables
DELETE_ROW_PROPERTIES=$($PSQL "DELETE FROM properties WHERE atomic_number=1000")
DELETE_ROW_PROPERTIES=$($PSQL "DELETE FROM elements WHERE atomic_number=1000")

