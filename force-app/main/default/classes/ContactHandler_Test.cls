@istest
public class ContactHandler_Test {
    
    private static testMethod void contactonInsert(){
      account acc = new account();
        acc.name = 'pardesi';
        insert acc;
        list<contact> conlist = new list<contact>();
        for (integer i =0; i<100; i++){
            contact con = new contact();
            con.lastname = 'test ' + i;
            con.accountid = acc.id;
            conlist.add(con);
        }
        insert conlist;
       
        
        account acct = [select id, count_contact__c from account where id= :acc.Id];
              
        system.assertequals(101, acct.Count_Contact__c)    ;
    }
    
     private static testMethod void contactonUpdate(){
         
         account acc = new account();
        acc.name = 'pardesi';
         insert acc;
        account acc2 = new account();
        acc2.name = 'mere';
        insert acc2;
        list<contact> conlist = new list<contact>();
         list<contact> newConList = new list<contact>();
        for (integer i =0; i<100; i++){
            contact con = new contact();
            con.lastname = 'test ' + i;
            con.accountid = acc.id;
            conlist.add(con);
            //NewConList.add(con);
        }
        insert conlist;
     
         
         
         for (contact cont: conlist){
             cont.accountid =  acc2.id;
             newConList.add(cont);
         }
        update NewConList; 
         
        account acc1 = [select count_COntact__C from account where id =:acc.Id];
         
        account acct2 = [select count_Contact__C from account where id =:acc2.id];
            
          
         
         //system.assertequals (acc1.count_Contact__C, acct2.count_Contact__C);
         
        
        
         
}
    
    
    
    private static testMethod void contactonDelete(){
        
        account acc = new account();
        acc.name = 'pardesi';
        insert acc;
        list<contact> conlist = new list<contact>();
        for (integer i =0; i<10; i++){
            contact con = new contact();
            con.lastname = 'test ' + i;
            con.accountid = acc.id;
            conlist.add(con);
        }
        insert conlist;
        delete conlist;
        
        undelete conlist;
        
      
    }

     private static testMethod void contactonUndelete(){
        
    }


}