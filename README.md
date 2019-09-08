<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.imgur.com/hKwFkEZ.png" alt="Project logo"></a>
</p>

<h3 align="center">Novus Repository Template.</h3>
---

<p align="center"> Easily create a Novus repository and deploy in minutes!
    <br> 
</p>


## 🧐 About <a name = "about"></a>
Novus repository template is a handmade script and repo template that helps developers or hobbist, create a place to freely destribute their packages, doesnt matter if it is a Theme, Addon, Application or something else, this makes distributing under Novus easy!.

## 🏁 Getting Started <a name = "getting_started"></a>
Getting started for creating your own repository is easy, just follow the instructions that are given below.

### Prerequisites
In order to start creating you own Novus repository is recommened that you have both [MacPT](https://github.com/Official-polar-team/MacPT) and [NovusCLI](https://github.com/Official-polar-team/NovusCLI) installed. 

Is also recommended to have basic Linux utilities installed on your Mac via [Project Serna](https://sernarepo.com/) to install them open your terminal ```Applications ---> Utilities ---> Terminal ``` and type ```nvs install xz-utils perl apt-utils```  after this click enter, you are going to be prompted to type your password, after this everything should be done.

### 🔽 Downlaoding

In order to be able to manipulate and create your repo you are going to need a special set of utilies that we list below:

* [GitHub Desktop](https://desktop.github.com/)
* [iTerm 2](https://www.iterm2.com/)

### 🍴 Forking and GitHub setup

In order to create your own repository you are going to need to create to fork to the repo and create a ```.github.io``` website follow this steps (ProTip: Click on bullets to deploy content!):

<details>
  <summary>Setting up github.io</summary>
  <p>Navigate to your profile page to do this click on your profile (Upper right corner) after this go to profile ---> Repositories.</p>
  <p>Create a new repository by clicking on "New" after this select this name structure: yourusername.github.io <--- replace your username with your actual username for example: diegomagdaleno.github.io. And check the box "Initialize this repository with a readme". </p>
</details>
<details>
  <summary>Forking the repository.</summary>
  <p>Once you are done following the steps to get your own repository are simple, in this repository click go to the uper right corner and locate a button that says "Fork" after clicking on it, once you are into the repository go to settings and change the name to whatever you would like it to be.</p>
</details>


## Configuring your repository
### Initializing and basic configuration

* Once you are all done with the steps below open GitHub desktop, there are many ways to do so:
  * Go to ```Applications —> GitHub desktop```
  * Press ```cmd + space``` and search GitHub desktop.
  * Go to launchpad and search for GitHub desktop.
* Inside of GitHub desktop after doing the configuration of your account, go to your menu bar and click on ```File —> Clone repository``` select the name of the repository that contains your repo.
* Once is cloned click on the ```Open on Finder``` button.
* Now is time to open iTerm 2 there are many ways to do so:
  * Go to ```Applications —> iTerm2```
  * Press ```cmd + space``` and search for iTerm2
  * Go to launchpad and search for iTerm2
* Now inside iTerm2 type ```cd``` and then take and drag and drop the folder where your repository was generated into iTerm2 and press enter
* Inside you now need to initialize the repository in order to do this inside your repository run ```./init.pl```
* Now your repository is initialized! Congrats, in the next steps we are going to go into making it actually work!.

#### Making your Novus repository actually your repository

We are almost done with the configuration process but now we need to do a little more of stuff to get the repository to:

* Contain our name and icons.
* Contain our packages.
* Be signed with a unique GPG key.

The following steps help us to achieve that things:

* To get your own icon create an image of 512 x 512 it can be whatever you want, we don't have any guidelines for icons. Make sure to name it ```RepoIcon.png```.

* In order to make release file (Our own name) we need to configure ```update.sh``` 

* To achieve this go into the folder your repository is located right click the file and select ```Open with TextEdit```

* Inside text edit locate the following block:

  * ```Origin: yourRepoNameHere
    Label: yourRepoNameHere
    Suite: stable
    Version: 1.0
    Codename: macOS
    Date: '$DATE'
    Architectures: darwin-amd64
    Components: main
    Description: Your amazing description about your repository here
    ```

* Make sure to only change ```Label``` and ```Description``` to whatever you would like, now we are into the last steps to get your repository working!. 

#### Creating your GPG key.

Novus is built with security and speed in mind, so we make obligatory the use of GPG for your repository, creating one is simple and ensures security to everyone that uses your repository. You only need to follow the next steps:

* Open iTerm2

* Inside iTerm 2 execute the following command: ```gpg --full-generate-key```.

* A block is going to appear that may look like this:

* ```gpg (GnuPG) 2.2.16; Copyright (C) 2019 Free Software Foundation, Inc.
  This is free software: you are free to change and redistribute it.
  There is NO WARRANTY, to the extent permitted by law.
  ```

  ```Please select what kind of key you want:
     (1) RSA and RSA (default)
     (2) DSA and Elgamal
     (3) DSA (sign only)
     (4) RSA (sign only)
  Your selection?
  ```

* Please select the option ```4``` after doing this the following the next options are going to appear: 

  ```
  RSA keys may be between 1024 and 4096 bits long.
  What keysize do you want? (2048)
  ```

* Novus repositories use the largest one so select ```4096```

* After this action the following block is going to appear: 

  ```
  Please specify how long the key should be valid.
           0 = key does not expire
        <n>  = key expires in n days
        <n>w = key expires in n weeks
        <n>m = key expires in n months
        <n>y = key expires in n years
  Key is valid for? (0)
  ```

* Your repository key should never expire so please select ```0```

* If you did evertyhing right the following prompt should appear: ```Is this correct? (y/N)``` Type ```y``` into your terminal and press enter. 

* Now the following propmt should appear:

  ```
  GnuPG needs to construct a user ID to identify your key.
  
  Real name:
  ```

  Follow the steps, a note here is that you can leave "Comment" section empty.

* Once a prompt like this appears: ```Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit?``` Type ```o``` into your terminal and press enter. 

* Now is time to input your password **NEVER SHARE THIS PASSWORD WITH ANYONE, NOT YOUR PARTENER, NOT EVEN TO YOUR MOM, DON'T EVEN TRUST YOURSELF**, make sure to make this password **AS SECURE AS POSSIBLE** this is vital for users security when using Novus. 

* Now your key is going to be generated, now is time to integrate your key into your repository, this is a very simple step.

  * First we need to edit our ```release.pl``` file to work with this new key. To do so execute: ```gpg --list-keys``` into your terminal to get a list of keys, select the key that contains what you specificed in the section ```pub``` and copy the value.

  * The value looks something like this: ```412CBF9DC51A09C6FF711C88BD84DD630FE1ED07```

  * Copy the value and open ```release.pl``` again, and locate a block similar to this:

    ```shell
    gpg -abs --default-key F0F27C8758ADE7983CA32739EE6CD017B9244FB1 -o ./Release.gpg ./Release #Change your key here
    ```

Change the defualt value (F0F27C8758ADE7983CA32739EE6CD017B9244FB1) to your new key.

#### Making Novus trust your key

 By default Novus is built to only trust Serna, but you can serve your key to your users so packages from your repository can be used. 

To make this possible Novus uses special names on the files. This is our last step and is very easy to achieve:

* Open iTerm2 and type ```cd``` drag your folder there again (Where your local repo files are located.)
* Now type the following command: ```gpg --armor --export you@example.com > repokey.asc``` Where you@example.com is your email.

**Congratulations! Is a celebration! Party all day I know you been waiting** You did it! You setup a Novus repository now its time to add your packages.

### Adding packages

Adding packages is easy, just drop the .deb into the /packages/ folder and then run ```./update.sh``` this should update your packages, now you gotta commit your changes back to github

## ⛏️ Built Using <a name = "built_using"></a>
- [Perl](https://www.rust-lang.org/) - The only used programming language.
- [MacPT](https://github.com/DiegoMagdaIeno/MacPT) - Backend/Package manager.
- [Project Serna](https://sernarepo.com/) - Main repository.

## ✍️ Authors <a name = "authors"></a>
- [@DiegoMagdaleno](https://github.com/DiegoMagdaIeno) - Perl rewrite, documentation.
- [@Diatrus](https://github.com/Diatrus) - Original Script
  - See also the list of [contributors](https://github.com/Official-polar-team/NovusCLI/graphs/contributors) who participated in this project

