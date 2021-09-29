#!/usr/bin/perl
# This does 90 to 95% of the work of turning an HTML ASCII art
# animation (of the likes Kangaroo used to post) into a vt100
# animation.
#
# I look for the line that lists dimensions and run it in vi with
#
# :%! dehtmlizer WIDTH
#
# Or just guess a width, since all that does is pad shorter
# lines to that width, to use spaces to erase previous art.
#
# September 2021	Eli the Bearded

my $home = "\e[H";
my $clear = "$home\e[2J\e[3J";
my $hide_cursor = "\e[?25l";
my $show_cursor = "\e[?25h";

my $size = 64;
my $line;
my $end;

if (defined($ARGV[0]) and $ARGV[0] > 1) { $size = shift; }

print $clear;
print $hide_cursor;

sub doline {
  $line = shift;
  $end  = shift;
  $line =~ s/\\(.)/$1/g;
  while(length($line) < $size) { $line =~ s/$/ / }
  print $line . "\n";
  if ($end eq ',') { print $home; }
}

while(<>) {
  if(/^"(.*)"([+]nl[+]|,?)\s*$/) {
    doline($1,$2);
  } elsif (/^"(.*)\\[nr]"([+]|,?)\s*$/) {
    doline($1,$2);
  } else {
    if(/^"/) { warn "Line $. has unexpected pattern.\n"; }
  }
}

# print $clear;
print $show_cursor;
