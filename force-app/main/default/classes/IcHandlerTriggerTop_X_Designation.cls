public class IcHandlerTriggerTop_X_Designation {
    
     public static void IcHandlermethod(list<Top_X_Designation__c> TXDlist, Boolean isDelete ){
      Map<ID, Top_X_Designation__c> mapofTopTrue = new  Map<ID, Top_X_Designation__c>(); 
      Map<ID, Top_X_Designation__c> mapofTopFalse= new  Map<ID, Top_X_Designation__c>(); 
   
   
      set<String>  oppIds = new set<String>();   
         for(Top_X_Designation__c tx: TXDlist){
             if(tx.Document_Attached__c == true && (tx.Type__c == 'Contract Flow Down' || tx.Type__c == 'HandOff')){
               if(isDelete==false){ 
               mapofTopTrue.put(tx.Opportunity__c , tx) ;
             }
             else if (isDelete==true){
               mapofTopFalse.put(tx.Opportunity__c , tx) ;
                 
              } 
             }
             else {
                mapofTopFalse.put(tx.Opportunity__c , tx) ;  
             }
             oppIds.add(tx.Opportunity__c);
         }
       getAllopportunities(oppIds, mapofTopTrue ,mapofTopFalse, isDelete) ;
     }
    
    
    
    Public Static void getAllopportunities(set<String> oppIds ,  Map<Id, Top_X_Designation__c> mapofTopTrue ,Map<ID, Top_X_Designation__c> mapofTopFalse,Boolean isDelete){
    List<Opportunity> opplist = [select id, Handoff_Attached__c from opportunity where id in:oppIds];
        for(Opportunity opp :opplist ) {
            if(isDelete==false){
                if(mapofTopTrue.containskey(opp.id)){
                    opp.Handoff_Attached__c = 'yes';
                }
                else if(mapofTopFalse.containskey(opp.id)){
                  opp.Handoff_Attached__c = 'No';  
                }
        }
            else if(isDelete==true){
                if(mapofTopFalse.containskey(opp.id)){
                   opp.Handoff_Attached__c = 'No'; 
                }    
            }   
            
        }     
        if(opplist.size()>0){
            update opplist;
        }
        
    }

}