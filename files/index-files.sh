#!/bin/sh
# zacharydawood.xyz

# Clear all files
sed -i '/<!-- INSERT -->/,/<!-- END -->/{//!d}' ../files.html

#for each file generate the html code for each row
for FILE in *;
	    do
		filesize=$(wc -c $FILE | cut -d" " -f1 | numfmt --to=iec-i --suffix=B --format="%.3f");
		date=$(stat -c %y $FILE | cut -d" " -f1);
		sed -i "/<!-- INSERT -->/a <tr>\n\t<th><a href=\"files\/${FILE}\">${FILE}<\/a><\/th>\n\t<th>${filesize}<\/th>\n\t<th>${date}<\/th>\n<\/tr>" ../files.html;
done;
	    
