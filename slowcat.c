/*
 * Inspired by, but a nearly complete rewrite of:
 *    slowcat.c - slow down the display of a file
 *    copyright (c) 2001,2002,2007  dave w capella   All Rights Reserved
 * found here:
 *    https://grox.net/software/mine/slowcat/
 * in August 2020.
 * 
 * Original license (unchanged):
 *  *  distributed under the terms of the GNU Public license
 *  *
 *  *  There is NO WARRANTY, and NO SUPPORT WHATSOEVER.
 *
 * Original build / install unchanged:
 *  * building: make slowcat && mv slowcat $HOME/bin
 *  * (assuming that you have a personal bin directory)
 *
 * Usage vastly changed. "slowcat -h" will show usage now.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int debug = 0;
char version[] = "2020 Aug 20: first rewrite by Eli the Bearded";

void show_version(char *name) {
	printf("%s version %s\n", name, version);
}

void usage(FILE *where, char *name) {
	fprintf(where,"usage: %s\n", name);
	fprintf(where,"\t  slowcat -b BAUDRATE [ filename ... ]\n");
	fprintf(where,"\t  slowcat -d USECONDS [ filename ... ]\n");

	fprintf(where,"\nAdditional options:\n");
	fprintf(where,"\t          -v         be more verbose\n");
	fprintf(where,"\t          -V         show version\n");
	fprintf(where,"\t          -h         show this help\n");

	fprintf(where,"\nRuns something like basic cat(1), but slows the\n");
	fprintf(where,"output down to emulate a BAUDRATE connection (of\n");
	fprintf(where,"75 to 128000) or with an explicit delay between\n");
	fprintf(where,"bytes output of 1 to 20000 useconds. Recall that\n");
	fprintf(where,"baud is a rate of bits per second, so 1200 baud\n");
	fprintf(where,"is one bit ever 833.3 useconds, one byte every\n");
	fprintf(where,"6666.4 useconds, and 150 bytes per second.\n");
}

int main(int argc, char **argv) {
	int c, option;
	useconds_t usecs = 100;
	long baud;
	FILE *fp;
	char *fnam;

	while ( (option = getopt(argc, argv, "b:d:vVh")) != -1 ) {
		switch (option) {
			case 'v':
				debug = 1;
				break;

			case 'b':
				baud = strtoul( optarg, NULL, 10);
				/* 75 is the lowest generally accepted baud
				 * rate, but even the Bell 101 modem did 110.
				 * At the other end, 128k baud is ISDN.
				 */
				if(baud <= 75) {
					baud = 75;
				} else if (baud > 128000L) {
					baud = 128000;
				}
				usecs = 8000000 / baud;
				break;

			case 'd':
				usecs = strtoul(argv[2],NULL,10);
				if(usecs <= 0 || usecs > 20000) {
					usecs = 100;
				}
				break;

			case '?':
				fprintf(stderr, "Unrecognized option: %c\n", optopt);
				usage(stderr, argv[0]);
				exit(1);

			case 'V':
				show_version(argv[0]);
				exit(0);
				break;

			case 'h':
				usage(stdout, argv[0]);
				exit(0);
				break;
		} /* switch */
	} /* while */


	setbuf(stdout, NULL);

        if ( optind != argc ) {
		fnam = argv[optind++];
		fp = fopen( fnam, "r");
		if(fp == NULL) {
			fprintf(stderr,"Filename %s errored out\n",fnam);
			exit(2);
		}
	} else {
		fp = stdin;
	}

	do {
		setbuf(fp, NULL);

		while ( (c = fgetc( fp )) != EOF ) {
			putchar(c);
			usleep(usecs);
		}

		fclose(fp);
		fnam = argv[optind++];

		if ( optind <= argc ) {
			fp = fopen( fnam, "r");
			if(fp == NULL) {
				fprintf(stderr,"Filename %s errored out\n",fnam);
				exit(2);
			}
		}
	} while ( optind <= argc );

	if (debug) {
		printf("\nDelay used: %lu useconds.\n", (unsigned long) usecs);
	}
	return (0);
}
