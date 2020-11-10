public class AccountController {
public static List<Account> getAllActiveAccounts() {
    system.debug('fhsdhfnn');
    system.debug('diajlkdfasd');
    return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
    
    
  }
}