public class updateQuantityPrice_On_ParentOpportunity {
    public static void AfterUpdateOpportunity (Map <id, Opportunity> NewOppMap, Map <id,opportunity> OldOppMap ){
        set<id> MasterOppIds = new set<id>();
        Map<id, list<opportunity>> MasterOppMap = new map<id, list<opportunity>>();
        Map<id, decimal> TotalQuantityMap = new map<id, decimal>();
        Map<id, decimal> TotalPriceMap = new map<id, decimal>();
        list<opportunity> opplist = new list<opportunity>();
        
        for (opportunity opp: NewoppMap.values()){
            if(NewOppMap.get(opp.Id).Master_Checkbox__c	== true && OLdOppMap.get(opp.id).Master_Checkbox__c	== false){
                MasterOppIds.add(opp.id);
            }
        }system.debug('MasterOppIds are '+ MasterOppIds);
        if(MasterOppIds.size()>0){
        for(opportunity opp : [select id,Parent_Opportunity__c,(select id,Total_weight__c,TotalPrice from OpportunityLineItems) from 
                               opportunity where (Parent_Opportunity__c != null AND Parent_Opportunity__c IN :MasterOppIds)]){
            if(MasterOppMap.containsKey(opp.Parent_Opportunity__c) && MasterOppMap.get(opp.Parent_Opportunity__c) != null){
                list<opportunity> childOppList = MasterOppMap.get(opp.Parent_Opportunity__c);
                    childOppList.add(opp);
                MasterOppMap.put(opp.Parent_Opportunity__c, ChildOpplist);
                              
                }
            else{
                MasterOppMap.put(opp.Parent_Opportunity__c, new list<opportunity>{opp});
              
             }
          } 
       // }
              
            if(!MasterOppMap.isEmpty()){
                for(id MasterId: MasterOppMap.keyset()){
                    decimal totalQuantity = 0;
                    Decimal totalPrice  =0;
                    for (opportunity childopp : MasterOppMap.get(masterId)){
                        for (OpportunityLineItem oli : childopp.OpportunityLineItems ){
                            totalQuantity = totalQuantity + oli.Total_Weight__c	;
                            totalPrice = totalPrice+ oli.TotalPrice;
                                                    }
                        TotalQuantityMap.put(childOpp.Parent_Opportunity__c, TotalQuantity);
                            TotalPriceMap.put(childopp.Parent_Opportunity__c, TotalPrice);
                }
            }
            }      
                system.debug('TotalQuantityMap is '+ TotalQuantityMap);
                system.debug('TotalPriceMap is '+ TotalPriceMap);
                system.debug('MasterOppIds are '+ MasterOppIds);
                For (opportunity ParentOpp: [select id, Actual_value_per_Annum__c, Actual_Quantity_MT_per_Annum__c from opportunity where id in:MasterOppIds]){
                    if(TotalQuantityMap.keyset().contains(parentOPp.id)){
                        parentOPP.Actual_Quantity_MT_per_Annum__c = TotalQuantityMap.get(parentopp.id);
                    } 
                    if(totalPriceMap.keySet().contains(parentOpp.Id)){
                    parentOpp.Actual_Value_per_Annum__c = totalPriceMap.get(parentOpp.Id);  
                }
                    opplist.add(parentOpp);
                
            }
       // }
       // }    system.debug('opplist is '+ opplist);
            if(opplist.size()>0){
                update opplist;
            }
        //}}
}
}
}



/*
for (account acc: trigger.new)
if(acc.opportunities.size()>0){
acc.adderror("nhfuysdghfnklsdjfui")
}




*/