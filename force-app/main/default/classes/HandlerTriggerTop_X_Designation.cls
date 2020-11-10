public class HandlerTriggerTop_X_Designation {
    
    public static void afterInsert(list<Top_X_Designation__c> TXDlist){
        List<Opportunity> oppLsttoUpdate = new List<Opportunity>();
        List<Opportunity> oppLst = HandlerTriggerTop_X_Designation.getTopXOpportunities(TXDlist);
       /* set<id> TrueOppIds = new set<id>();
        set<id> Oppset = new set<id>();
        set<id> FalseOppIds = new set<id>();
        list<opportunity> Opplist = new list<opportunity>();
        Map<id, opportunity> OppMap = new map< id, opportunity>();
        for(Top_X_Designation__c TXD: TXDLIST){
            if(txd.Opportunity__c != null){
                Oppset.add(txd.Opportunity__c);
                if(txd.Document_Attached__c == true && (txd.Type__c == 'Contract Flow Down' || txd.Type__c == 'HandOff')){
               TrueOppIds.add(txd.Opportunity__c);
                } 
                else{
                   FalseOppIds.add(txd.Opportunity__c);  
                }}
        }*/
        
        /*for (opportunity opp:[select Handoff_Attached__c, id from opportunity where id in:TrueOppIds]){
            opportunity oppNew = new opportunity();
            oppNew.Id = opp.id;
            oppNew.Handoff_Attached__c = 'Yes';
            Opplist.add(OppNew);           
            
        }*/
        for(Opportunity opp:oppLst){
            opportunity oppNew = new opportunity();
            oppNew.Id = opp.id;
            oppNew.Handoff_Attached__c = 'Yes';
            oppLsttoUpdate.add(OppNew); 
        }
        if (oppLsttoUpdate.size()>0){
            
            update oppLsttoUpdate;
        }
             
        }
    
    public static void afterUpdate( Map<id, Top_X_Designation__c> NewTxdMap,Map<id, Top_X_Designation__c> OldTxdMap ){
     set<id> falseOppids = new set<id>();
       set<id> TrueOppIds = New set<id>();
        list<opportunity> oppList = new list<opportunity>();
        
        for (Top_X_Designation__c Txd: NewTxdMap.values()){
            system.debug((NewTxdmap.get(txd.id).Document_Attached__c));
             system.debug((NewTxdmap.get(txd.id).Type__c));
             system.debug((OldTxdmap.get(txd.id).Document_Attached__c));
             system.debug((OldTxdmap.get(txd.id).Type__c));
            
        if(((NewTxdmap.get(txd.id).Document_Attached__c == true && (NewTxdMap.get(txd.id).Type__c == 'Contract Flow Down'||NewTxdMap.get(txd.id).Type__c == 'HandOff' ))  && 
              ((OldTxdmap.get(txd.id).Document_Attached__c == false && (OldTxdMap.get(txd.id).Type__c == null ||OldTxdMap.get(txd.id).Type__c == 'Contract Flow Down'||
			   OldTxdMap.get(txd.id).Type__c == 'HandOff')) ||(OldTxdmap.get(txd.id).Document_Attached__c == true &&  OldTxdMap.get(txd.id).Type__c == null)))){
                                                                                                                  
                  if(Newtxdmap.get(txd.Id).opportunity__c != null){
                      TrueOppIds.add(Newtxdmap.get(txd.Id).opportunity__c);   
                  }
        }
             if(((NewTxdmap.get(txd.id).Document_Attached__c == false && (NewTxdMap.get(txd.id).Type__c == 'Contract Flow Down'||NewTxdMap.get(txd.id).Type__c == 'HandOff' )) 
                ||(newTxdmap.get(txd.id).Document_Attached__c == true &&  newTxdMap.get(txd.id).Type__c == null )) && 
                ((OldTxdmap.get(txd.id).Document_Attached__c == true && (OldTxdMap.get(txd.id).Type__c == 'Contract Flow Down'|| OldTxdMap.get(txd.id).Type__c == 'HandOff')))) {  
                  if(Newtxdmap.get(txd.Id).opportunity__c != null){
                      FalseOppIds.add(Newtxdmap.get(txd.Id).opportunity__c);   
                  }
        }
        }
        if(TrueOppIds.size()>0 && TrueOppids != null){
            for (opportunity opp: [select id, Handoff_Attached__c from opportunity where id in:TrueOppids ]){
                opportunity oppNew = new Opportunity();
                oppNew.id = opp.id;
                OppNew.Handoff_Attached__c = 'yes';
                opplist.add(oppNew);
            }}
        
            if(FalseOppIds.size()>0 && FalseOppids != null){
                for (opportunity opp: [select id, Handoff_Attached__c from opportunity where id in:FalseOppids ]){
                    opportunity oppNew = new Opportunity();
                    oppNew.id = opp.id;
                    OppNew.Handoff_Attached__c = 'No';
                    opplist.add(oppNew);
                }
        } 
        if(opplist.size()>0){
            update opplist;
        }
        
    }
    
    public static void afterDelete(list <Top_X_Designation__c> TXDlist){
        /*set<id> Oppids = new set<id>();
        list<opportunity> opplist = new list< opportunity>();
        for (Top_X_Designation__c txd:txdlist ){
            if(txd.Opportunity__c != null){
             if(txd.Document_Attached__c == true && (txd.Type__c == 'Contract Flow Down' || txd.Type__c == 'HandOff')){
               OppIds.add(txd.Opportunity__c);
            
        }
            }
            if(oppIds.size()> 0 && OppIds != null){
                for(opportunity opp: [select id,Handoff_Attached__c from opportunity where id in: Oppids ]){
                    opportunity oppNew = new opportunity();
                    OppNew.id = opp.id;
                    Oppnew.Handoff_Attached__c = 'No';
                    opplist.add(oppNew);
                }
                
            }
            if(opplist.size()>0){
                update opplist;
            }
        
        
        }*/
        
        List<Opportunity> oppLsttoUpdate = new List<Opportunity>();
        List<Opportunity> oppLst = HandlerTriggerTop_X_Designation.getTopXOpportunities(TXDlist);
        for(Opportunity opp:oppLst){
            opportunity oppNew = new opportunity();
            oppNew.Id = opp.id;
            oppNew.Handoff_Attached__c = 'No';
            oppLsttoUpdate.add(OppNew);
            
        }
        
                    
                    if (oppLsttoUpdate.size()>0){
            
            update oppLsttoUpdate;
        }
    }
    
    Public static void UpdateOpp(list<Top_X_Designation__c> txdList){
      list<opportunity> UpOppLst = new list<opportunity>();
        list<opportunity>  oplist = HandlerTriggerTop_X_Designation.getTopXOpportunities(txdList);
        for(Opportunity opp:opList){
            opportunity oppNew = new opportunity();
            oppNew.Id = opp.id;
            oppNew.Handoff_Attached__c = 'yes';
            upopplst.add(OppNew); 
        }
        if (upopplst.size()>0){
            
            update upopplst;
        }
    }
            
        
    
    
    public static List<opportunity>  getTopXOpportunities(list <Top_X_Designation__c> TXDlist){
        set<id> Oppids = new set<id>();
        list<opportunity> opplist = new list< opportunity>();
        for (Top_X_Designation__c txd:txdlist ){
            if(txd.Opportunity__c != null){
             if(txd.Document_Attached__c == true && (txd.Type__c == 'Contract Flow Down' || txd.Type__c == 'HandOff')){
               OppIds.add(txd.Opportunity__c);
            
        }
       }
    }
        
    List<opportunity> oppLst = [select id,Handoff_Attached__c from opportunity where id in: Oppids ];
     return  oppLst;  

}
}