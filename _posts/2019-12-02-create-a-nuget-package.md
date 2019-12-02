---
layout: post
title: Create a NuGet package from a .NET Core dll
---

### Starting assumptions

* You have an existing .NET Core Class Library project
* It has a public class and some public methods
* When you compile it, it outputs a dll

### Create a NuGet account

Create a NuGet account or log in at [https://www.nuget.org/users/account/LogOn?returnUrl=%2F](https://www.nuget.org/users/account/LogOn?returnUrl=%2F). If you're signed in to Visual Studio, probably use those credentials.

Get your api key which will be used to publish your package later. Visit [https://www.nuget.org/account/apikeys](https://www.nuget.org/account/apikeys) and create a new api key. Set the scope to '*' if you want to be able to push any number of different packages with this same key. Copy the key and save it (in a password manager).

### Set your project to build a NuGet .nupkg file

[https://docs.microsoft.com/en-us/nuget/quickstart/create-and-publish-a-package-using-the-dotnet-cli](https://docs.microsoft.com/en-us/nuget/quickstart/create-and-publish-a-package-using-the-dotnet-cli)

Edit the .csproj or go to the project properties screen in Visual Studio.

Check "Generate NuGet package on build" and fill out the package id and other fields. Include a `LICENSE.md` file.

Build the project and look in the `<project>\bin\Debug` folder for a matching .nupkg file.

Open a powershell window to `<project>\bin\Debug` and run this command to publish your package:

```
dotnet nuget push yourpackagename.1.0.0.nupkg -k yourapikey -s https://api.nuget.org/v3/index.json
```

Visit your nuget profile to see the package. If the package doesn't do anything useful, follow the instructions from the link above to unlist it from the public registry.

If it does do something useful, then you probably want to bump the revision number, publish in Release mode, and push the release mode package to nuget. 
