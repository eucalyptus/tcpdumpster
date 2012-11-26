#!/usr/bin/perl

use strict;

$| = 1;

my $output_list = "./tcpdumpster.output";
my $port = 8888;

if( @ARGV > 0 ){
	$port = shift @ARGV;
};

if( -e $output_list ){
	system("mv -f $output_list ".$output_list."_prev");
};

open( DUMP, "tcpdump port $port |" ) or die $!;

#open( OUTPUT, "> $output_list" ) or die $!;

my $line;

my $start_time = time;
my $last_checkout_time = time;

my $this_time = "";
my $this_line_time = "";

my %this_source_ip_hash = {};
my $this_source_ip_count = 0;

my %this_source_port_hash = {};
my $this_source_port_count = 0;

my %this_dest_ip_hash = {};
my $this_dest_ip_count = 0;

my %this_dest_port_hash = {};
my $this_dest_port_count = 0;

my $this_count = 0;
my $this_count_total = 0;
my $this_count_for_min = 0;
my $this_count_throughput_for_min = 0;

my $this_length = 0;
my $this_length_total = 0;
my $this_length_for_min = 0;
my $this_length_throughput_for_min = 0;

while($line=<DUMP>){
	chomp($line);
	#16:57:21.717183 IP eucahost-51-86.eucalyptus.ddi-tcp-1 > castillian.eucalyptus.58128: Flags [P.], seq 8689:10038, ack 714, win 500, options [nop,nop,TS val 248581615 ecr 412320120], length 1349
	if( $line =~ /^(\d+:\d+:\d+\.\d+)\s+\w+\s+(\S+)\s+\>\s+(\S+):.+length\s+(\d+)/ ){
		my $ts = $1;
		my $source = $2;
		my $dest = $3;
		my $length = $4;

		my $is_time_changed = 0;

		###	Second has ticked.
		if( $ts =~ /^(\d+:\d+:\d+)\.\d+/ ){
			$this_line_time = $1;
			if( $this_line_time ne $this_time ){
				$this_time = $this_line_time;
				$is_time_changed = 1;
			};
		};

		###	Print records so far
		if( $is_time_changed == 1 ){
			my $time_taken = time - $start_time;

			if( time - $last_checkout_time >= 60 ){
				$this_count_throughput_for_min = $this_count_for_min / 60.0;
				$this_count_throughput_for_min = sprintf("%0.3f", $this_count_throughput_for_min);
				$this_length_throughput_for_min = convert_to_kilo($this_length_for_min) / 60.0;
				$this_length_throughput_for_min = sprintf("%0.3f", $this_length_throughput_for_min);
				$last_checkout_time = time;
				$this_count_for_min = 0;
				$this_length_for_min = 0;
			};

			$this_count_for_min += $this_count;
			$this_length_for_min += $this_length;

			my $this_length_in_kilo = convert_to_kilo($this_length);
			my $this_length_total_in_kilo = convert_to_kilo($this_length_total);
			
			my $throughput = 0;
			if( $time_taken > 0 ){
				$throughput = sprintf("%0.3f", $this_length_total_in_kilo / $time_taken);
			};
			#print OUTPUT "$this_time $time_taken $this_source_ip_count $this_source_port_count $this_dest_ip_count $this_dest_port_count $this_count $this_count_total $this_length_in_kilo $this_length_total_in_kilo $throughput\n";
			system("echo \"$this_time $time_taken $this_source_ip_count $this_source_port_count $this_dest_ip_count $this_dest_port_count $this_count $this_count_total $this_count_throughput_for_min $this_length_in_kilo $this_length_total_in_kilo $this_length_throughput_for_min $throughput\" >> $output_list");
			%this_source_ip_hash = {};
			%this_dest_ip_hash = {};
			$this_source_ip_count = 0;
			$this_dest_ip_count = 0;

			%this_source_port_hash = {};
			%this_dest_port_hash = {};
			$this_source_port_count = 0;
			$this_dest_port_count = 0;
			
			$this_count = 0;
			$this_length = 0;
		};

		if( $source =~ /(.+)\.([\w|\-]+)/ ){
			my $source_ip = $1;
			my $source_port = $2;
			if( $this_source_ip_hash{$source_ip} eq "" ){
				$this_source_ip_count++;
				$this_source_ip_hash{$source_ip} = 1;
	#			print "Captured new IP $source\t$source_ip\t$source_port\n";              
			};
			if( $this_source_port_hash{$source_port} eq "" ){
				$this_source_port_count++;
				$this_source_port_hash{$source_port} = 1;
                        };
		}else{
	#		print "Missed $source\n";
		};

		if( $dest =~ /(.+)\.([\w|\-]+)/ ){
                        my $dest_ip = $1;
                        my $dest_port = $2;
                        if( $this_dest_ip_hash{$dest_ip} eq "" ){
                                $this_dest_ip_count++;
				$this_dest_ip_hash{$dest_ip} = 1;
                        };
                        if( $this_dest_port_hash{$dest_port} eq "" ){
                                $this_dest_port_count++;
				$this_dest_port_hash{$dest_port} = 1;
                        };
	#		print "Captured $dest $dest_ip $dest_port\n";              
                }else{
         #               print "Missed $dest\n";
                };

		$this_count++;
		$this_count_total++;

		$this_length += $length;
		$this_length_total += $length;
		
	};
};

close(DUMP);

#close(OUTPUT);

exit(0);

1;

#################### SUBROUTINE #############################


sub convert_to_kilo{
	my $num = shift @_;
	if( $num =~ /^(\d+)\d\d\d$/ ){
		return $1;
	};
	return 1;
};


