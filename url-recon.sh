#!/bin/bash

# URL prompt
read -p "Enter name for query: " name
read -p "Enter the URL to query: " url

# datetime 
echo "##### Date of Collection" > ${name}.txt
echo $(date +"%Y-%m-%d %H:%M:%S") >> ${name}.txt

#whois
echo "##### WHOIS info for $url:" >> ${name}.txt
whois $url >> ${name}.txt

#dig
echo "##### DNS information for $url:" >> ${name}.txt
dig $url >> ${name}.txt

#robots
wget $url/robots.txt -O ${name}_robots.txt

#certificate info
echo "##### Certificate info for $url:" >> ${name}.txt
openssl s_client -showcerts -connect $url:443 </dev/null | openssl x509 -text >> ${name}.txt


#end message
echo "Results saved" 
