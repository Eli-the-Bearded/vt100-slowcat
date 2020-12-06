Videos from two sources, with some repeats.

grox.net videos in grox/

textfiles.com videos in textfiles/

other videos (well, just one right now) in other/

source URLs in .fetch files; downloaded 2020 Aug 22

I've tested them all in a black on white xterm, most work okay at 9600,
some need slower, some need white on black. A few break if the window
size is not 80x24.

sample play command:
	slowcat -b 9600 grox/snails.vt

The textfiles ones come with descriptions from that site, which I have
added to. I wrote all of the descriptions for the grox ones.

Some of them attempt to load fonts I don't have, and don't work correctly.
Some just have issues. More than a few do not reset the terminal properly
after playing. Try `cat reset.vt` afterwards, or use it as a second file
on the `slowcat` line. But reset.vt clears the screen, so not always
recommended.

Copyright is missing from most of these files. A few say they can be 
distributed without changes. I'm going to assume that's true of them
all.
