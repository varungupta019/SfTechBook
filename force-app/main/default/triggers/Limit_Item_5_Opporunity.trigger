trigger Limit_Item_5_Opporunity on OpportunityLineItem (after insert) {
  OpportunityLineItemHandler.BeforeInsert(trigger.new);
    system.debug('this is trigger debugs');
}