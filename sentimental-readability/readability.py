# Muhammad Idoniwako
# cs50x Pset 6 Readability
# Aug 29, 2023

# TODO

from cs50 import get_string
text = get_string("Text: ")

letters = sentences = 0
words = 1


for item in text:
    if item.isalpha():
        letters += 1
    if item.isspace():
        words += 1
    if item in ["?", ".", "!"]:
        sentences += 1


# Applying Coleman-Liau index:
L = (letters * 100) / words
S = (sentences * 100) / words

result = round(0.0588 * L - 0.296 * S - 15.8)


# Prints results
if result < 1:
    print("Before Grade 1")

elif result >= 16:
    print("Grade 16+")

else:
    print(f"Grade {result}")