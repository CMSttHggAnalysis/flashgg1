#ifndef flashgg_GlobalVariablesComputer_h
#define flashgg_GlobalVariablesComputer_h

#include "FWCore/Common/interface/EventBase.h"
#include "FWCore/Utilities/interface/InputTag.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"

namespace flashgg {

    class GlobalVariablesComputer
    {
    public:
        struct cache_t {
            float rho;
            int   nvtx;
            unsigned int  event;
            unsigned char lumi;
            unsigned int  run;
            float npu;
            float puweight;
            int processIndex;
        };

        GlobalVariablesComputer( const edm::ParameterSet &cfg );

        void update( const edm::EventBase &event );

        float *addressOf( const std::string &varName );
        int indexOf( const std::string &varName );
        float valueOf( const std::string &varName );
        float valueOf( int varIndex );

        const cache_t & cache() const { return cache_; }
        
        bool puReWeight() const { return puReWeight_; }
        
    protected:
        edm::InputTag rhoTag_, vtxTag_;
        bool getPu_, puReWeight_, useTruePu_;
        std::vector<double> puBins_;
        std::vector<double> puWeight_;
        edm::InputTag puInfo_;

        cache_t cache_;
    };
}

#endif // flashgg_GlobalVariablesComputer_h
// Local Variables:
// mode:c++
// indent-tabs-mode:nil
// tab-width:4
// c-basic-offset:4
// End:
// vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4

