#!/usr/bin/env perl
#Copyright 2019 Polar Development.

#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

#Libraries to import
use warnings;
use strict;
use Term::ANSIColor;

print color('yellow');
print "Initializing repository.\n";
sleep(1);
print "Initializing repository..\n";
sleep(1);
print "Initializing repository...\n";
print color('bold green');
print "Repository was initialized!\n";
print color('reset');

print color('yellow');

print "\n";    #Why tho? Well it looks nice on the terminal.
print "Deleting example files...\n";

print "Deleting Packages file...\n";

my @Packages = qw( Packages Packages.xz Packages.gz );

for my $f (@Packages) {
    system "rm -rf $f";
}

sleep(1);
print color('bold green');

print "Done deleting Packages File!\n";
print color('reset');

print "\n";    #Why tho? Well it looks nice on the terminal.

print color('yellow');

print "Deleting release files...\n";

my @ReleaseFiles = qw( Release Release.gpg );

for my $f (@ReleaseFiles) {
    system "rm -rf $f";
}

sleep(1);

print color('green');

print "Done deleting release files!\n";

print "Deleting and creating new packages folder";

my @PackagesFolder = qw( ./packages );

for my $f (@PackagesFolder) {
    system "rm -rf $f";
    system "mkdir packages";
}

sleep(1);

print "Deleting and creating new depictions folder.";

my @depictionsFolder = qw( ./depictions );

for my $f (@depictionsFolder) {
    system "rm -rf $f";
    system "mkdir depictions";
}

sleep(1);

sub prompt {
    my ($query) = @_;    # take a prompt string as argument
    local $| = 1;        # activate autoflush to immediately show the prompt
    print $query;
    chomp( my $answer = <STDIN> );
    return $answer;
}

sub prompt_yn {
    my ($query) = @_;
    my $answer = prompt("$query (Y/N): ");
    return lc($answer) eq 'y';
}

print "\n";              #Why tho? Well it looks nice on the terminal.

if ( prompt_yn("Are you hosting this on GitHub?") ) {
    print "You are done setting up the repository";
}
else {
    my @userIsNotHostingOnGit = qw( README.md .gitignore LICENSE );

    for my $f (@userIsNotHostingOnGit) {
        system "rm -rf $f";
    }
}

