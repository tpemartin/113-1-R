# Git and Github

  - Git: A version control system (VCS) that allows you to track changes in your code.  
  - Github: A platform that store your project files.  

## Why Github?  

- Version control
- Collaboration
- Portfolio
- Showcase your work
- Documentation

## Repository (repo)

Storage for your project files. 

## Use Github in POSIT

Benefits of using Github for POSIT project: 

- :exclamation: enjoy the benefits of version control, and collaboration (good for final project).

### Steps  

  1. Get the link of the repository.  
  2. Start a new project in POSIT with the link.  
  3. Run 

### 1. Create a repository

We use fork to create a repository here.

![](../img/fork.jpg), then at the next page, click ![](../img/create-fork.jpg)

### 2. Obtain the link of the repository

![](../img/2024-11-08-17-05-47.png)

  - Make sure the repo title indicate the repo is forked.  
  - Click Code button, then copy the url link 
  
![](../img/2024-11-08-17-09-55.png)

### 3. Start a new project in POSIT with the link

![](../img/2024-11-08-17-11-21.png)

### 4. Setup github in POSIT

Open **rstudio-git-configuration.R** file. 

Install required packages by click install.
![](../img/2024-11-08-17-14-23.png)

Click <img src="../img/2024-11-08-17-16-24.png" width = "80px"> to setup github.


### Setup tidyverse in POSIT

> This step is not for github setup. It is for final project needs. 

Click open **.Rprofile** file.
Install required packages by click install.
![](../img/2024-11-08-17-19-50.png)

## How to use Git 

There are basically two steps:
  1. Store changes locally through **commit**.   
  2. Store the committed changes in Github through **push**.

### 1. commit  

At the Git tab in RStudio, you can see the changes you made in your project. Check those changes you want to record and click "commit". 
![](../img/![](../img/2024-11-08-18-16-41.png).png)

Finalize the commit by writing some commit message and hit "commit".
![](../img/2024-11-08-18-19-10.png)

### 2. push

At the Git tab in RStudio, click "push" to store the committed changes in Github.

:exclamation: If push fails, you need to go over [4. Setup github in POSIT](#4-setup-github-in-posit) again.