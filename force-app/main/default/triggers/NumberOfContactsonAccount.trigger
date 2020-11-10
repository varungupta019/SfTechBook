trigger NumberOfContactsonAccount on Contact (after Insert, after update, after delete , after Undelete) {

    if(trigger.isafter){
        
        if(trigger.isinsert){
            ContactHandler.contactOnInsert(trigger.new);
            ContactHandler.sendEmail();
        }
        
        if(trigger.isUpdate){
            ContactHandler.contactOnUpdate(trigger.NewMap, Trigger.OldMap);
            ContactHandler.sendEmailonUpdate(trigger.new);
        }
        
        if(trigger.isDelete){
            contactHandler.contactOnDelete(trigger.old);
        }
        if (trigger.isUndelete ){
            system.debug('undelete test trigger'); 
            ContactHandler.ContactonUndelete(trigger.new);
        }
    }

}