public class OpportunityLineItemHandler {
    
   /* public static void BeforeInsert(list<OpportunityLineItem> OLIList){
        map<id, integer> OppMap = new map<id,integer>();
        set<id> OLI_Id = new set<id>();
        for(OpportunityLineItem OLI: OLIList){
            if(OLI.opportunityID != null){
                  OLI_id.add(OLI.opportunityID);
          }
        }        
        for (aggregateResult agr: [select opportunityid , count(id) CountOLI  from opportunityLineItem where OpportunityId  in :OLI_ID group by opportunityid]){
            
            OppMap.put((id)agr.get('opportunityid'),(integer)agr.get('countOLI'));                        
        }            
        for(OpportunityLineItem record: OLIList) {
            if(oppMap.containskey(record.OpportunityId)&& oppMap.get(record.OpportunityId)>2){
            (record).addError('Opportunity can not have more than 2 opportunity Products');
                         }    
        }       
    }*/

    public static void BeforeInsert(list<opportunityLineItem> OliList){
        set<id> OppIds = new set<id>();
        map<id,integer> OppMap = new map<id,integer>();
        
        for( opportunityLineItem OLi : OLIList){
            if(oli.opportunityid != null){
                Oppids.add(oli.opportunityid);
            }
            
            
            for(aggregateresult agr: [select count(id) CountOli, opportunityid from opportunityLineItem where opportunityid in: Oppids group by opportunityid]){
                Oppmap.put((id)agr.get('opportunityid'), (integer)agr.get('CountOli'));
            }
        }
        
        for(opportunityLineItem OLI2 : oliList){
            if(OppMap.containsKey(oli2.opportunityid) && oppMap.get(oli2.opportunityid)>2){
                Oli2.adderror('uiofiosdfuiojskldjfio');
            }                
        }         
    }
}