# Create a new application and push it into CodeCommit repo

## 1. Create a new .NET Core application:
Run the following command to create a template:
```dotnet new webapp -o cicd-dotnet-webapp```

## 2. Run it locally
```
cd cicd-dotnet-webapp
dotnet run
```
navigate to https://localhost:5001

## 3. Change port to 80
Go to Program.cs and add the following code into CreateHostBuilder() method:
``` webBuilder.UseKestrel(options => { options.Listen(IPAddress.Any, 80); }); ```
navigate to http://localhost


# ----------------------------------------------------------------------------------------
# Push the source code to CodeCommit repo

## 1. Add a new git local repository:
```
cd cicd-dotnet-webapp
git init
```

## 2. Add gitignore file
a) create a '.gitignore' file inside 'cicd-dotnet-webapp' folder
b) copy and add the following list from https://github.com/dotnet/core/blob/master/.gitignore 

## 3. Stage and commit the source code
```
git add .
git commit -m"First commit"
```

## 4. Push source code to remote CodeCommit repo
Use outputCloneUrlHttp after creating a stack from '1-code-commit' template 
```
git push {outputCloneUrlHttp} --all
```

# ----------------------------------------------------------------------------------------
# Added the following files:
- .gitignore
- buildspec.yml (for CodeBuild)
- appspec.yml (for CodeDeploy)
- codedeploy-scripts and 4 sh files
Don't forget to stage, commit and push

# Notes:
1. How can I run a dotnet application in the background using sudo on Linux?
So if you run ```cd ../home/ec2-user/cicd-dotnet-webapp && sudo dotnet cicd-dotnet-webapp.dll``` in EC2 instance, then the code will run till you are SHHed to the instance. Once you close your EC2 intance connection, the app will be stoped. Use ```screen -d -m -S SERVER bash -c 'cd ../home/ec2-user/cicd-dotnet-webapp && sudo dotnet cicd-dotnet-webapp.dll'``` instead.
Read:  
https://stackoverflow.com/questions/49479635/how-can-i-run-a-dotnet-application-in-the-background-using-sudo-on-linux 


2. Issue - CodeBuild does NOT support .NET 5.0
AWS Codebuild: Unknown runtime version named '5.0' of dotnet
The latest supported version by AWS CodeBuild is dotnet 3.1
Read:
- AWS Codebuild: Unknown runtime version named '5.0' of dotnet
https://stackoverflow.com/questions/65546757/aws-codebuild-unknown-runtime-version-named-5-0-of-dotnet
- .NET 5 Release - runtime support
https://github.com/aws/aws-codebuild-docker-images/issues/401 

# Useful Links
- .NET docs: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-new 