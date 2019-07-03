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

my @fileChecker;

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

@fileChecker = qw( Packages Packages.xz Packages.gz );
if ( -e $fileChecker[0] ) {
    print color('green');
    print "Deleting files!\n";
    my @Packages = qw( Packages Packages.xz Packages.gz );

    for my $f (@Packages) {
        system "rm -rf $f";
    }
}
else {
    print color('bold red');
    print
"Warning files does not exist, did you initialized the repository before?\n";
}

print color('reset');

print "\n";    #Why tho? Well it looks nice on the terminal.

print color('yellow');

print "Deleting release files...\n";

@fileChecker = qw( Release Release.gpg );
if ( -e $fileChecker[0] ) {
    print color('green');
    print "Deleting files!\n";
    my @Packages = qw( Release Release.gpg );

    for my $f (@Packages) {
        system "rm -rf $f";
    }
}
else {
    print color('bold red');
    print
"Warning files does not exist, did you initialized the repository before?\n";
    print color('reset');
}

print "\n";    #Why tho? Well it looks nice on the terminal.

print color('yellow');

print "Deleting and creating new packages folder\n";

my @PackagesFolder = qw( ./packages );

for my $f (@PackagesFolder) {
    system "rm -rf $f";
    system "mkdir packages";
}

sleep(1);

print "Deleting and creating new depictions folder.\n";

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

print color('reset');
print "\n";    #Why tho? Well it looks nice on the terminal.

print color ('magenta');
if ( prompt_yn("Are you hosting this on GitHub?") ) {
    print color('green');
    print "You are done setting up the repository";
}
else {
    print color('green');
    my @userIsNotHostingOnGit = qw( README.md .gitignore LICENSE );

    for my $f (@userIsNotHostingOnGit) {
        system "rm -rf $f";
    }
    print
"GitHub releated files have been deleted, you may put this files into your web server";
}
