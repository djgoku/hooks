use v5.10;

if($ENV{DEBUG}) {
    say "\@ARGV contains (@ARGV)\n";
}

foreach(@ARGV) {
    my $output=`perl -c $_ 2>&1`;
    if ($ENV{DEBUG}) {
        say("Script $_\nExit Code $?\nSTDOUT/STDERR $output\n");
    }
   
    if ($? != 0) {
        say $output;
        exit -1;
    }
}
