public class AccountUtils {
    public static list<Account> accountsByState (string cn){
        list <account> aalist = [select name, id from account where BillingState = :cn];
        return aalist;
    }

}