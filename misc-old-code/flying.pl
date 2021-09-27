From: samuell@cis.uab.edu (R L Samuell)
Subject: flying.pl -- example of a program-driven animation in Perl
Date: 1997/12/19
Message-ID: <882512817.4481@209.138.30.157>
X-Deja-AN: 308501851
Content-Type: text/plain
Organization: The Night-Owl's Nest
NNTP-Posting-Date: Fri, 19 Dec 1997 01:38:08 EST
Newsgroups: alt.ascii-art,alt.ascii-art.animation



I have received several emails lately about how I created my ASCII
Art Aquarium ('aquarium.vt') animation and some other program-driven
animations.

At the end of this article, I have included a Perl script entitled
'flying.pl' -- a simple airplane animation (take-off, cruising, and
landing) which hopefully will illustrate some of the techniques used
in such kinds of animated ASCII art.  It includes several methods
from my Typogram module and is easy to run if you have access to a
computer that has a Perl processor for version 5 of the language.
Execute the command 'perl -v' from your command line to determine 
if the required version of Perl is available on your system.  Then 
follow the instructions and notices in the attached script below and
Enjoy!

Regards,


R L Samuell
Proprietor of the ASCII Art Bazaar
gopher://twinbrook.cis.uab.edu/1asciiarc.70


P.S.:  I also use the attached script in a Perl programming class
that I teach as a simple example of the use of Perl objects and
methods in scripts.

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#!/perl
# flying.pl v2.0 (1997.11.20)(1996.6.25)
#  Perl Script to Generate Airplane Flying Animation
#   by R L Samuell <samuell\@cis.uab.edu>
#
# Usage:
#   flying
#
# Instructions and Notices:
#   - Set terminal for VT-!00 or ANSI emulation
#   - Save this document to a file named:  flying
#   - Run 'perl -x flying' to animate
#   - Distribute ONLY the UNMODIFIED version of this script.
#   - Note that this software may not run in all environments.
#
require 5.000;
use strict;

package Typogram;
# extracted from Typogram.pm

sub new
  {
  my $Class = shift;
  my $Self = {};
  $Self->{'image'} = [];
  $Self->{'height'} = 0;
  $Self->{'width'} = 0;
  $Self->{'color'} = '';
  bless $Self, $Class;
  }

sub add
  {
  my $Self = shift;
  my( $Offset, $Text ) = @_;
  my $N = $Self->{'height'};
  $Self->{'image'}[$N] = $Text;
  $Self->{'offset'}[$N++] = $Offset;
  $Self->{'height'} = $N;
  my $L = $Offset + length($Text);
  $Self->{'width'} = $L if $L > $Self->{'width'};
  return $N;
  }

sub display
  {
  my $Self = shift;
  my( $X, $Y ) = @_;
  my $N = $Self->{'height'};
  my( $I, $Offset, $Text, $X1, $Y1 );
  for( $I = 0; $I < $N; $I++ )
    {
    $Offset = $Self->{'offset'}[$I];
    $Text = $Self->{'image'}[$I];
    $X1 = $X + $I;
    $Y1 = $Y + $Offset;
    print STDOUT "\e[$X1;$Y1","H","$Text";
    }
  return $X + $N;
  }

sub erase
  {
  my $Self = shift;
  my( $X, $Y ) = @_;
  my $N = $Self->{'height'};
  my( $I, $Offset, $Text, $X1, $Y1 );
  for( $I = 0; $I < $N; $I++ )
    {
    $Offset = $Self->{'offset'}[$I];
    $Text = ' ' x length( $Self->{'image'}[$I] );
    $X1 = $X + $I;
    $Y1 = $Y + $Offset;
    print STDOUT "\e[$X1;$Y1","H","$Text";
    }
  return $X + $N;
  }

sub replace
  {
  my $Self = shift;
  my( $N, $Offset, $Text ) = @_;
  return 0 if $N >= $Self->{'height'};
  $Self->{'image'}[$N] = $Text;
  $Self->{'offset'}[$N++] = $Offset;
  my $L = $Offset + length($Text);
  $Self->{'width'} = $L if $L > $Self->{'width'};
  return $N;
  }


package main;

use vars qw( $Title $Runway $Plane @Spin $Vroom $B $Q $ever $Landing $I $J );
use subs 'wind';

$SIG{'INT'} = sub { return if $Landing; $Landing = $ever; $ever = $B-52; return };

select STDOUT; $|=1;
print "\e[37;40m\e[2J";

$Title = Typogram->new;
$Title->add( 0, "1997.11.20".' ' x 20 ."'flying'". ' ' x 20 ."R L Samuell" );
$Runway = Typogram->new;
$Runway->add( 0, '_' x 79 );
$Plane = Typogram->new;
$Plane->add( 0, '       --|--       ' );
$Plane->add( 0, '--\--|--(A)--/-----' );
$Plane->add( 0, '       o/ \o       ' );
$Spin[0] = '--\--|--(A)--/-----';
$Spin[1] = '--|--/--(A)-----\--';
$Spin[2] = '--/-----(A)--\--|--';
$Spin[3] = '-----\--(A)--|--/--';
$Vroom = Typogram->new;
$Vroom->add( 0, 'vroom!' );

( $B, $Q ) = ( 19, 30 );
$ever = -39;

$Title->display( 23, 6 );
for(;++$ever;)
  {
  for( $J = 0; $J < 10; $J++ )
    {
    for( $I = 0; $I <= 3; $I++ )
      {
      $Plane->replace( 1, 0, $Spin[$I] );
      $Plane->display( $B, $Q );
      }
    }
  $Plane->erase( $B, $Q );
  $Plane->replace( 2, 0, '        ~ ~        ' ) if $ever == 20;
  $Runway->erase( 22, 1 ) if $ever == 40;
  $Title->erase( 23, 6 ) if $ever == 80;
  if( $ever < 0 )
    {
    $Vroom->display( 3 + int rand(16), 10 + int rand(54) ) if not $Landing;
    $Runway->display( 22, 1 );
    $Plane->replace( 2, 0, '       o/ \o       ' );
    }
  else
    {
    $Q += wind;
    }
  $B += wind;
  $B = ( $B <= 2 ) ? 3 : $B;
  $B = ( $B >= 20 ) ? 19 : $B;
  $Q = ( $Q <= 9 ) ? 10 : $Q;
  $Q = ( $Q >= 51 ) ? 50 : $Q;
  $ever = - $ever if $ever == -1 and not $Landing;
  }

$Plane->display( $B, $Q );
$Title->add( 31 - int(length($Landing)/2), "$Landing miles" );
$Title->display( 23, 6 );
print "\e[24;1H";

exit;

sub wind
  {
  return rand(317) % 3 - 1 unless $ever < 0;
  return 1;
  }


__END__

