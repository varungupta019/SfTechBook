public class New_HandlerTriggerTop_X_Designation {
    
    Public static void afterInsertDelete(list<Top_X_Designation__c> TxdNew,list<Top_X_Designation__c> TxdOld, system.TriggerOperation typ ){
        Map<opportunity, id> insertMap = new map <opportunity, id>();
        Map<opportunity, id> deleteMap = new map <opportunity, id>();
        
        /*if (typ == 'isInsert'){
            for (Top_X_Designation__c iTxd: TxdNew){

            }
        }
    */}

}