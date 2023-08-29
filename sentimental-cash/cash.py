# Muhammad Idoniwako
# cs50x Pset 6 Cash
# Aug 29, 2023

# TODO

from cs50 import get_float

# Get change owed value
while True:
    owed = get_float("Change owed: ")
    if owed > 0:
        break


# Transforming dollars to cents,
# making sure it's an integer
cents = int(owed * 100)

coins = 0


# For each value in the list will divide -
# cents by the value of coin.
# Then we'll add the result to coins and -
# refresh cents with modulo
for coin in [25, 10, 5, 1]:
    coins += cents // coin
    cents %= coin

print(coins)