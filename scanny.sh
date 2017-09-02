#!/bin/bash
prog_name="[Scanny]"
if ! type "nc" >/dev/null; then
	echo "$prog_name NetCat wasn't found, installing..." 
	apt-get install nc -y >/dev/null
	echo "$prog_name NetCat has been installed, restarting program..."
	sh ${0##*/}
else
	printf "$prog_name Target: "
	read -r target
	printf "$prog_name Port or Port Range: "
	read -r ports
	printf "$prog_name Timeout: "
	read -r timeout
	printf "$prog_name Output File: "
	read -r output_file

	echo "$prog_name Starting scan on $target, with port(s) $ports..."
	nc -v -z -w $timeout $target $ports >$output_file
	echo "$prog_name Finished scan, output saved to $output_file..."
fi
