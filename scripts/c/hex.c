#include <stdio.h>
#include <string.h>

void printHex(char*);

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Usage: %s <string>\n", argv[0]);
        return 1;
    } else {
        printHex(argv[1]);
        printf("\n");
    }
    return 0;
}

void printHex(char* s) {
    for (int i = 0; i < strlen(s); i++) {
        printf("%02X ", s[i]);
    }
}
