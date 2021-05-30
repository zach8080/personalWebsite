#!/bin/sh
# zacharydawood.xyz

# Clear all posts
sed -i '/<!-- INSERT -->/,/<!-- END -->/{//!d}' ../posts.html

cd ../blog/

#for each post generate the html code for each row
for FILE in *;
	    do
		title=$(sed -n 1p $FILE | sed -e 's/<!-- \(.*\)-->/\1/');
		description=$(sed -n 2p $FILE | sed -e 's/<!-- \(.*\)-->/\1/');
		date=$(sed -n 3p $FILE | sed -e 's/<!-- \(.*\)-->/\1/');
		sed -i "/<!-- INSERT -->/a <tr>\n\t<th><a href=\"blog\/${FILE}\">${title}<\/a><\/th>\n\t<th>${description}<\/th>\n\t<th>${date}<\/th>\n<\/tr>" ../posts.html;
done;

