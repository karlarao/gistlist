# gistlist
list file names of private and public gist

# setup
* install gist before running this script https://github.com/defunkt/gist 
```
brew install gist
```
* setup your github API Token to avoid ”github API rate limit exceeded”  
* change the <git_username>:<put_token_here> section of the script
* run it!
```
./gistlist.sh
```




##### example output 
```
cat gistfinal.txt 
2018-08-17|2018-08-17|https://gist.github.com/<gist_id>|private.md
2018-08-16|2018-08-16|https://gist.github.com/<gist_id>|toc.md
2018-08-15|2018-08-16|https://gist.github.com/<gist_id>|get memory from sqlmon files, get high memory SQL.md
2018-08-14|2018-08-16|https://gist.github.com/<gist_id>|gluentwiki.md
2018-08-14|2018-08-14|https://gist.github.com/<gist_id>|gluent_present.md
2018-08-14|2018-08-14|https://gist.github.com/<gist_id>|gluent_offload.md
2018-08-14|2018-08-14|https://gist.github.com/<gist_id>|todo.md
... 
2016-09-01|2016-09-01|https://gist.github.com/<gist_id>|storage.R
2016-08-30|2016-08-30|https://gist.github.com/<gist_id>|week4_final_karao
2016-08-17|2016-08-17|https://gist.github.com/<gist_id>|week2_q3_karao


# gist output 
gist -l | wc -l
      75

# gistlist.sh output 
wc -l gistfinal.txt 
      75 gistfinal.txt


cat gistlist.txt 
Created   |Modified  |Dif|URL                              |Name
2018-08-17|2018-08-17|  0|https://gist.github.com/<gist_id>|private.md
2018-08-16|2018-08-16|  0|https://gist.github.com/<gist_id>|toc.md
2018-08-15|2018-08-16|  1|https://gist.github.com/<gist_id>|get memory from sqlmon files, get high memory SQL.md
2018-08-14|2018-08-16|  2|https://gist.github.com/<gist_id>|gluentwiki.md

```
