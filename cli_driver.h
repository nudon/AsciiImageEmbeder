#ifndef FILE_CLI_DRIVER_SEEN
#define FILE_CLI_DRIVER_SEEN

void printHelpMessage();

void parseArgs(int argc, char* argv[]);

int matchFlag(char* token, char* flag );

int findAndStoreMatch(char* token, char* search, int resultSize, char* result);

int match(char* src, char* search);

int indexOfChar(char* src, char search);

void setDefaultOpts();

#endif
