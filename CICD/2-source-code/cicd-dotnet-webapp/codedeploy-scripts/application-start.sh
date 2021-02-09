#!/bin/bash
sudo kill $(ps aux | grep 'cicd-dotnet-webapp.dll' | awk '{print $2}')
screen -d -m -S SERVER bash -c 'cd ../home/ec2-user/cicd-dotnet-webapp && sudo dotnet cicd-dotnet-webapp.dll'