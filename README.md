slowcat
=======

The original `slowcat.c` was written by dave w capella to play old
VT100 animations. It apparently used a simple empty loop to slow
things down. Dave later modified it to use `nanosleep()` and that's
the version I found in August 2020.

I modified that to use `usleep()`, parse args with `getopt()`, and
take multiple files (or none at all), and to calculate baud rate to
delay time. All that on Aug 20, 2020 in search of getting snails.vt
to play correctly.

On Aug 22, 2020, I modified it back to using `nanosleep()` if available
and added a makefile, and some other content.

The original dave capella version is "GNU Public license" (without
specifying which version, or including the license). I'm not changing
the licensing.

videos
------

The videos come from various sources, with unknown licensing. There's
a readme in that directory, and description files for all of the videos.

BAUD reference
--------------

In days of yore, conversion of a binary signal to an audio stream
and then back via a modem was a common way to connect to a remote
computer over an ordinary telephone line. The first modem (of note)
was the Bell 101 which had a BAUD of 110, that is 110 bits per second.
Speeds went up from there. Traditional dialup used these rates:

| BAUD rate | common in era of VT100 videos |
| --------- | ----------------------------- |
|      110  | no |
|      300  | no |
|      600  | maybe |
|     1200  | maybe |
|     2400  | maybe |
|     4800  | yes |
|     9600  | yes |
|    14400  | maybe |
|    19200  | maybe |
|    28800  | no |
|    38400  | no |
|    57600  | no (basically max for one phone line) |
|   115200  | no (achieved by using two lines) |

Fun fact: dial up credit card auth systems, where they still exist,
typically still use 1200 or 2400 baud because the handshake time for
higher speeds takes too long. The handshake is the "modem sound"
people who used them will remember. At 1200 baud the call can complete
faster than it can at 9600 since there's so little data actually
exchanged.

signature
---------

Sometime, probably 1995, I had a dream about an ASCII art video of a
sphere being cross-sectioned. signature.c-OLD came out of that. One
big issue with it is that it does nothing to adjust for terminals
typically using fonts twice as wide as tall, so the "sphere" was rather
oval in cross-section. That email address is way out of date, too.

I've refreshed it, fixing the sphere to be more circular as signature.c.
This is old-school International Obfuscated C Code Contest code style,
and it eschews things like useful variable names, header includes, and
whitespace. (So was signature.c-OLD, too.) As such compiling it requires
some finesse and a tolerance for a lot of warnings. Assuming it does
compile for you, and it's not a default target for the `make`, you can
view it with:

```
./signature | ./slowcat -b 9600
```

Getting signature.c to play was a major reason for fixing slowcat.c to
read from standard input, fixing it to use zero or more files now,
instead of exactly one.

You can compile and run signature.c, and modify it as needed to get it
to compile, but do not distribute the binary and do not distribute the
source without my email address in it.


Blog post about this code:

https://qaz.wtf/qz/blosxom/2020/08/22/slowcat
