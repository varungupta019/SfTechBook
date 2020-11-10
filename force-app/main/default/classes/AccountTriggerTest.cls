@istest

public class AccountTriggerTest {
    private static testMethod void testState(){
       list<account>alist = new list<account>();
        for (integer i=0; i<200; i++){
            account ac = new account ();
            ac.Name = 'test '+i;
            ac.BillingState= 'CA';
            alist.add(ac);
            test.startTest();
            insert alist;
            test.stopTest();
        }
        
        system.assertEquals(200, alist.size());
        
        for (account acct:alist){
            account acc= [select id, shippingstate from account where id =:acct.Id];
        system.assertEquals('CA', acct.ShippingState);   
            
        }
        
    }
}