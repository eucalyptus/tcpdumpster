#!/usr/bin/perl

use strict;

my $this_dir = ".";

my $gnuplot_scripts_dir = $this_dir ."/gnuplot_scripts";
my $graphs_dir = $this_dir . "/graphs";

if( @ARGV < 1 ){
	print "Need 1 Input: <tcpdumpster_output_file_dir>\n";
	exit(1);
};

my $data_dir = shift @ARGV;

my $scr_name = "gnuplot_script_unique_connection_for_port.script";
my $data_name = "tcpdumpster.output";
my $png_name = "unique_connection_for_port.png";

my $scr_loc = $gnuplot_scripts_dir . "/" . $scr_name;
my $png_loc = $graphs_dir . "/" . $png_name;
my $data_loc = $data_dir . "/" . $data_name;

if( !(-e "$data_loc" ) ){
	print "[ERROR] Cannot locate data file $data_loc\n";
	exit(1);
};


print "\n";
print "================= PLOT UNIQUE CONNECTION FOR PORT =====================\n";
print "\n";

system("mkdir -p $gnuplot_scripts_dir");
system("mkdir -p $graphs_dir");

open( SCR, "> $scr_loc" ) or die $!;

print SCR "set title \"TCP-DUMPSTER: UNIQUE CONNECTION FOR PORT\"\n";
print SCR "set key outside top\n";
print SCR "set border linewidth 2\n";
print SCR "set xdata time\n";
print SCR "set timefmt \"%H:%M:%S\"\n";
print SCR "set xlabel \"TIME\"\n";
print SCR "set format x \"%H:%M\"\n";
print SCR "set ylabel \"UNIQUE PORT COUNT\"\n";
#print SCR "set ytics 0, 2\n";
print SCR "set terminal png size 1200, 800\n";
print SCR "set output \"" . $png_loc ."\"\n";
print SCR "plot \"" . $data_loc . "\" using 1:4 title \"Source Port\" with lines,";
print SCR "\"" . $data_loc . "\" using 1:6 title \"Dest. Port\" with lines\n";
print SCR "exit\n";

close( SCR );

system("gnuplot $scr_loc");

print "\n";
print "===================== DONE =====================\n";
print "\n";

exit(0);

1;

