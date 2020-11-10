trigger TriggerOnCustomer on Customer__c (after insert) {
    if(trigger.isafter && trigger.isInsert){    
Trigger_Handler_customer.InsertCaseteam(trigger.new);
}
    if(trigger.isAfter && trigger.isUpdate){
       Trigger_Handler_customer.AfterUpdate(trigger.newMap, trigger.oldMap);
    }

}