flashgg_ttHgg
=======
Copied from cms-analysis/flashgg for specific modification to the ttHgg analysis
=======

This repository is for changes to the flashgg framework that are specific to the ttH analysis. It can be regularly updated or synchronised to keep in sync with other changes in flashgg. 

This version was copied from the cms-analysis/flashgg on 14th December 2015.

Instructions modified from the flashgg instructions :
* **N.B.** The branch cms-analysis_flashgg_20151214 is same as the cms-analysis/flashgg master branch on 14th Dec 2015. Comparisons can be made to that branch to see the changes made for ttHgg analysis. Do not modify that branch.
* **N.B.** Make sure you are on lxplus6 or otherwise using an SLC6 machine. Make sure SCRAM_ARCH is slc6_amd64_gcc491.
* **N.B.** While cloning into your own area, use the folder name 'flashgg' to keep the setup consistent with the flashgg setup.
* **N.B.** The setup script will check out many packages and take a while!
* **N.B.** You can ignore "error: addinfo_cache" lines. 
* **N.B.** This is to set up the latest area in a self-consistent way. 
* **N.B.** More instructions on using flashgg :  https://twiki.cern.ch/twiki/bin/viewauth/CMS/FLASHggFramework
* **N.B.** Actual flashgg git : https://github.com/cms-analysis/flashgg

Get everything you need, starting from a clean area **USE A DIFFERENT FOLDER/AREA COMPARED TO THE RGULAR flashgg CODE AREA**:
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
 cmsRun MicroAOD/test/microAODstd.py
 cmsRun Taggers/test/simple_Tag_test.py
 cmsRun Taggers/test/diphotonsDumper_cfg.py
 cmsRun Systematics/test/MicroAODtoWorkspace.py processId=wzh_125
 ```

These are just some test examples; the first makes MicroAOD from a MiniAOD file accessed via xrootd, 
the second produces tag objects and screen output from the new MicroAOD file,
and the other two process the MicroAOD file to test ntuple and workspace output.

The setup code will automatically change the initial remote branch's name to upstream to synchronize with the project's old conventions.  
The code will also automatically create an "origin" repo based on its guess as to where your personal flashgg fork is.
Check that this has worked correctly if you have trouble pushing.  (See setup.sh for what it does.)

