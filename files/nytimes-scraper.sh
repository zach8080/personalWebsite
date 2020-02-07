#!/bin/sh
# zacharydawood.xyz | sue me

# TO USE: 
# sh nytimes-scraper.sh https://www.nytimes.com/2020/02/05/opinion/trump-impeachment-bribery-acquittal.html

# can pipe it to a file by adding ">" then a filename after
# or read it in terminal by adding "| less" after

# printing out title
curl -s $1 |
    sed -n '/<title/p' | 
    sed 's/<[^>]*>//g'

#printing out body
curl -s $1 |
    sed -n '/StoryBodyCompanionColumn/p' |
    sed 's/.*articleBody//' |
    sed 's/.NYT_BELOW_MAIN_CONTENT.*//' |
    sed 's/.AdvertisementContinue.*//' |
    sed 's/<[^>]*>//g' |
    sed 's/^[^>]*>//' |
    sed 's/.<div id=*//'
