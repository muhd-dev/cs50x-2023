# Muhammad Idoniwako
# cs50x Pset 6 Mario-less
# Aug 29, 2023

# TODO
while True:
    height = int(input("Height: "))
    if 1 <= height <= 8:
        break

for row in range(1, height + 1):
    print(" " * (height - row) + "#" * row)


# PS I didn't import the cs50 lib. cause
# i was trying to take the training wheels of