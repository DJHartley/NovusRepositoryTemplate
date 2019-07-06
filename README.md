<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.imgur.com/hKwFkEZ.png" alt="Project logo"></a>
</p>

<h3 align="center">Novus Repository Template.</h3>
<div align="center">

  ![Forks](https://img.shields.io/github/issues/Official-polar-team/NovusRepositoryTemplate.svg) 
  ![GitHub Issues](https://img.shields.io/github/forks/Official-polar-team/NovusRepositoryTemplate.svg)
  ![GitHub Stars](https://img.shields.io/github/stars/Official-polar-team/NovusRepositoryTemplate.svg)
  ![License](https://img.shields.io/github/license/Official-polar-team/NovusRepositoryTemplate.svg)

</div>

---

<p align="center"> Easily create a Novus repository and deploy in minutes!
    <br> 
</p>

## 📝 Table of Contents
- [About](#about)
- [Getting Started](#getting_started)
- [How to Build](#building)
- [How to Install](#installing)
- [Usage](#usage)
- [Built Using](#built_using)
- [Contributing](../CONTRIBUTING.md)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)

## 🧐 About <a name = "about"></a>
Novus repository template is a handmade script and repo template that helps developers or hobbist, create a place to freely destribute their packages, doesnt matter if it is a Theme, Addon, Application or something else, this makes distributing under Novus easy!.

## 🏁 Getting Started <a name = "getting_started"></a>
Getting started for creating your own repository is easy, just follow the instructions that are given below.

### Prerequisites
In order to start creating you own Novus repository is recommened that you have both [MacPT](https://github.com/Official-polar-team/MacPT) and [NovusCLI](https://github.com/Official-polar-team/NovusCLI) installed. 

Is also recommended to have basic Linux utilities installed on your Mac via [Project Serna](https://sernarepo.com/) to install them open your terminal ```Applications ---> Utilities ---> Terminal ``` and type ```nvs install gpg xz bzip2 perl```  after this click enter, you are going to be prompted to type your password, after this everything should be done.

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

* In order to make release file (Our own name) we need to configure ```update.pl``` 

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

* Make sure to only change ```Label``` and ```Description``` to whatever you would like 

### Manually

* If you haven't already go build NovusCLI, for instructions on that [clicking here](#Building).
* Make sure where the application name is displayed on the mac's top bar that is says ```Finder```, if it doesn't click on your desktop background or the finder icon on your dock. After doing so hold the keyboard shortcut Command + Shift + G a text field asking for a file path should appear (If anything is in the field clear it) in that text field type ```/usr/local/bin/``` and click enter.
* Drag the nvs binary you got from compiling novus in the window that just popped up.
* Congratulations! You have successfully installed NovusCLI (nvs)! Without [APT](https://launchpad.net/ubuntu/+source/apt/) (Linux) or [MacPT](https://github.com/Official-polar-team/MacPT/) (macOS) it's useless though so be sure to install what fits for your system!

## 🎈 Usage <a name="usage"></a>
NovusCLI commands:

* ```nvs search [query]``` - Searches for a package
* ```nvs list```  - Lists all packages in your resporitories
* ```nvs info [package]``` - Displays information on selected package
* ```nvs install [package]``` - Installs a package 
* ```nvs reinstall [package]``` - Reinstalls a package
* ```nvs remove [package]``` - Removes a package
* ```nvs edit-sources``` - Opens the APT repo editor
* ```nvs autoremove``` - Removes unneeded packages (orphans)
* ```nvs update``` - Updates the repository lists
* ```nvs upgrade``` - Upgrades all packages
* ```nvs full-upgrade``` - Like nvs upgrade but does more
* ```nvs version``` - Displays APT and NovusCLI versions
* ```nvs clean``` - Clear the download cache
* ```nvs help``` - Opens this help menu
* ```nvs about``` - View legal information and credits

## ⛏️ Built Using <a name = "built_using"></a>
- [RustLang](https://www.rust-lang.org/) - The only used programming language.
- [MacPT](https://github.com/DiegoMagdaIeno/MacPT) - Backend/Package manager.
- [Project Serna](https://sernarepo.com/) - Main repository.

## ✍️ Authors <a name = "authors"></a>
- [@DiegoMagdaleno](https://github.com/DiegoMagdaIeno) - Perl rewrite, documentation.
- [@Diatrus](https://github.com/Diatrus) - Original Script
- See also the list of [contributors](https://github.com/Official-polar-team/NovusCLI/graphs/contributors) who participated in this project.

## 🎉 Acknowledgements <a name = "acknowledgement"></a>
- [PacAPT by ICY](https://github.com/icy/pacapt)
