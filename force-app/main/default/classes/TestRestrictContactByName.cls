@isTest
public class TestRestrictContactByName {
    private static testMethod void testname(){
        contact con1 = new contact (FirstName = 'ram', lastname = 'INVALIDNAME');
        test.startTest();
        database.saveresult dr = database.insert(con1, false);
        test.stopTest();
        
        system.assert(!dr.isSuccess());
        system.assert(dr.getErrors().size()>0);
        system.assertEquals('The Last Name "'+con1.LastName+'" is not allowed for DML', dr.geterrors().get(0).getmessage());
        
            
        
        
        
        
    }

}