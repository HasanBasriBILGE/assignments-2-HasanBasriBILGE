#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Check if both arguments are provided
    if (argc != 3) {
        printf("Usage: %s <writefile> <writestr>\n", argv[0]);
        exit(1);
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Open the file for writing
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Could not open file '%s' for writing", writefile);
        exit(1);
    }

    // Write the content to the file
    if (fprintf(file, "%s", writestr) < 0) {
        syslog(LOG_ERR, "Error: Could not write to file '%s'", writefile);
        fclose(file);
        exit(1);
    }

    // Close the file
    fclose(file);

    // Log the write operation
    syslog(LOG_DEBUG, "Writing '%s' to '%s'", writestr, writefile);

    // Print a success message
    printf("File '%s' created with content:\n%s\n", writefile, writestr);

    return 0;
}

