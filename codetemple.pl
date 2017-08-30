#!/usr/bin/perl

use strict;
use warnings;
use Switch;

my @comment_tag = ("/*","*/"); #[0] start tag, [1] end tag for C/C++
my @yearstr = localtime();
my $year = $yearstr[5]+1900;

my $argc = @ARGV;
if ($argc < 2) { usage(); }
my $name = $ARGV[0];
my $lang = $ARGV[1];

my $LICENCE = <<"EOL";
#
#
# Copyright (C) $year  $name

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
EOL

my $Ccode = <<"EOC";
$comment_tag[0]
$LICENCE
$comment_tag[1]
#include <stdio.h>

int main(int argc, char *argv[]) {
	printf("Hullo, World!");
	return 0;
}
EOC

my $Cppcode = <<"EOC";
$comment_tag[0]
$LICENCE
$comment_tag[1]

#include <iostream>

int main(int argc, char *argv[]) {
	std::cout << "Hullo, World!" << std::endl;
	return 0;
}
EOC

my $interpreted = <<"EOC";
#!/usr/bin/$lang

$LICENCE
EOC

sub usage {
	print "Usage: ./$0 'developer name' 'programming language'\n";
	print "Example: ./$0 'Tshaba Phomolo Benedict' C\n";
	exit(1);
}

my %exts = ('C',".c",'C++',".cpp",'Python',".py",'Perl',".pl",'Ruby',".rb");

if(defined $exts{$lang}) {
open(FILE, ">main".$exts{$lang}) or die "Couldn't open file main".$exts{$lang}.", $!";
}

switch($lang) {
	case 'C' { print FILE $Ccode }
	case 'C++' { print FILE $Cppcode }
	case 'Perl' { print FILE $interpreted }
	case 'Python' { print FILE $interpreted }
	case 'Ruby' { print FILE $interpreted }
	else { print "That Programming Language is not supported!\n" }
}

close(FILE);
