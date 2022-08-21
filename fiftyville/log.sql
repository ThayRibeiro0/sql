-- Keep a log of any SQL queries you execute as you solve the mystery.

SELECT *
FROM crime_scene_reports
WHERE month = 7
AND day = 28
AND year = 2021
AND street = "Humphrey Street";

SELECT name, transcript
FROM interviews
WHERE month = 7
AND day = 28
AND year = 2021;

SELECT *
FROM bakery_security_logs
WHERE month = 7
AND day = 28
AND year = 2021
AND hour = 10
AND minute
BETWEEN 15
AND 26;

SELECT *
FROM atm_transactions
WHERE month = 7
AND day = 28
AND year = 2021
AND atm_location = "Leggett Street"
AND transaction_type = "withdraw";

SELECT *
FROM phone_calls
WHERE month = 7
AND day = 28
AND year = 2021
AND duration < 60;

SELECT *
FROM flights
WHERE month = 7
AND day = 29
AND year = 2021
ORDER BY hour, minute ASC;

SELECT *
FROM   people
WHERE  license_plate  IN
       (
              SELECT license_plate
              FROM   bakery_security_logs
              WHERE  month = 7
              AND    day = 28
              AND    year = 2021
              AND    hour = 10
              AND    minute BETWEEN 15 AND    26)
AND    people.id IN
       (
              SELECT person_id
              FROM   bank_accounts
              JOIN   people
              JOIN   atm_transactions
              ON     atm_transactions.account_number = bank_accounts.account_number
              WHERE  atm_transactions.month = 7
              AND    atm_transactions.day = 28
              AND    atm_transactions.year = 2021
              AND    transaction_type = "withdraw"
              AND    atm_transactions.atm_location = "Leggett Street"
              AND    people.phone_number IN
                     (
                            SELECT caller
                            FROM   phone_calls
                            WHERE  month = 7
                            AND    day = 29
                            AND    year = 2021
                            AND    duration < 60)
              AND    people.passport_number IN
                     (
                            SELECT passport_number
                            FROM   passengers
                            WHERE  flight_id IN
                                   (
                                            SELECT   id
                                            FROM     flights
                                            WHERE    month = 7
                                            AND      day = 29
                                            AND      year = 2021
                                            ORDER BY hour,
                                                     minute ASC limit 1)));


SELECT city
FROM airports
WHERE id = 4;

SELECT name
FROM people
WHERE phone_number IN
       (
              SELECT receiver
              FROM phone_calls
              WHERE month = 7
              AND day = 29
              AND year = 2021
              AND caller IN
                     (
                     SELECT phone_number
                     FROM people
                     WHERE name = “Ernest”)
                     AND duration < 60);