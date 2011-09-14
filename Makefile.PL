
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "File finder using Path::Class",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Config" => 0,
    "Exporter" => 0,
    "File::Copy" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "File::pushd" => 0,
    "Test::Deep" => 0,
    "Test::More" => "0.92",
    "autodie" => 0,
    "parent" => 0,
    "perl" => "5.010"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Path-Class-Rule",
  "EXE_FILES" => [],
  "LICENSE" => "apache",
  "NAME" => "Path::Class::Rule",
  "PREREQ_PM" => {
    "Carp" => 0,
    "List::Util" => 0,
    "Number::Compare" => "0.02",
    "Path::Class" => 0,
    "Scalar::Util" => 0,
    "Text::Glob" => 0,
    "namespace::autoclean" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.003",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



