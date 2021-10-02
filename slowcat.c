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
#include <time.h>
#include <iconv.h>

int debug = 0;
char version[] = "2021 Oct 02: third Eli the Bearded edition";

void show_version(char *name) {
	printf("%s version %s\n", name, version);
}

void usage(FILE *where, char *name) {
	fprintf(where,"usage: %s\n", name);
	fprintf(where,"\t  slowcat -b BAUDRATE [ filename ... ]\n");
	fprintf(where,"\t  slowcat -d USECONDS [ filename ... ]\n");

	fprintf(where,"\nAdditional options:\n");
	fprintf(where,"\t          -a         ANSI to Unicode conversion\n");
	fprintf(where,"\t          -z         like -a, but stop at ^Z\n");
	fprintf(where,"\t          -v         be more verbose\n");
	fprintf(where,"\t          -V         show version\n");
	fprintf(where,"\t          -h         show this help\n");

	fprintf(where,"\nRuns something like basic cat(1), but slows the\n");
	fprintf(where,"output down to emulate a BAUDRATE connection (of\n");
	fprintf(where,"75 to 128000) or with an explicit delay between\n");
	fprintf(where,"bytes output of 1 to 20000 useconds. Recall that\n");
	fprintf(where,"baud is a rate of bits per second, so 1200 baud\n");
	fprintf(where,"is one bit every 833.3 useconds, one byte every\n");
	fprintf(where,"6666.4 useconds, and 150 bytes per second.\n\n");
	fprintf(where,"Out of range values will be replaced by reasonable\n");
	fprintf(where,"values silently. The verbose option shows the\n");
	fprintf(where,"usecond value actually used at the end of the run.\n");
}

void delay(useconds_t);
#define IN_BUF		2
#define OUT_BUF		16
#define IN_CHARSET	"437"
#define OUT_CHARSET	"UTF-8"

int main(int argc, char **argv) {
	int c, option, ansi;
	useconds_t usecs = 100;
	long baud;
	FILE *fp;
	char *fnam;
	char inbuf[IN_BUF], outbuf[OUT_BUF];
	char *inpt, *outpt;
	size_t in, out;
	iconv_t cd;

	ansi = opterr = 0;

	while ( (option = getopt(argc, argv, "b:d:azvVh")) != -1 ) {
		switch (option) {
			case 'v':
				debug = 1;
				break;

			case 'a':
				ansi = 1;
				break;

			case 'z':
				ansi = 'z';
				break;

			case 'b':
				baud = strtoul( optarg, NULL, 10 );
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
				usecs = strtoul( optarg, NULL, 10 );
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

	if(ansi) {
		cd = iconv_open(OUT_CHARSET, IN_CHARSET);
		if ((iconv_t)-1 == cd) {
			fprintf(stderr,"ANSI iconv conversion unavailabl\n");
			exit(2);
		}
	}

	do {
		setbuf(fp, NULL);

		while ( (c = fgetc( fp )) != EOF ) {
			if(ansi) {
				if ((032 == c) && ('z' == ansi)) { break; }
				in = 1;
				out = OUT_BUF;
				inbuf[0] = c;
				inbuf[1] = 0;
				inpt = inbuf;
				outpt = outbuf;
				iconv(cd, &inpt, &in, &outpt, &out);
				fwrite(outbuf, (OUT_BUF - out), 1, stdout);
			} else {
				putchar(c);
			}
			delay(usecs);
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

/* So it turns out my old standby of usleep() is deprecated, and
 * nanosleep() is preferred. This lets either be used, and both are
 * better than the empty loop as the non-nanosleep alternative in
 * the original slowcat.c.
 * Precision isn't that important, so we dispense with frivolities
 * like checking for how long either sleep actually slept.
 */
void delay(useconds_t usecs) {
#if _POSIX_C_SOURCE >= 199309L
	struct timespec ts = {0, (long)usecs * 1000};
	nanosleep(&ts, NULL);
#else
	usleep(usecs);
#endif
}
