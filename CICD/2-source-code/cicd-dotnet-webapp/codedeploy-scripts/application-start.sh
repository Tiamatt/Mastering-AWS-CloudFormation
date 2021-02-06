#!/bin/bash
screen -d -m -S SERVER bash -c 'cd ../home/ec2-user/cicd-dotnet-webapp && sudo dotnet cicd-dotnet-webapp.dll'