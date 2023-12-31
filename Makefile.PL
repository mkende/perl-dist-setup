# DO NOT EDIT! This file is written by perl_setup_dist.
# If needed, you can add content at the end of the file.
use 5.026;
use strict;
use warnings;
use ExtUtils::MakeMaker::CPANfile;
use File::ShareDir::Install;

install_share 'data';

WriteMakefile(
    NAME             => 'Dist::Setup',
    DISTNAME         => 'Dist-Setup',
    AUTHOR           => q{Mathias Kende <mathias@cpan.org>},
    VERSION_FROM     => 'lib/Dist/Setup.pm',
    ABSTRACT         => q{Simple opinionated tool to setup a Perl distribution directory.},
    LICENSE          => 'mit',
    EXE_FILES        => ['script/perl_dist_setup',],
    MIN_PERL_VERSION => '5.026',
    MAN3PODS         => {},
    # Directories in which we look for Makefile.PL. In general could be omitted but is needed in case there
    # is a file named Makefile.PL in a sub-directory. Should be customized if such a file needs to be
    # processed by ExtUtils.
    DIR              => [],
    NO_MYMETA => 1,
    META_MERGE => {
      'meta-spec' => { version => 2 },
      # Goes with NO_MYMETA (which would provide the dynamic config).
      dynamic_config => 0,
      no_index => {
        directory => [ 'local', 'vendor' ],
      },
      resources => {
        repository => {
          type => 'git',
          url => 'git@github.com:mkende/dist_setup.git',
          web => 'https://github.com/mkende/dist_setup',
        },
        bugtracker => {
          web => 'https://github.com/mkende/dist_setup/issues',
        },
      },
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => '.gz', },
    clean => { FILES => 'Dist-Setup-*' },
);

package MY;
use File::ShareDir::Install qw(postamble);
# End of the template. You can add custom content below this line.

