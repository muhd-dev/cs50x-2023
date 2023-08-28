// Muhammad Idoniwako
// cs50x Lab 2 Scrabble
// Aug 24, 2023

#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>

// Points assigned to each letter of the alphabet; while A and a are both worth 1 point,
// B or b are worth 3 points ... Z or z are worth 10 points
int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

// For more clarity and understanding: ASCII arrays value assigned to lowercase alphabets
int small_letters[] = {97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122};

// ASCII arrays value assigned to capital letters of the alphabets
int capital_letters[] = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90};
int temp_points [] = {};

int compute_score(string word);

int main(void)
{
    // Get input words from both players
    string word1 = get_string("Player 1: ");
    string word2 = get_string("Player 2: ");

    // Score both words
    int score1 = compute_score(word1);
    int score2 = compute_score(word2);

    // TODO: Print the winner (if score1 > score2 player1 wins, vice versa)
    if (score1 > score2)
    {
        printf("Player 1 wins\n");
    }
    else if (score2 > score1)
    {
        printf("Player 2 wins!\n");
    }
    else
    {
        printf("Tie\n");
    }
}

int compute_score(string word)
{
    // TODO: Compute and return score for string
    int score = 0;
    for (int i = 0; i < strlen(word); i++)
    {
        // To check if the letter if UPPERCASE
        if (isupper(word[i]))
        {
            // If the letter is in uppercase, this will look for the corresponding word in the capital_letters array based on ASCII values above.
            // The value from temp_points is then added to the integer score to calculate the total score.
            for (int f = 0; f < sizeof(capital_letters); f++)
            {
                if (word[i] == capital_letters[f])
                {
                    temp_points[i] = POINTS[f];
                    score += temp_points[i];
                }

            }
        }

        else if (islower(word[i]))
        {
            // Same thisng happens here: If the letter is in lowercase,
            // this will look for the corresponding word in the capital_letters array based on ASCII values above.
            for (int f = 0; f < sizeof(small_letters); f++)
            {
                if (word[i] == small_letters[f])
                {
                    temp_points[i] = POINTS[f];
                    score += temp_points[i];
                }
            }
        }

        // This will ignore the anything other than an alphabet
        else
        {
            i += 1;
        }
    }
    // This will return the score
    return score;
}

