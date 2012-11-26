<html>
<head>
<title>TCP DUMPSTER</title>

</head>

<body>

<div style="position:absolute; top: 30; right: 50;" >
<img src="./euca_new_logo.jpg" width=150>
</div>

<?php
	if( isset($_POST["Update"]) ){
#		update_graphs();
	};

	######################## HTML BODY ####################################################################

	echo "<br>";

	echo "<center>";
	echo "<font size=\"4\" color=\"orange\">";
	print "TCP DUMPSTER";
	echo "</font>";
	echo "</center>";
	echo "<br>";

	echo "<hr>\n";
	echo "<div style=\"background:#41A317; padding:2px;\"></div><br>\n";

	$this_time = date("H:i:s");

	
	print "<table cellspacing=\"5\"><tr>";
	print "<td valign=\"top\" >";

	if( file_exists("./graphs/unique_connection_for_ip.png" ) ){
		print "<font color=\"green\">UNIQUE CONNECTION FOR IP GRAPH</font><br>";
		print "<a href=\"./graphs/unique_connection_for_ip.png?$this_time\" link=\"white\" vlink=\"white\">";
		print "<img src=\"./graphs/unique_connection_for_ip.png?$this_time\" width=400><br>";
		print "</a>";
	}else{
                print "<img src=\"./graphs/monkey.jpg\" width=400><br>";
	};
	echo "</td>";

	print "<td valign=\"top\">";

	if( file_exists("./graphs/unique_connection_for_port.png" ) ){
		print "<font color=\"green\">UNIQUE CONNECTION FOR PORT GRAPH</font><br>";
		print "<a href=\"./graphs/unique_connection_for_port.png?$this_time\" link=\"white\" vlink=\"white\">";
		print "<img src=\"./graphs/unique_connection_for_port.png?$this_time\" width=400><br>";
		print "</a>";
	}else{
                print "<img src=\"./graphs/monkey.jpg\" width=400><br>";
	};
	echo "</td>";

	print "<td align=\"center\" valign=\"middle\" width=400>";

 	echo "&nbsp&nbsp";
        echo "<font size=\"4\" color=\"orange\">";
        echo "REFRESH PAGE\n";
        echo "</font>";
	echo "<br>";
	echo "<br>";
        
	print "<form method=\"post\" action=\"$PHP_SELF\">";
        print "<input type=\"submit\" value=\"Refresh\" name=\"Refresh\" style=\"height: 2.0em; width: 10em\">";
        print "</form>";
	echo "</td>";

	print "</tr></table>";

        print "<table cellspacing=\"5\"><tr>";

        print "<td valign=\"top\">";

	if( file_exists("./graphs/connection_count.png" ) ){
                print "<font color=\"green\">CONNECTION COUNT GRAPH</font><br>";
                print "<a href=\"./graphs/connection_count.png?$this_time\" link=\"white\" vlink=\"white\">";
                print "<img src=\"./graphs/connection_count.png?$this_time\" width=400><br>";
                print "</a>";
        }else{
                print "<img src=\"./graphs/monkey.jpg\" width=400><br>";
        };
        echo "</td>";

        print "<td valign=\"top\" >";

	if( file_exists("./graphs/connection_count_throughput.png" ) ){
                print "<font color=\"green\">CONNECTION COUNT THROUGHPUT GRAPH</font><br>";
                print "<a href=\"./graphs/connection_count_throughput.png?$this_time\" link=\"white\" vlink=\"white\">";
                print "<img src=\"./graphs/connection_count_throughput.png?$this_time\" width=400><br>";
                print "</a>";
        }else{
                print "<img src=\"./graphs/monkey.jpg\" width=400><br>";
        };
        echo "</td>";

	print "<td valign=\"top\" >";

        if( file_exists("./graphs/connection_count_total.png" ) ){
                print "<font color=\"green\">CONNECTION COUNT TOTAL GRAPH</font><br>";
                print "<a href=\"./graphs/connection_count_total.png?$this_time\" link=\"white\" vlink=\"white\">";
                print "<img src=\"./graphs/connection_count_total.png?$this_time\" width=400><br>";
                print "</a>";
        }else{
                print "<img src=\"./graphs/monkey.jpg\" width=400><br>";
        };
        echo "</td>";
	
	print "</tr></table>";


#	echo "<hr>\n";
#	echo "<div style=\"background:#41A317; padding:2px;\"></div><br>\n";

#	echo "<center>";
#	echo "<font size=\"4\" color=\"orange\">";
#	print "LAST 40 RECORDS";
#	echo "</font>";
#	echo "</center>";
#	echo "<br>";

	print "<table cellspacing=\"5\"><tr>";

	print "<td valign=\"top\">";

	if( file_exists("./graphs/packet_length.png" ) ){
                print "<font color=\"green\">PACKET LENGTH GRAPH</font><br>";
                print "<a href=\"./graphs/packet_length.png?$this_time\" link=\"white\" vlink=\"white\">";
                print "<img src=\"./graphs/packet_length.png?$this_time\" width=400><br>";
                print "</a>";
        }else{
                print "<img src=\"./graphs/monkey.jpg\" width=400><br>";
        };
        echo "</td>";

	print "<td valign=\"top\">";

	if( file_exists("./graphs/packet_length_throughput.png" ) ){
                print "<font color=\"green\">PACKET LENGTH THROUGHPUT GRAPH</font><br>";
                print "<a href=\"./graphs/packet_length_throughput.png?$this_time\" link=\"white\" vlink=\"white\">";
                print "<img src=\"./graphs/packet_length_throughput.png?$this_time\" width=400><br>";
                print "</a>";
        }else{
                print "<img src=\"./graphs/monkey.jpg\" width=400><br>";
        };
        echo "</td>";

        print "<td valign=\"top\">";

        if( file_exists("./graphs/packet_length_total.png" ) ){
                print "<font color=\"green\">PACKET LENGTH TOTAL GRAPH</font><br>";
                print "<a href=\"./graphs/packet_length_total.png?$this_time\" link=\"white\" vlink=\"white\">";
                print "<img src=\"./graphs/packet_length_total.png?$this_time\" width=400><br>";
                print "</a>";
        }else{
                print "<img src=\"./graphs/monkey.jpg\" width=400><br>";
        };
        echo "</td>";

	print "</table>";

	echo "<hr>\n";
	echo "<div style=\"background:#41A317; padding:2px;\"></div><br>\n";

?>

</body>
</html>


