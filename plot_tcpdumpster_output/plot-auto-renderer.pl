#!/usr/bin/perl

use strict;
local $| = 1;


### STATIC VAR
my $CLOUD_USER_GEN_DIR = "..";
my $PLOT_DIR = $CLOUD_USER_GEN_DIR . "/plot_tcpdumpster_output";
my $GRAPH_DIR = $PLOT_DIR . "/graphs";
my $HTML_GRAPH_DIR = "/var/www/html/graphs";

my $latest_log_dir = ".";

my $render_01 = "cd $PLOT_DIR; ./generate_unique_connection_for_ip_graph.pl ../$latest_log_dir";
my $render_02 = "cd $PLOT_DIR; ./generate_unique_connection_for_port_graph.pl ../$latest_log_dir";
my $render_03 = "cd $PLOT_DIR; ./generate_connection_count_graph.pl ../$latest_log_dir";
my $render_04 = "cd $PLOT_DIR; ./generate_connection_count_total_graph.pl ../$latest_log_dir";
my $render_05 = "cd $PLOT_DIR; ./generate_connection_count_throughput_graph.pl ../$latest_log_dir";
my $render_06 = "cd $PLOT_DIR; ./generate_packet_length_graph.pl ../$latest_log_dir";
my $render_07 = "cd $PLOT_DIR; ./generate_packet_length_total_graph.pl ../$latest_log_dir";
my $render_08 = "cd $PLOT_DIR; ./generate_packet_length_throughput_graph.pl ../$latest_log_dir";

my $copy_graphs_over_to_html = "cp -f $GRAPH_DIR/* $HTML_GRAPH_DIR/.";

while(1){

	print "\n";
	print print_time();
	run_cmd($render_01);
	run_cmd($render_02);
	run_cmd($render_03);
	run_cmd($render_04);
	run_cmd($render_05);
	run_cmd($render_06);
	run_cmd($render_07);
	run_cmd($render_08);
	
	run_cmd($copy_graphs_over_to_html);

	print "\n";
	print "Sleeping for 1 Min..\n";
	sleep(60);
	print "\n";
};

exit(0);

1;

########### SUBROUTINE ##############

sub run_cmd{
	my $cmd = shift @_;
	print "\n";
	print "CMD: $cmd\n";
	system($cmd);
	print "\n";
	return;
};

sub print_time{
	my ($sec,$min,$hour,$mday,$mon,$year,$wday, $yday,$isdst)=localtime(time);
	my $this_time = sprintf "[%4d-%02d-%02d %02d:%02d:%02d]", $year+1900,$mon+1,$mday,$hour,$min,$sec;
	return $this_time;
};


