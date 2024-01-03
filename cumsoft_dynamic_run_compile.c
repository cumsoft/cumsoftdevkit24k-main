#include <sta10.h>
#include < stallb.h›
#include <unistd.h›
#include <sys/wait.h>
int main)
plaT Chila p1d = 101K;
11（Ch110 010 ==-1）2
perror( "Error forking process");
exit (EXIT_FAILURE);
11 (Child p1d == 0) 1
/Ihis code runs in the child process
execl("other_program.out", "other_program.out", NULL);
// If execl fails, it returns, and we print an error
perror("Error executing the program");
exit (EXIT_FAILURE);
} else {
This code runs in the parent process
int status:
waitpid(child_pid, &status, 0);
if (WIFEXITED(status) && WEXITSTATUS(status) == 0) €
printf("Program executed successfully.\n");
} else {
printi("Error executing the program. In";
recurn
