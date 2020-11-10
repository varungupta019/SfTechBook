@istest
public class OpportunityLineItem_Handler_test {
    
    private static testmethod void insertOLI(){
    Account acc = new Account(Name = 'Test');
    insert acc;
        
        Opportunity oppObj = new Opportunity(Name = 'TestOpp',AccountID = acc.Id,Amount = 2000,CloseDate=Date.today(),StageName='Close Won',Type='New Customer');
        insert oppObj;
        
        Product2 newProd = new Product2(Name = 'test product', family = 'test family');
        insert newProd;
        
        PriceBookEntry pbEntry = new PriceBookEntry(
            UnitPrice = 300,
            //PriceBook2Id = [select id from PriceBook2 where isStandard = true].Id,
             PriceBook2Id = Test.getStandardPricebookId(),

            Product2Id = newProd.Id,
            IsActive = true);
        //Pricebook = [select id from PriceBook2 where isStandard = true].Id

        insert pbEntry ;
        
        OpportunityLineItem oppLine = new OpportunityLineItem(pricebookentryid=pbEntry.Id,TotalPrice=2000,Quantity = 2,OpportunityID = oppObj.Id);
        insert oppLine;
        OpportunityLineItem oppLine1 = new OpportunityLineItem(pricebookentryid=pbEntry.Id,TotalPrice=2000,Quantity = 2,OpportunityID = oppObj.Id);
        insert oppLine1;
        /*OpportunityLineItem oppLine2 = new OpportunityLineItem(pricebookentryid=pbEntry.Id,TotalPrice=2000,Quantity = 2,OpportunityID = oppObj.Id);
        insert oppLine2;
       /* opportunity opp = new opportunity();
        opp.Name = 'test 123';
        Opp.CloseDate = date.today();
        Opp.StageName = 'Prospecting';
   
    insert opp;
        
        list<OpportunityLIneItem> OLIList = new list <OpportunityLineItem>();
        for ( integer i=0; i<4; i++){
            OpportunityLIneItem OLI = new OpportunityLIneItem();
            OLI.Quantity = 1;
            OLI.UnitPrice = 1000;
            OLI.opportunityid = opp.id;
            OLIList.add(oli);
        }
        insert OLIList;*/
       //list< database.saveresult> srlist = database.insert(OLilist, false);
        //system.debug(srlist);

    }}