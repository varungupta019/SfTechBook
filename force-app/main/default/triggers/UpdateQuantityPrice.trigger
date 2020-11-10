trigger UpdateQuantityPrice on Opportunity (after update) {
    updateQuantityPrice_On_ParentOpportunity.AfterUpdateOpportunity(trigger.NewMap , Trigger.Oldmap);
    system.debug('trigger.NewMap is '+ trigger.NewMap);
    system.debug('Trigger.Oldmap is '+Trigger.Oldmap);
    
    
}