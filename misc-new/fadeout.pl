#!/usr/bin/perl
# Looking at an old .sig:
#
# @@@@@@  @@@@@  @@@@@@  @@@@@@@  @@@@@@  @@@@@ @@@@@@@   @@@@@@  @@@  @@@  @@@
#@@@@@@@ @@@@@@ @@@@@@@@ @@@@@@@@ @@@@@@ @@@@@@ @@@@@@@@ @@@@@@@@ @@@  @@@  @@@
#!@@     !@@    @@!  @@@ @@!  @@@ @@!    @@!    @@!  @@@ @@!  @@@ @@!  @@!  @@!
#!@!     !@!    !@!  @!@ !@!  @!@ !@!    !@!    !@!  @!@ !@!  @!@ !@!  !@!  !@!
#!!@@!!  !@!    @!@!@!@! @!@@!@!  @!!!:! @!@    @!@!!@!  @!@  !@! @!!  !!@  @!@
# !!@!!! !!!    !!!@!!!! !!@!!!   !!!!!: !@!    !!@!@!   !@!  !!! !@!  !!!  !@!
#    !:! :!!    !!:  !!! !!: :!!  !!:    !!:    !!: :!!  !!:  !!! !!:  !!:  !!:
#    !:! :!:    :!:  !:! :!:  !:! :!:    :!:    :!:  !:! :!:  !:! :!:  :!:  :!:
#:::: ::  ::::: ::   :::  ::  :::  :: ::  :;: : ::   ::: ::::: ::  :::: :: :::
#:: : :   :: ::  :   : :  :   ::: : :  :   : :   :   : :  : :  :    :: :  : :
#
# it occurred that a random fadeout should be easy to script.
# This does such a fadeout, but the randomness is unlikely to
# ever produce that particular design.

my $home = "\e[H";
my $clear = "$home\e[2J\e[3J";
my $hide_cursor = "\e[?25l";
my $show_cursor = "\e[?25h";
my $delay = 0.08;
my $basechance = 0.26;
$| = 1;		# autoflush after every print

# progress has the order of character swaps, @ to !, then ! to :, ...
# every character in the art needs to be in the array
my @progress = ('@', '!', ':', '.', ' ');
# swaps will be filled in later
my %swaps;

# most characters in most lines should be the first character of @progress
# all characters in all lines should in @progress
my @lines = (
' @@@@@@  @@@@@  @@@@@@  @@@@@@@  @@@@@@  @@@@@ @@@@@@@   @@@@@@  @@@  @@@  @@@',
'@@@@@@@ @@@@@@ @@@@@@@@ @@@@@@@@ @@@@@@ @@@@@@ @@@@@@@@ @@@@@@@@ @@@  @@@  @@@',
'@@@     @@@    @@@  @@@ @@@  @@@ @@@    @@@    @@@  @@@ @@@  @@@ @@@  @@@  @@@',
'@@@     @@@    @@@  @@@ @@@  @@@ @@@    @@@    @@@  @@@ @@@  @@@ @@@  @@@  @@@',
'@@@@@@  @@@    @@@@@@@@ @@@@@@@  @@@@@@ @@@    @@@@@@@  @@@  @@@ @@@  @@@  @@@',
' @@@@@@ @@@    @@@@@@@@ @@@@@@   @@@@@@ @@@    @@@@@@   @@@  @@@ @@@  @@@  @@@',
'    @@@ @@@    @@@  @@@ @@@ @@@  @@@    @@@    @@@ @@@  @@@  @@@ @@@  @@@  @@@',
'    @@@ @@@    @@@  @@@ @@@  @@@ @@@    @@@    @@@  @@@ @@@  @@@ @@@  @@@  @@@',
'@@@@@@@ @@@@@@ @@@  @@@ @@@  @@@ @@@@@@ @@@@@@ @@@  @@@ @@@@@@@@  @@@@@@@@@@@',
'@@@@@@   @@@@@ @@@  @@@ @@@  @@@ @@@@@@  @@@@@ @@@  @@@  @@@@@@    @@@@ @@@@',
);

sub pause { select(undef,undef,undef,$delay) }
sub start { print "$clear$hide_cursor"; }
sub finish { print "$show_cursor\n\n\n"; }
sub show { print "$home", join( "\n", @lines), "\n" }

# handle ^C, etc, nicely
sub interrupt { finish; exit; }
$SIG{HUP}  = 'main::interrupt';
$SIG{INT}  = 'main::interrupt';
$SIG{TERM} = 'main::interrupt';
$SIG{TSTP} = 'main::interrupt';

# @progress has the order of character swaps, @ to !, then ! to :, ...
# this makes them easier to use with a hash
sub fillswaps {
  my $last = $progress[0];
  my $p = 1;
  while(defined($progress[$p])) {
    $last = $swaps{$last} = $progress[$p];
    $p ++;
  }
} # &fillswaps

# this does the bulk of the work
sub alter {
  my $chance;
  my $possible = 0;
  my $lastchance = $basechance;
  my $n;
  my $line;
  my $final = $progress[-1];
  my $first = $progress[0];

  # loop through lines from bottom to top
  for ($n = @lines - 1; $n >= 0 ; $n --) {

    # count characters in final state
    $line = ($lines[$n] =~ s/$final/$final/g);

    # init chance base on percentage of this line in final state
    $chance = ( $line * $basechance )
                 /  (length $lines[$n]);

    # count characters in initial state
    $line = ($lines[$n] =~ s/$first/$first/g);

    # Multiply by ( number chars not in initial state ), the basechance
    # the number of lines, and the (last chance divided by current line
    # with adjustment )
    # This was worked out by just tweaking things for a while. The goal
    # is to make changes more likely on lower lines, and more likely
    # if the previous line has seen many changes.
    # There's probably a better formula that could be used.
    $chance *= (length($lines[$n]) - $line) * $basechance * @lines *
                ( $lastchance / ($n+@lines));

    # for every character not in final state, consider swapping to
    # next state
    $lines[$n] =~ s/([^$final])/
                (rand() < $chance) ? $swaps{$1} : $1
                /eg;

    # count of all characters not in final state, used to determine
    # if looping should continue
    $possible += ($lines[$n] =~ s/([^$final])/$1/g);

    # seed lastchance with at most $basechance
    $lastchance = ($chance > $basechance ? $basechance : $chance);

    # when debugging info is needed
    # print $home;
    # print "\n" x (@lines + $n);
    # print "Chance is $chance; line is $n; possible is $possible.......\n";
  }
  return $possible;
} # &alter

fillswaps;
start;
show;
pause;
while (alter) { show; pause }
show;	# can't forget revision
finish;
__END__
