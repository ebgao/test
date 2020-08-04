#!/bin/bash
read -p "Enter the users password:" PASSWD
for NAME in `cat users.txt`
do
	id $NAME &> /dev/null
	if [ $? -eq 0 ]
	then
		echo "Already exists"
	else
		useradd -d /home/$NAME $NAME &> /dev/null
		echo "$PASSWD" | passwd --stdin $NAME &> /dev/null
		if [ $? -eq 0 ]
		then
			echo "$NAME, Creat seccess"
		else
			echo "$NAME, Creat failure"
		fi
	fi
done

