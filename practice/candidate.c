#include <cs50.h>
#include <stdio.h>


typedef struct // Defining our own
{
    string name;
    int votes;
}
candidate;

candidate get_candidate (string prompt);

int main(void) // This is the main structure
{
    // candidate candidates_array[3];
    // for (int i = 0; i < 3; i++)
    // {
    //     candidates_array[i] = get_candidate("Enter a Candidate: ");
    // }
    candidate president = get_candidate("Enter a Candidate: ");
    printf("%s\n", president.name);
    printf("%i\n", president.votes);
}

candidate get_candidate (string prompt)
{
    printf("%s\n", prompt);
    candidate c;
    c.name = get_string("Enter a name: ");
    c.votes = get_int("Enter a number of votes: ");
    return c;
}