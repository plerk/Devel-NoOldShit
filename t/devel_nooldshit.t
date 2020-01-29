use Test2::V0 -no_srand => 1;
use Devel::NoOldShit;

ok(
  __PACKAGE__->can('no_old_shit'),
  'no_old_shit is exported',
);

done_testing;


