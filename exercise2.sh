#!/bin/bash

output_result=$(java --version)
if [ -z "$output_result" ]
then
	apt update 
	apt install default-jdk 
else
	echo "Java is already installed"
fi

version=$(java -version 2>&1 | sed -E -n 's/.* version "([^.-]*).*"/\1/p' | cut -d' ' -f1)


if [ $version -gt 11 ]
then
	echo "Java with version: $version installed. It is newer than Java 11. Installation successful."
elif [ $version -lt 11 ]
then
	echo "Java with version: $version installed. It is older thant Java 11. Installation was not successful."
elif [ $version -eq 11 ]
then
	echo "Java with version: $version installed. Installation successful."
else
	echo "Installation failed."
fi
