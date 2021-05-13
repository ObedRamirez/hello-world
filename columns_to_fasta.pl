#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;
my $file;

GetOptions(
    'file|f=s'     =>\$file,
);


#--------MAIN PROGRAM----------------------------------------
&get_file();
#&sam_to_fasta();
&columns_to_fasta2;
#-----------------------------------------------------------
sub get_file{
  if(!$file){
    print STDERR "Especifica archivo\n";
  &usage();
  exit(1)
 }
}

sub columns_to_fasta{
   
   open FILE, "$file" or die "Cannot open file $file\n";
   my $header=<FILE>;#delete the header
      
      foreach my $line(<FILE>){
            chomp $line;
            my(undef,$seq_id,undef,undef,undef,undef,undef,undef,undef,$seq,undef)=split(/\t/,$line);
            $seq =~ s/U/T/g;
            my $len = length($seq);
            print ">$seq_id,MajorRNA,length=$len\n$seq\n";
         }
   close FILE;
}

sub columns_to_fasta2{
   open FILE, "$file" or die "Cannot open file $file\n";
   my $header=<FILE>;#delete the header
      
      my $cont=1;
      foreach my $line(<FILE>){
            chomp $line;
            my($seq,undef)=split(/\t/,$line);
            print "Seq$cont\n$seq\n";
            $cont++;
         }
   close FILE;
}

sub sam_to_fasta{
  
   open FILE, "$file" or die "Cannot open file $file\n";
   #my $header=<FILE>;#delete the header
      
      foreach my $line(<FILE>){
            chomp $line;
            my($seq_id,undef,undef,undef,undef,undef,undef,undef,undef,$seq,undef)=split(/\t/,$line);
            print ">$seq_id\n$seq\n";
         }
   close FILE;
}

sub usage{
    print STDERR "\n This is free software, and you are welcome to redistribute it under certain conditions;\n";
    print STDERR <<EOF;
NAME
    columns_to_fasta.pl   L

USAGE
    columns_to_fasta.pl 

OPTIONS
    
Version 1.0, Copyright (C) 04/sep/17 EO

EOF
}

sub license{
    print STDERR <<EOF;

Copyright (C) 2017 EO
e-mail: obed\_eo\@hotmail.com

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
EOF
exit;
}