public class TestVoid {
    Public static Account getAccount(){
        Account acc = new Account();
        acc.name = 'Test';
        insert acc;
        system.debug('acc is '+ acc);
        return acc;
            
        
    }

}