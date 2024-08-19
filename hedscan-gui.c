#include <stdio.h>
#include <stdlib.h>

// This emulates the HEDSCAN graphical user application and especially the 
// moment when a hook is implemented, for example when the application 
// opens or closes, or when a dialog opens or closes.

int main(int arg, char *argv[]) {
    FILE *fp;

    fp = fopen("infile.json", "w");
    // pass some infomation to the hook script
    fclose(fp);

    // use a system call to execute the hook script
    system("./hedscan-hook.sh infile.json outfile.json");

    fp = fopen("outfile.json", "w");
    // read the infomation from the hook script
    fclose(fp);

    return 0;
}