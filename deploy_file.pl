#!/usr/bin/perl
################################################################### 
#$root = "/Users/gersteina1/Desktop/sandbox/users";
#$prefs ='';

$root = "/Users";	# where to find the User directories
$prefs = "/Library/Preferences";

`cd $root`;
# move into the root directory (defined above)

$homes=`ls $root | grep -v -x "Shared" | grep -v -x "flamacadmin" | grep -v -x "acc" | grep -v -x ".localized"`;
# list the folders found in $root that aren't Shared, flamacadmin, acc, and put them into an array (@homes)

@homes=split('\n', $homes);
# take the array and break them up
for($x=0;$x<=$#homes;$x++)
# for each entry in the array, do the following, then increment the value and start with the next entry
{
	@homes[$x]=$root."/".@homes[$x].$prefs;
	# update the list from "username" to "/$root/username/$prefs"
}

foreach $i (@homes)
# for each entry in @homes
{
	print("$i\n");		# print out the user directory

	`cp @ARGV[0] $i`;	# copy the filename passed to all the directories?		
}