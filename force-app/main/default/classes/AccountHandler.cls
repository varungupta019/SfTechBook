public class AccountHandler{
    
    public static void isBeforeInsertAccount(list<account> acclist){
        for (account acc:acclist){
if (acc.rating == 'hot' && acc.type == null){
acc.adderror('Type is mandatory for the hot ratings account records');
}}}
    
    public static void afterInsertAccount(list<account>acclist){
        list<contact>conlist = new list<contact>();
for (account acc:acclist){
contact con = new contact();
con.lastname = acc.name;
con.accountid = acc.id;
conlist.add(con); 

}
if(conlist != null && conlist.size()>0)
{
insert conlist;
}}
    
    public static void AfterUpdateOpportunity(map<id,account> NewAcMap, Map<id,account> OldAcMap){
       list <opportunity> oplist = new list<opportunity>();
     //opportunity opp = new opportunity();

        system.debug('NewAcMap.values() are '+ NewAcMap.values());
        for (account acc:NewAcMap.values()){
            if(NewAcMap.get(acc.Id).rating != OldAcMap.get(acc.Id).rating && NewAcMap.get(acc.Id).rating == 'Hot'){   
                system.debug('OldAcMap.get(acc.Id).rating '+ OldAcMap.get(acc.Id).rating);
                 opportunity opp = new opportunity();
                opp.name = acc.name;
                opp.AccountId = acc.id;
                opp.CloseDate= (system.today().adddays(90));
                opp.StageName = 'prospecting';
                oplist.add(opp);      
                
                
            }}
        system.debug('oplist.size() is '+ oplist.size());
        if (oplist != null && oplist.size()>0){
            try { 
                insert oplist;
                system.debug('oplist is '+ oplist);
        }
            catch(exception e){
                system.debug('msg' + e.getMessage());
            }
        
        }
            system.debug('oplist.size() is '+ oplist.size());
            system.debug('oplist.size() is '+ oplist);


    
    
    }
    
    Public static void BeforeDeletePrimaryContact(list<account>acclist){
        Map<id, boolean> IsPrimaryContact = new map<id,boolean>();
        set<id> accountIds = new set<id>();
        if (!acclist.isempty()){
               for (account acc:acclist){
                accountIds.add(acc.id);
            }
        }
        for(contact con: [select name, accountid, Is_Primary__c from contact where accountid in:accountIds and Is_Primary__c = true]){
        IsPrimaryContact.put(con.AccountId, con.Is_Primary__c);
        }
        for (account acc:acclist){
            if (IsPrimaryContact.get(acc.id)==true && IsPrimaryContact.get(acc.id)!=null){
           

                acc.adderror('this account is associated with the primary contact, hence can\'t delete');
            }}}
    



}