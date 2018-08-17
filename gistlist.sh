#!/bin/bash

# single url execution 
# curl -u <git_username>:<put_token_here> --url https://api.github.com/gists/<gist_id> | egrep "created_at|updated_at|filename|\"html_url\"\: \"https\:\/\/gist" | grep -v content | grep -v "    \"html_url\"" | grep -v "    \"updated_at\"" | grep -v "    \"created_at\"" | egrep -A1 "html_url|updated|created" | grep -v "\-\-" | sed 'N;N;N;s/\n//g' | awk -F'"' '{print substr($12,1,10)"|"substr($16,1,10)"|"$4"|"$8}'


# loop through all gist id 
gist -l |  awk -F" " '{print $1}' | awk -F'/' '{print $4}' > gist.txt

rm gistdata.txt
for i in `cat gist.txt`; do 
	curl -u <git_username>:<put_token_here> --url https://api.github.com/gists/$i >> gistdata.txt
done

cat gistdata.txt | egrep "created_at|updated_at|filename|\"html_url\"\: \"https\:\/\/gist" | grep -v content | grep -v "    \"html_url\"" | grep -v "    \"updated_at\"" | grep -v "    \"created_at\"" | egrep -A1 "html_url|updated|created" | grep -v "\-\-" | sed 'N;N;N;s/\n//g' | awk -F'"' '{print substr($12,1,10)"|"substr($16,1,10)"|"$4"|"$8}' | sort -rnk1 > gistfinal.txt

cat gistfinal.txt

# add diff 
printf "%-10s|%-10s|%-3s|%-56s|%s\n" "Created" "Modified" "Dif" "URL" "Name" > gistlist.txt;cat gistfinal.txt | while IFS="|" read d1 d2 url1 file1 ; do typeset -i ddif;d1s=`date -j -f'%Y-%m-%d' "$d1" +'%s'`;d2s=`date -j -f'%Y-%m-%d' "$d2" +'%s'`;ddif=($d2s-$d1s)/86400;printf "%s|%s|%3d|%s|%s\n" $d1 $d2 $ddif "$url1" "$file1"; done >> gistlist.txt
