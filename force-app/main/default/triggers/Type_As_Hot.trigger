trigger Type_As_Hot on Account (before insert, after insert, after update, before Delete) {
list<contact>conlist = new list<contact>();

if(trigger.isInsert && trigger.isBefore){
AccountHandler.isBeforeInsertAccount(trigger.new);
}
if(trigger.isafter && trigger.isinsert){
AccountHandler.afterInsertAccount(trigger.new);
}
if (trigger.isAfter && Trigger.isUpdate){
AccountHandler.AfterUpdateOpportunity(trigger.newmap, trigger.oldMap);
}
if (trigger.isBefore && trigger.Isdelete){
AccountHandler.BeforeDeletePrimaryContact(trigger.old);
}


}