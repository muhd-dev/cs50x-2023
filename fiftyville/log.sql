-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Verifying the crime description for the incident at the specified location and time.
SELECT description
FROM crime_scene_reports
WHERE year = 2021
AND month = 7
AND day = 28
AND street = 'Humphrey Street';

-- On that day, two incidents occurred, one involving theft and the other related to littering.
-- Considering the possibility that witnesses might be accomplices. Retrieving witness names from the interviews table and reviewing their interview transcripts.
SELECT name, transcript
FROM interviews
WHERE year = 2021
AND month = 7
AND day = 28;

-- Identifying two transcripts associated with the name "Eugene." To ascertain the number of individuals named Eugene, cross-referencing the 'people' table.
SELECT name
FROM people
WHERE name = 'Eugene';

-- Establishing the presence of a single individual named Eugene, proceeding accordingly.
-- Extracting the names of the three witnesses from the list of interviewees on July 28, 2021. The crime report indicated that these witnesses mentioned "bakery" in their statements. The results are ordered alphabetically by witness names.
SELECT name, transcript
FROM interviews
WHERE year = 2021
AND month = 7
AND day = 28
AND transcript LIKE '%bakery%'
ORDER BY name;

-- The witnesses are identified as Eugene, Raymond, and Ruth.
-- Eugene's clues suggest that the thief withdrew money from an ATM on Leggett Street. To identify the account holder, we check the account number associated with that transaction.
SELECT account_number, amount
FROM atm_transactions
WHERE year = 2021
AND month = 7
AND day = 28
AND atm_location = 'Leggett Street'
AND transaction_type = 'withdraw';

-- Identifying account holders linked to the respective account numbers and adding them to the 'Suspect List.'
SELECT name, atm_transactions.amount
FROM people
JOIN bank_accounts
ON people.id = bank_accounts.person_id
JOIN atm_transactions
ON bank_accounts.account_number = atm_transactions.account_number
WHERE atm_transactions.year = 2021
AND atm_transactions.month = 7
AND atm_transactions.day = 28
AND atm_transactions.atm_location = 'Leggett Street'
AND atm_transactions.transaction_type = 'withdraw';

-- Raymond's information reveals that after leaving the bakery, the perpetrator made a brief phone call, instructing the person on the other end to purchase an early flight ticket for July 29, 2021.
-- Initial step involves obtaining details about the airport in Fiftyville, which would serve as the departure point for the thief's flight.
SELECT abbreviation, full_name, city
FROM airports
WHERE city = 'Fiftyville';

-- Identifying flights departing from the Fiftyville airport on July 29 and sorting them chronologically.
SELECT flights.id, full_name, city, flights.hour, flights.minute
FROM airports
JOIN flights
ON airports.id = flights.destination_airport_id
WHERE flights.origin_airport_id =
(SELECT id
FROM airports
WHERE city = 'Fiftyville')
AND flights.year = 2021
AND flights.month = 7
AND flights.day = 29
ORDER BY flights.hour, flights.minute;

-- The first flight, departing at 8:20, is destined for LaGuardia Airport in New York City (Flight id- 36). This could be the thief's destination.
-- Further investigation involves examining the passenger list for this flight and adding them to the 'Suspect List,' ordered by passport numbers.
SELECT passengers.flight_id, name, passengers.passport_number, passengers.seat
FROM people
JOIN passengers
ON people.passport_number = passengers.passport_number
JOIN flights
ON passengers.flight_id = flights.id
WHERE flights.year = 2021
AND flights.month = 7
AND flights.day = 29
AND flights.hour = 8
AND flights.minute = 20
ORDER BY passengers.passport_number;

-- Scrutinizing phone call records to identify the person who purchased the tickets.
-- Initially, exploring potential callers' names and adding them to the 'Suspect List,' ordered by call durations.
SELECT name, phone_calls.duration
FROM people
JOIN phone_calls
ON people.phone_number = phone_calls.caller
WHERE phone_calls.year = 2021
AND phone_calls.month = 7
AND phone_calls.day = 28
AND phone_calls.duration <= 60
ORDER BY phone_calls.duration;

-- Subsequently, examining possible call receivers' names, sorted by call durations.
SELECT name, phone_calls.duration
FROM people
JOIN phone_calls
ON people.phone_number = phone_calls.receiver
WHERE phone_calls.year = 2021
AND phone_calls.month = 7
AND phone_calls.day = 28
AND phone_calls.duration <= 60
ORDER BY phone_calls.duration;

-- Ruth's information indicates that the thief left the bakery in a car within 10 minutes of the theft. To identify suspects, we examine license plates of cars during that timeframe and determine their owners.
SELECT name, bakery_security_logs.hour, bakery_security_logs.minute
FROM people
JOIN bakery_security_logs
ON people.license_plate = bakery_security_logs.license_plate
WHERE bakery_security_logs.year = 2021
AND bakery_security_logs.month = 7
AND bakery_security_logs.day = 28
AND bakery_security_logs.activity = 'exit'
AND bakery_security_logs.hour = 10
AND bakery_security_logs.minute >= 15
AND bakery_security_logs.minute <= 25
ORDER BY bakery_security_logs.minute;

-- Bruce is likely the thief, as he appears in all four lists: passenger list, specific ATM transaction list, call list, and car departure list from the bakery.
-- He is likely to have fled to New York City, taking the corresponding flight.
-- Robin might be Bruce's accomplice, responsible for purchasing the flight ticket and assisting Bruce's escape to New York City.