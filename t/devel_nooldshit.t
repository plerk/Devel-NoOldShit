use strict;
use warnings;
use Test::More tests => 1;
use Devel::NoOldShit;

ok(
  __PACKAGE__->can('no_old_shit'),
  'no_old_shit is exported',
);


