minimalVariables = ["CMS_hgg_mass[160,100,180]:=diPhoton().mass",
                    "dZ[2,0,2]:=abs(tagTruth().genPV().z-diPhoton().vtx().z)", #only need to know if dZ<1 or dz>1
                                                                               #when doing systematics, variables need to have a binning
                                                                               #specified, otherwise the rooDataHist end up empty.
            								       #an assert in the code prevents you from doing this.
                    "centralObjectWeight[1,-999999.,999999.] := centralWeight"]

minimalHistograms = []

minimalNonSignalVariables = ["CMS_hgg_mass[160,100,180]:=diPhoton().mass"]#,"centralObjectWeight[1,-999999.,999999.] := centralWeight"]

defaultVariables=["CMS_hgg_mass[160,100,180]:=diPhoton().mass", 
                                    "leadPt                   :=diPhoton().leadingPhoton.pt",
                                    "subleadPt                :=diPhoton().subLeadingPhoton.pt",
                                    "diphoMVA                 :=diPhotonMVA().result",    
                                    "maxEta                   :=max(abs(diPhoton().leadingPhoton.superCluster.eta),abs(diPhoton().leadingPhoton.superCluster.eta))",
                                    "genZ           :=tagTruth().genPV().z",
                                    "vtxZ           :=diPhoton().vtx().z",
                                    "dZ             :=abs(tagTruth().genPV().z-diPhoton().vtx().z)"]


defaultHistograms=["CMS_hgg_mass>>mass(160,100,180)",
                                     "subleadPt:leadPt>>ptLeadvsSub(180,20,200:180,20,200)",
                                     "diphoMVA>>diphoMVA(50,0,1)",
                                     "maxEta>>maxEta[0.,0.1,0.2,0.3,0.4,0.6,0.8,1.0,1.2,1.4442,1.566,1.7,1.8,2.,2.2,2.3,2.5]"
                                     ]

systematicVariables=["CMS_hgg_mass[160,100,180]:=diPhoton().mass"]#,"centralObjectWeight[1,-999999.,999999.] := centralWeight"]
systematicHistograms=["CMS_hgg_mass>>mass(160,100,180)"]
