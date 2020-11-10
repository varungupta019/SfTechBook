public class AccountTriggerHandler {
    public static void CreateAccounts(list<account> acclist){
        for (account acc:acclist){
            account ac = [select id, name, billingstate from account where id=:acc.id];
        ac.shippingstate = ac.billingstate;
        acclist.add(ac);
        // this changes are amade for new branc gtesting
    }
    update acclist;
    }
}