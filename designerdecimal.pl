#!/usr/bin/perl
# This file is part of designerdecimal and is associated with CC0.
# To the extent possible under law, the person who associated CC0 with this work
# has waived all copyright and related or neighboring rights to this work.
# See http://creativecommons.org/publicdomain/zero/1.0/ for more details.

# For describing a performant rational approximation algorithm, thanks to:
# John Kennedy, "Algorithm to Convert a Decimal to a Fraction"
# http://homepage.smc.edu/kennedy_john/DEC2FRAC.PDF

use strict;
use warnings;
use Math::BigFloat;

my $name = "Santa Claus";
if (scalar(@ARGV) > 0) {
  $name = join(' ', @ARGV);
}

my @chars = split(//, $name);
my $ascii = '';
foreach my $char (@chars) {
  $ascii .= sprintf('%03s' , ord($char));
}
$ascii = '1.' . $ascii . '004';
my $accuracy = length($ascii) - 1;

my $x = Math::BigFloat->new($ascii);
$x->accuracy($accuracy);
my $z = $x->copy();
my $dMinTwo = Math::BigFloat->bzero();
my $d = Math::BigFloat->bone();
my $n = Math::BigFloat->bzero();
my $i = 0;

print "For the name '$name':\n  Your designer decimal is $ascii\n";
my $q = $n->copy();
$q->bdiv($d);
$q->accuracy($accuracy);

until (BigFloatEqual($q, $x)) {
  my $zInt = $z->copy();
  $zInt->bfloor();
  my $zSub = $z->copy();
  $zSub->bsub($zInt);
  $z = Math::BigFloat->bone();
  $z->bdiv($zSub);

  $zInt = $z->copy();
  $zInt->bfloor();

  my $dCpy = $d->copy();
  $d->bmul($zInt->as_int());
  $d->badd($dMinTwo);
  $dMinTwo = $dCpy->copy();

  $n = $d->copy();
  $n->bmul($x);
  $n->bfround(0, 'odd');

  $q = $n->copy();
  $q->round_mode('trunc');
  $q->accuracy($accuracy);
  $q->bdiv($d);

  $i++;
}

print "  Your rational approximation is $n / $d\nTook $i iterations.\n";

sub BigFloatEqual {
  my ($x, $y) = @_;
  if ($x->bcmp($y) == 0) {
    return 1;
  }
  return 0;
}
