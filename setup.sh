#!/bin/bash

SETUP_REMOTES=true
#SETUP_REMOTES=false

echo
echo "Welcome to the FLASHgg automagic setup script modified for ttHgg!"

if [ ! -f $CMSSW_BASE/src/.git/HEAD ];
then
  echo "CMSSW area appears not to be set up correctly. Check README carefully."
  echo
  return 1
fi

NFILES=`ls -1 ${CMSSW_BASE}/src | wc -l`
if [ ! ${NFILES} = "1" ]
then
  echo "CMSSW area appears to have extra files already. Start over and check README carefully."
  echo "You can remove this condition from the setup script if you wish, but proceed with caution!"
  echo
  return 1
fi

echo
echo "You should have checked out from CMSttHggAnalysis/flashgg_ttHgg. Renaming this to upstream for convenience of existing developers..."
cd $CMSSW_BASE/src/flashgg
git remote rename origin upstream
#git remote set-url --push upstream DISALLOWED
GITHUBUSERNAME=`git config user.github`
echo "Setting up a new origin repo, assuming your fork name is ${GITHUBUSERNAME} - check this!"
git remote add origin git@github.com:${GITHUBUSERNAME}/flashgg_ttHgg.git
git config branch.master.remote origin

if ${SETUP_REMOTES} ; then
  echo "Setting up remotes listed in setup script..."
  cd $CMSSW_BASE/src/flashgg
  git remote add InnaKucher https://github.com/InnaKucher/flashgg_ttHgg
  git remote add malcles https://github.com/malcles/flashgg_ttHgg
  git remote add saghosh https://github.com/saghosh/flashgg_ttHgg
  git remote add upstream-writable git@github.com:CMSttHggAnalysis/flashgg_ttHgg.git
else
  echo "Not setting up additional remote names (default)"
fi

cd $CMSSW_BASE/src

# Removed because it requires new merging and it is not needed for default PFCHS
# Will be restored if/when required for future studies
#echo
#echo "Setting up pileupjetid..."
#git cms-addpkg RecoJets/JetProducers
#git cms-merge-topic sethzenz:topic-pujid-74X
#echo

echo "Setting up weight counter..."
git cms-addpkg CommonTools/UtilAlgos 
git cms-addpkg DataFormats/Common
git cms-merge-topic sethzenz:topic-weights-count-74X

# PUPPI is automagically in the release since 7_4_11 and 7_5_2, but we still need Multi-PUPPI
echo "Setting up PUPPI..."
git cms-addpkg CommonTools/PileupAlgos
git cms-merge-topic sethzenz:topic-puppi-7_4_12 
echo

echo "Modifying FastjetJetProducer to avoid wasting time on empty collections..."
git cms-addpkg RecoJets/JetProducers
git cms-merge-topic sethzenz:topic-jetprod-skipempty
echo

echo "Setting up Conversion tools for pat electron..."
git cms-addpkg RecoEgamma/EgammaTools
git cms-merge-topic -u sethzenz:topic-conversion-tools-for-pat-ele-74X

echo "Setting up TnP tools..."
git cms-addpkg DataFormats/RecoCandidate
git cms-addpkg PhysiscsTools/TagAndProbe
git cms-merge-topic -u matteosan1:egm_tnp


echo "adding hook for indentation"
ln -s $CMSSW_BASE/src/flashgg/Validation/scripts/flashgg_indent_check.sh $CMSSW_BASE/src/flashgg/.git/hooks/pre-commit

echo
echo "Done with setup script! You still need to build!"
echo
