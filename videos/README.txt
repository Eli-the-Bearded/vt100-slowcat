Videos from several sources, the first two with some repeats.

* grox.net videos in grox/

* textfiles.com videos in textfiles/

I collected all of the videos from those two sites even if there were duplicates.
The source URLs in the .fetch files; downloaded 2020 Aug 22

* other videos, mostly from Usenet, in other/

* simple fragments to help view things are in helper-bits/

I've tested them all in a black on white xterm, most work okay at 9600,
some need slower, some need white on black. A few break if the window
size is not 80x24.

sample play command:
	slowcat -b 9600 grox/snails.vt

The textfiles source has short descriptions, which I have included and
added to. I wrote all of the descriptions for the grox source videos,
and the other ones mostly have descriptions by me.

I created all the helper-bits/ fragments, but they are seriously trivial:

* `reset.vt` full (probably) terminal reset, try after a video
* `home+clear.vt` just a home and clear screen, try using before a video
* `hide-cursor.vt` make the cursor invisible, try using before a video
* `show-cursor.vt` make the cursor visible, try using after a video

Some of them attempt to load fonts I don't have, and don't work correctly.
Some just have issues. More than a few do not reset the terminal properly
after playing. Try `cat helper-bits/reset.vt` afterwards, or use it as a
second file on the `slowcat` line. Note that `reset.vt` clears the screen,
which is not always desired.

Copyright is missing from most of these files. A few say they can be 
distributed without changes. I'm going to assume that's true of them
all.

Additional files of note:

* ascii-art-faq.txt

Scarecrow's ASCII art FAQ, as posted to rec.arts.ascii and other groups.

* control-codes.txt

Tony Nugent's guide to control codes for ASCII animation on vt102s, as
posted to rec.arts.ascii and other groups.

