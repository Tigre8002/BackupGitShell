#!/bin/bash

cd ~

ls
read -p "You are on root, enter path of directory: " directory

cd $directory && echo "Sucess to enter a directory" || echo "Error, this directory is null."

function gitInit {
	git init || "You don't have git or have error with git."
}

function gitAdd {
	git add "$1"
}

function gitCommit {
	git commit -m $1
}

function gitAddRemoteOrigin {
	git remote add origin $1
}

function gitPushOrigin {
	git push origin $1 || echo "ERROR, This branch is null."
}

function addReadMe {
	touch README.md
	echo "$1" >> README.md

}

function addGitIgnore {
         touch .gitignore
         echo "$1" >> .gitignore
}

function options {
	echo -e "Select option to start:\n 1. Git init\n 2. Git add\n 3. Git commit\n 4. Git remote add\n 5. Git push\n 6. Add readme\n 7. Add git ignore\n\n 8. Exit"
   	read -p "Enter your choice: " option

 	case $option in
         	"1")
			gitInit
         		
			options
			;;
         	"2")
			read -p "What archives?" archives
			gitAdd "$archives"
         		
			options
			;;
         	"3")
         		read -p "Enter the name of your commit: " commitName
    
         		if ["$commitName" == ""]; then
                 		exit 1  
         		fi
			
			gitCommit $commitName	
         		
			options
			;;
		"4")
			read -p "Enter the URL of your git:  " gitURL                                                                                                        
			if ["$gitURL" == ""]; then
			         exit 1
			fi
			
			gitAddRemoteOrigin $gitURL

			options
			;;
		"5")
			read -p "Select branch to push your backup:  " branch
			
			gitPushOrigin $branch
			
			options			
			;;
		"6")
			read -p "Enter text to Readme:" text

			addReadMe "$text"

			options			
			;;
		"7")
			read -p "Enter text to git ignore:" text

			addGitIgnore "$text"

			options
			;;
		"8")
			exit 1
			;;
		*)
			echo "Error, try again."

			options
			;;
	esac

}

options
