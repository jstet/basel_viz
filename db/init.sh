#!/bin/bash
set -e
export PGPASSWORD=$POSTGRES_PASSWORD;
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"<<-EOSQL

 CREATE TABLE exports(
    id INT PRIMARY KEY,
    country VARCHAR(2),
    country_of_destination VARCHAR(2),
    year INT,  
    amount FLOAT,
    H1 BOOLEAN,
    H3 BOOLEAN,
    H4_1 BOOLEAN,
    H4_2 BOOLEAN,
    H4_3 BOOLEAN,
    H5_1 BOOLEAN,
    H5_2 BOOLEAN,
    H6_1 BOOLEAN,
    H6_2 BOOLEAN,
    H8 BOOLEAN,
    H10 BOOLEAN,
    H11 BOOLEAN,
    H12 BOOLEAN,
    H13 BOOLEAN,
    D1 BOOLEAN,
    D2 BOOLEAN,
    D3 BOOLEAN,
    D4 BOOLEAN,
    D5 BOOLEAN,
    D6 BOOLEAN,
    D7 BOOLEAN,
    D8 BOOLEAN,
    D9 BOOLEAN,
    D10 BOOLEAN,
    D11 BOOLEAN,
    D12 BOOLEAN,
    D13 BOOLEAN,
    D14 BOOLEAN,
    D15 BOOLEAN,
    D16 BOOLEAN,
    R1 BOOLEAN,
    R2 BOOLEAN,
    R3 BOOLEAN,
    R4 BOOLEAN,
    R5 BOOLEAN,
    R6 BOOLEAN,
    R7 BOOLEAN,
    R8 BOOLEAN,
    R9 BOOLEAN,
    R10 BOOLEAN,
    R11 BOOLEAN,
    R12 BOOLEAN,
    R13 BOOLEAN
    );
  
COPY exports(id, country, country_of_destination, year, amount,H1,H3,H4_1,H4_2,H4_3,H5_1,H5_2,H6_1,H6_2,H8,H10,H11,H12,H13,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13)
FROM '/data/exports.csv'
CSV HEADER DELIMITER ',';
  
EOSQL
