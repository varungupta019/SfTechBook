trigger Update_Opp_on_TXD on Top_X_Designation__c (after insert, after update, after Delete) {
    
    
    if(trigger.isInsert && Trigger.isafter || trigger.isUpdate && trigger.isAfter){
        //New_HandlerTriggerTop_X_Designation.afterInsertDelete( trigger.new, trigger.old, trigger.operationType);
        IcHandlerTriggerTop_X_Designation.IcHandlermethod(trigger.new ,false);

    }
    
    if(trigger.isDelete && Trigger.isafter){
         IcHandlerTriggerTop_X_Designation.IcHandlermethod(trigger.old, true);
    }  

   /* if(trigger.isInsert && Trigger.isafter || trigger.isDelete && trigger.isAfter){
        New_HandlerTriggerTop_X_Designation.afterInsertDelete( trigger.new, trigger.old, trigger.operationType);
    }
    
    
    
    if(trigger.isUPdate && trigger.isAfter){
HandlerTriggerTop_X_Designation.afterUpdate(trigger.NewMap ,trigger.OldMap);
    }
    if(trigger.isDelete && trigger.isAfter){
HandlerTriggerTop_X_Designation.afterDelete(trigger.old);
    }*/
}