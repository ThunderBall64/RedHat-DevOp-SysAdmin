/*
 * @script	: filestat.c
 * @author	: billint
 * @date	: 23rd May 2018
 * @objective	: Analyze file info and size
 */

#include <stdio.h>

void main(int argc, char **argv)
{
	FILE *fp;
	char ch;
	int size = 0;

	fp = fopen(argv[1], "r");
	if (fp == NULL)
		printf("\nFile unable to open");
	else
		printf("\nFile opened");
	fseek(fp, 0, 2);
	size = ftell(fp);
	printf("Size of file: %d\n", size);
	fclose(fp);
}

