trigger NumbOfContactsAfterUndelete on Contact (Before  Insert) {

     set<id>accountIds = new set<id>();
        set<id> contactids = new set<id>();
        Map<id,account> accountMap = new map<id,account>();
        //system.debug('ContactList are  undelete'+ ContactList);
       system.debug('trigger.new  are  undelete'+ trigger.new);
        for(contact con:trigger.new){
            if(con.accountId != null){
                Accountids.add(con.accountid);
                
            }
        system.debug('Accountids are '+ Accountids);    
            
        }if(accountIds.size()>0 && accountIds!= null){
            
            for (aggregateResult agr: [select count(id) countcontact, accountid from contact 
                                       where accountid in:accountIds group by accountid]){
             Account actObj = new account (id=(id)agr.get('accountid')  , 
                                           Count_Contact__c = (decimal)agr.get('countcontact')); 
                AccountMap.put(actObj.id, actObj);
        
                                       }}
        if(accountMap.size()>0 && accountMap!= null)
        {
            update accountMap.values();
        }
}