@istest
public class AccountHandler_Test {
    private static  testmethod void validationOfAccount (){
        list<account> acclist = new list<account>();
       for(integer i=0;i<100;i++)
       {account acc = new account();
       acc.name = 'test' + i;
        acc.rating = 'hot';
        acclist.add(acc);
       }
    
    test.starttest();
        list<database.saveResult> drlist = database.insert(acclist, false);
        for(database.saveResult sr :drlist ){
            system.debug(sr.isSuccess());
            system.debug(sr.getErrors());
            
            
        }
        test.stopTest();
        system.assert(drlist.size()>0);
    }
    
    private static testMethod void insertContact(){
       //list<account> acclist = new list<account>();
       //for(integer i=0;i<100;i++){
       account acc = new account();
       acc.name = 'test';
        acc.rating = 'warm';
        //acclist.add(acc);
        test.starttest();
       insert acc;
        test.stopTest();
        contact con = [select   id from contact where accountid = :acc.id];
        system.assert(con.id!= null);
            
       }
    
    
  private static testmethod void insertOpportunity(){
     list<account> acclist = new list<account>();
        for(integer i=0;i<100;i++){
            account acc = new account();
            acc.name = 'test'+i;
            acc.rating = 'warm';
            acclist.add(acc);
        }
        test.starttest();
       insert acclist;
        test.stopTest(); 
      List<Account> actoUpdate = new List<Account>();
         for (account acc:acclist){
            
            acc.Rating = 'hot';
           actoUpdate.add(acc);
             //acclist.add(acc);
        }
     update actoUpdate;
     // update  acclist;
      
       list<opportunity> opplist = [select id from opportunity where accountId in:actoUpdate];
      system.debug('opplist is '+ opplist.size());
       system.assert(opplist.size()>0);
        
        
    }
    
    private static testmethod void PrimaryContactDeleteValidation(){
       account acc = new account();
        acc.name = 'test';
        insert acc;
        contact con = new contact();
        con.LastName = acc.name;
        con.Is_Primary__c = true;
        con.Accountid = acc.id;
        insert con;
        
        database.DeleteResult dr = database.delete(acc,false);
        
        
        
        
        
        
    }
    
    
    
}