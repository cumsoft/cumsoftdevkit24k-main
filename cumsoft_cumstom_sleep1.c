#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    int countdown;

    // Get user input for the countdown time
    printf("Enter the countdown time in seconds: ");
    scanf("%d", &countdown);

    // Countdown loop
    while (countdown > 0) {
        printf("Time remaining: %d seconds\n", countdown);
        sleep(1); // Sleep for 1 second
        countdown--;
    }

    // Display a message or execute a script when the countdown reaches zero
    printf("Time's up! Launching script or echoing a message...\n");

    // Add your script or echo command here

    return 0;
}