# Create a new application

## 1. Create a new .NET Core application:

```
dotnet new webapi --language "C#" --name CICD-DotnetCore-WebApp
```

## 2. Run it locally
```
cd CICD-DotnetCore-WebApp
dotnet run
```
navigate to https://localhost:5001/weatherforecast 

## 3. .NET Core links:
.NET docs: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-new 



# Push the source code to CodeCommit repo

## 1. Add a new git local repository:
```
cd CICD-DotnetCore-WebApp
git init
```

## 2. Add gitignore file
a) create a '.gitignore' file inside 'CICD-DotnetCore-WebApp' folder
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


## 5. Add buildspec file into source code for BuildCommit 
a) Create a new 'buildspec.yml' inside 'CICD-DotnetCore-WebApp' source code
Note, avoid 'yaml', use 'yml' instead


b) Add the following code there:
```
#Based on https://github.com/PrakashTrove/AWS-CodeBuild-NetCore/blob/master/buildspec.yml
version: 0.2
phases:
  pre_build:
    commands:
      - echo Restore started on `date`
      - dotnet restore CICD-DotnetCore-WebApp.csproj
  build:
    commands:
      - echo Build started on `date`
      - dotnet publish -c release -o ./build_output CICD-DotnetCore-WebApp.csproj
artifacts:
  files:
    - ./build_output/**/*
    - scripts/**/*
```

c) Then stage, commit and push
```
git add .
git commit -m"Add buildspec file for CodeBuild"
git push {outputCloneUrlHttp} master
```