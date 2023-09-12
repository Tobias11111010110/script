#!/bin/bash

read -rep "Question here? " 
echo "${answer}"
sudo apt update
sudo apt upgrade
sudo apt install $answer
sudo apt install maven
java -version
mvn -version