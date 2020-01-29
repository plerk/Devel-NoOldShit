# Devel::NoOldShit [![Build Status](https://secure.travis-ci.org/plicease/Devel-NoOldShit.png)](http://travis-ci.org/plicease/Devel-NoOldShit)

Don't support EOLed systems

# SYNOPSIS

```perl
use Devel::NoOldShit;

no_old_shit();
```

# DESCRIPTION

This module prints an appropriate diagnostic and exits with zero (0)
on platforms that are known to have been "End-Of-Lifed" by their
corporate owners or individual authors.

Why?  When placed in your `Makefile.PL` or `Build.PL` this will
mask problematic cpan tester reports coming from platforms that
are no longer supported.

Or, put another way, it is fucking insane that I am getting reports
from Windows XP which was EOLed in 2014.

The set of platforms that is not supported may expand as necessary.

# FUNCTIONS

## no\_old\_shit

```
no_old_shit()
```

Checks to see if you are running on an unsupported platform.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
