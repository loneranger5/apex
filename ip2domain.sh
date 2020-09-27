#Author : Loneranger5
#Github : https://github.com/loneranger5
#lazy script to identify ip owners using ssl certificates

contact()

{
	echo "$1"
        echo "contacting ..."
        `timeout 3 openssl s_client -connect $1:443 > test`
        echo "$1 -- " $(cat test | egrep "([a-z0-9|-]+[a-z0-9]{1,}\.)*[a-z0-9|-]+[a-z0-9]{1,}\.[a-z]{2,}$" | awk '{print $NF}') >> resolved.txt 
        echo -n "" > test

}


for line in $(cat iplist.txt)
do
	contact $line
done
