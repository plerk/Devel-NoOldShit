package Devel::NoOldShit;

use strict;
use warnings;
use 5.006;

# ABSTRACT: Don't support EOLed systems
# VERSION

=head1 SYNOPSIS

 use Devel::NoOldShit;
 
 no_old_shit();

=head1 DESCRIPTION

This module prints an appropriate diagnostic and exits with zero (0)
on platforms that are known to have been "End-Of-Lifed" by their
corporate owners or individual authors.

Why?  When placed in your C<Makefile.PL> or C<Build.PL> this will
mask problematic cpan tester reports coming from platforms that
are no longer supported.

Or, put another way, it is fucking insane that I am getting reports
from Windows XP which was EOLed in 2014.

The set of platforms that is not supported may expand as necessary.

This module has no non-core dependencies starting with Perl 5.6.0.

=head1 FUNCTIONS

=head2 no_old_shit

 no_old_shit()

Checks to see if you are running on an unsupported platform.

=cut

sub no_old_shit
{
  if($] < 5.008001)
  {
    print "Perl 5.8.0 and earlier are not supported\n";
    exit;
  }

  if($^O eq 'MSWin32')
  {
    local $@ ='';
    my(undef, $major, $minor) = eval { Win32::GetOSVersion() };

    if(
      ( $major < 6 )                   ||
      ( $major == 6 && $minor < 2)
    )
    {
      print "Windows 7 and earlier are not supported\n";
      exit;
    }
  }
  else
  {
    if(-f '/etc/os-release')
    {
      my $name;
      my $version;
      my $id;
      open(IN, '</etc/os-release');
      while(<IN>)
      {
        warn "_ = $_";
        $name = $1    if /^NAME=(.*)/;
        $name = $1    if /^NAME="(.*)"/;
        $version = $1 if /^VERSION="(.*)"/;
        $id = $1      if /^ID=(.*)/;
      }
      close IN;

      # TODO: CentOS, Ubuntu, FreeBSD, NetBSD, etc

      if(defined $id && $id eq 'debian')
      {
        if(defined $version && $version =~ /^([0-9]+)/)
        {
          if($1 < 8)
          {
            print "Debian 7 (Wheezy) and earlier are not supported\n";
            exit;
          }
        }
      }
      elsif(defined $id && $id eq 'fedora')
      {
        if(defined $version && $version =~ /^([0-9]+)/)
        {
          if($1 < 30)
          {
            print "Fedora 29 and earlier are not supported\n";
            exit;
          }
        }
      }
    }
  }
}

sub import
{
  my $caller = caller;
  no strict 'refs';
  *{ join '::', $caller, 'no_old_shit' } = \&no_old_shit;
}

1;


