// Muhammad Idoniwako
// cs50x Problem Set 2 Readability
// Aug 24, 2023

#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
    // Declares an integer to count the number of letters
    int count_letter = 0;
    // Declares an integer to count the number of words
    int count_word = 1;
    // Declares an integer to count the number of sentences
    int count_sentence = 0;
    // This will get the text from user
    string text = get_string("Text: ");

    //  This will check the length of the text
    int text_length = strlen(text);
    // This will iterate through the length of the text
    for (int i = 0; i < text_length; i++)
    {
        // Checks if text is an alphabet
        if (isalpha(text[i]))
        {
            // Counts the number of alphabeth in text
            count_letter++;
        }
    }

    for (int i = 0; i < text_length; i++)
    {
        if (isspace(text[i]))
        {
            count_word++;
        }
    }

    for (int i = 0; i < text_length; i++)
    {
        if (text[i] == '.' || text[i] == '?' || text[i] == '!')
        {
            count_sentence++;
        }
    }

    // According to Coleman-Liau index formula:
    // index = 0.0588 * L - 0.296 * S - 15.8
    float calculation = (0.0588 * count_letter / count_word * 100) - (0.296 * count_sentence / count_word * 100) - 15.8;
    // This rounds up the index
    int index = round(calculation);

    if (index < 1)
    {
        // Prints index if its less than 1
        printf("Before Grade 1\n");
    }
    else if (index > 16)
    {
        // Prints index if its greater than 16
        printf("Grade 16+\n");
    }
    else
    {
        // Prints index if its a digit other than 16+ or Before Grade 1
        printf("Grade %i\n", index);
    }
}