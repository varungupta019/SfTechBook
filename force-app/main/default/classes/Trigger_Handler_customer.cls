public class Trigger_Handler_customer {
    public static void InsertCaseteam(list<customer__C> clist)
    {
        
        caseTeamRole Ctrole = new CaseTeamRole();
        CtRole.AccessLevel = 'edit';
        ctRole.Name = 'Case Manager';
        ctRole.PreferencesVisibleInCSP = true;
        
        
        list<caseTeamMember> ctmList = new list<CaseTeamMember>();
        list<caseShare> CSList = new list <CaseShare>();
        
        for(customer__C c: Clist){
            if(c.case_manager__c != null){
                caseTeamMember ctm = new CaseTeamMember();
                ctm.MemberId= c.Case_Manager__c;
                ctm.ParentId = c.Case__c;
                ctm.TeamRoleId = ctRole.Id;
                ctmList.add(ctm);
                
                CaseShare Cs = new caseShare();
                cs.CaseAccessLevel = 'Edit';
                cs.CaseId = c.id;
                cs.UserOrGroupId = c.Case_Manager__c ;
                CSList.add(cs);
                
                
            }
            
        }
        if(ctmList != null)
        insert ctmlist;
        if( CSList != null && csList.size()>0)
            insert csList;
        } 
    
    public static void AfterUpdate(Map<id,customer__C> newCustMap, Map<id, customer__C> oldCustmap){
        set<id> Caseids = new set<id>();
        for (customer__C cust: NewCustMap.values()){
            if(NewCustMap.get(cust.id).case_Manager__C != null && NewCustMap.get(cust.id).case_Manager__C != OldCustMap.get(cust.id).case_Manager__C){
                CaseIds.add(NewCustMap.get(cust.id).case__C);
            
          }
        }
        
        if(caseIds.size()>0 && caseIds != null){
            
            
        }
        
        
        
    }
    

}

/*TRIGGER 2
// why it is not after update
// if(trigger.oldmap.get(c.Id).Account_Manager__c!=null )


The above trigger(Trigger Scenario 1) Logic is when we create Customer record for account record, then the user in Account Manager field will be automatically added to Account Team of that associated account.

Now the following trigger logic is when we update the user in the “Account Manager”, the Account team will be updated automatically.

trigger UpdateAccountTeam on Customer__c (before update) {
 List<AccountTeamMember> atm_list=new List<AccountTeamMember>();

 AccountTeamMember atm = new AccountTeamMember();

 List<AccountShare> newShare = new List<AccountShare>();


 if(trigger.isupdate)

 {

 if(trigger.isbefore)

 {

 Set<Id> setAccIds1=new Set<Id>();

 Set<Id> setDelATM=new Set<Id>();

 Map<id,Set<Id>> mapAccMgrs=new Map<id,Set<Id>>();

 for(Customer__c c:Trigger.new)

 {

 if(trigger.oldmap.get(c.Id).Account_Manager__c!=c.Account_Manager__c

 &&c.Account_Manager__c!=null )

 {

 setAccIds1.add(c.Account__c);

 }

 }

 List<Customer__c> listPLAccMgrs=“select id,Account_Manager__c,Account__c

 from Customer__c where Account__c in:setAccIds1 and id not

 in:trigger.newmap.keyset()”;

 if(listPLAccMgrs!=null && listPLAccMgrs.size()>0)

 {

 for(Customer__c c:listPLAccMgrs)

 {

 Set<Id> idMgrs=mapAccMgrs.get(c.Account__c);

 if(null==idMgrs){

 idMgrs=new set<Id>();

 mapAccMgrs.put(c.Account__c,idMgrs);

 }

 idMgrs.add(c.Account_Manager__c);

 }

 }

 Map<id,List<AccountTeamMember>> mapStdAccTeam=new

 Map<id,List<AccountTeamMember>>();

 List<AccountTeamMember> listStdAcc Team=“select id,UserId,AccountId from

 AccountTeamMember where AccountId in:setAccIds1 “;

 if(listStdAccTeam!=null && listStdAccTeam.size()>0){

 for(AccountTeamMember recAccTeam :listStdAccTeam)

 {

 List<AccountTeamMember>

 listStdAccTeamMap=mapStdAccTeam.get(recAccTeam.AccountId);

 if(null==listStdAccTeamMap){

 listStdAccTeamMap=new List<AccountTeamMember>();

 mapStdAccTeam.put(recAccTeam.AccountId,listStdAccTeamMap);

 }

 listStdAccTeamMap.add(recAccTeam);

 }

 }

 system.debug('***********'+mapAccMgrs);

 for(Customer__c c:Trigger.new)

 {

 if(trigger.oldmap.get(c.Id).Account_Manager__c!=c.Account_Manager__c

 &&c.Account_Manager__c!=null )

 {

 List<AccountTeamMember>

 listAccTeam=mapStdAccTeam.get(c.Account__c);

 Set<Id> idMgrs=mapAccMgrs.get(c.Account__c);

 if(listAccTeam!=null && listAccTeam.size()>0 )

{

 if(idMgrs!=null && idMgrs.size()>0 &&

 !(idMgrs.Contains(trigger.oldmap.get(c.Id).Account_Manager__c)))

 {

 for(AccountTeamMember recATM:listAccTeam)

 {

 if(recATM.UserId==trigger.oldmap.get(c.Id).Account_Manager__c)

 setDelATM.add(recATM.Id);

 }

 }

 else if(idMgrs==null)

 {

 for(AccountTeamMember recATM:listAccTeam)

 setDelATM.add(recATM.Id);

 }

 }

 atm = new

 AccountTeamMember(accountid=c.Account__c,teamMemberRole='Account

 Manager',UserId=c.Account_Manager__c);

 AccountShare shares = new AccountShare();

 shares.AccountId=c.Account__c;

 shares.UserOrGroupId = c.Account_Manager__c;

 shares.AccountAccessLevel='Edit';

 shares.OpportunityAccessLevel = 'None';

 newShare.add(shares);

 atm_list.add(atm);

 }

 }

List<AccountTeamMember> listDelATM=“select id from AccountTeamMember

 where id in:setDelATM”;

 if(listDelATM!=null && listDelATM.size()>0 )

 delete listDelATM;

 if(atm_list!=null)

 insert atm_list;

 if(newShare!=null && newShare.size()>0)

 List<Database.saveresult> sr=Database.insert(newShare,false);

 }

 }

*/