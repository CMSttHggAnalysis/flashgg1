flashgg_ttHgg
=======
Copied from cms-analysis/flashgg for specific modification to the ttHgg analysis
=======

This repository is for changes to the flashgg framework that are specific to the ttH analysis. It can be regularly updated or synchronised to keep in sync with other changes in flashgg. 

This version was copied from the cms-analysis/flashgg on 14th December 2015.

-----

Instructions to set up
=====

* **Instructions modified from the flashgg instructions :**


  * **N.B.** The branch cms-analysis_flashgg_20151214 is same as the cms-analysis/flashgg master branch on 14th Dec 2015. Comparisons can be made to that branch to see the changes made for ttHgg analysis. Do not modify that branch.
  * **N.B.** Make sure you are on lxplus6 or otherwise using an SLC6 machine. Make sure SCRAM_ARCH is slc6_amd64_gcc491.
  * **N.B.** While cloning into your own area, use the folder name 'flashgg' to keep the setup consistent with the flashgg setup.
  * **N.B.** The setup script will check out many packages and take a while!
  * **N.B.** You can ignore "error: addinfo_cache" lines. 
  * **N.B.** This is to set up the latest area in a self-consistent way. 
  * **N.B.** More instructions on using flashgg :  https://twiki.cern.ch/twiki/bin/viewauth/CMS/FLASHggFramework
  * **N.B.** Actual flashgg git : https://github.com/cms-analysis/flashgg

* **Get everything you need, starting from a clean area :**

**IMPORTANT : USE A DIFFERENT DIRECTORY / AREA COMPARED TO THE REGULAR flashgg CODE AREA TO NOT MIX UP THE TWO**

  The commands to setup:
  ```
 cmsrel CMSSW_7_4_15
 cd CMSSW_7_4_15/src
 cmsenv
 git cms-init
 cd $CMSSW_BASE/src 
 git clone https://github.com/CMSttHggAnalysis/flashgg_ttHgg flashgg
 source flashgg/setup.sh
 ```
Now if everything looks reasonable, you can build:
  ```
 cd $CMSSW_BASE/src
 scram b -j 9
 ```
And a very basic workflow test:
  ```
 cd $CMSSW_BASE/src/flashgg
 cmsRun Validation/python/flashgg_globeliketree_tagsorter_producer.py

 ```

These are just some test examples; to process the MicroAOD file to test ntuple and workspace output.

The setup code will automatically change the initial remote branch's name to upstream to synchronize with the project's old conventions.  

The code will also automatically create an "origin" repo based on its guess as to where your personal flashgg fork is.
Check that this has worked correctly if you have trouble pushing.  (See setup.sh for what it does.)

----

How to use this repository on GIT and some basic git commands
====

To use this repository to make changes and commit them to git:

* **Fork the repository to your user area**

  Go to https://github.com/CMSttHggAnalysis/flashgg_ttHgg and on the top right, you can see the button to **Fork** the repository. This will lead to a fork getting created at https://github.com/<your_user_name>/flashgg_ttHgg . Any changes that you make can be made to your repository and then you can create a **Pull** request to add the changes to the main repository later. The setup script already links the code in your area to your Fork.

* **Remotes**
 
  Remotes are the repositories that are hosted on the servers that are linked to the one you are working on. These inlude the original repository "CMSttHggAnalysis/flashgg_ttHgg" that is usually named as **upstream** and also your fork of the repository "<username>/flashgg_ttHgg" which is usually named as **origin**. Here the paths to the repositories contain "https://github.com/" in the beginning. The setup script is configured to make the repository of the other collaborators also available. To see their names:
  ```
 git remote -v
 ```
 
* **Sync / Merge upstream repository with your local fork**
  See details at https://help.github.com/articles/syncing-a-fork/
  Brief instructions :
  Sync between changes in upstream repository while retaining your changes:
  ```
  git fetch upstream
  #<switch to branch "master">
  git checkout master
  #<merge>
  git merge upstream/master
  
  #git pull is a convenient shortcut for completing both git fetch and git mergein the same command:
  git pull <remotename> <branchname>
  #<example:>
  git pull origin master
  ```

* **Make changes and commit them**

  For details see : https://github.com/abhikp/git-test/wiki/Committing-changes
  Brief instructions :
  Make changes to your files. To see the changes made with respect to the upstream repository:
 ```
 git status
 ```
  To add the changes to your local head
 ```
 git add <filename_of_changed_file>
 #<or>
 git add *
 git commit -m "<Comments explaining the changes>"
 
 ```
  To upload the changes to some repository like origin, the is your fork of the repository
  (you might want to "pull" the other changes made to the repository before doing this, see above)
 ```
 git push <name_of_remote> <name_of_branch>
 #< for example >
 git push origin master
 ```
  Now you can go to github.com and see the changes in your local fork and then create a pull request to merge with main code area.

* **Create your Branch / switch between brances**
 
  Branches can be used to make changes and compare different versions. To see the branches available
 ```
 git branch
 ```
  To move to a particular branch
 ```
 git checkout <branchname>
 ```
  To create a new branch and switch to it
 ```
 git checkout -b <branchname>
 ```
  To upload the branch to your remote
 ```
 git push -u origin <branchname>
 ```

* **Some additional resources on GIT :**
  1. http://rogerdudler.github.io/git-guide/
  2. https://twiki.cern.ch/twiki/bin/view/Sandbox/ASmallGitCMSSWTutorial
  3. http://cms-sw.github.io/advanced-usage.html#how-do-i-browse--search-the-code

