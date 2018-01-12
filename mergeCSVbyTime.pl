#!/usr/bin/perl -w
use strict;
use Data::Dumper;

my %finalhash;
my $count=0;

for(@ARGV){
        chomp;
        $finalhash{'header'}->[$count] = $_;
#       print "Reading $_\n";
        open FILE,$_ or die "$!\n";
        while(<FILE>){
                chomp;
                my($value,$key) = split;
                if(!exists $finalhash{$key}){
                        @{$finalhash{$key}} = (0)x($#ARGV+1);
                }
                $finalhash{$key}->[$count] = $value;
        }
        close FILE or print "Could not close the file File $?\n";
        $count++;
}

my @ts = sort keys %finalhash;
print "header";
foreach(@{$finalhash{'header'}}){
        print ",$_";
}
print "\n";

foreach(@ts){
        print "$_";
        foreach(@{$finalhash{$_}}){
                print ",$_";
        }
        print "\n";
}
