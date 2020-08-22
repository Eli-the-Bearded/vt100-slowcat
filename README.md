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
some finess and produces a lot of warnings. Assuming it does compile
for you, and it's not a default target for the `make`, you can view it
with:

```
./signature | ./slowcat -b 9600
```

Getting signature.c to play was a major reason for fixing slowcat.c to
use zero or more files instead of exactly one.

You can compile and run signature.c, and modify it as needed to get it
to compile, but do not distribute the binary and do not distribute the
source without my email address in it.

