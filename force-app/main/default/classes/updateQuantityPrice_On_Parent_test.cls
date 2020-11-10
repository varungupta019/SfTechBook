@istest
public class updateQuantityPrice_On_Parent_test {
    private static testmethod void MasterOpportunity_Checkbox(){
       list <opportunity> opplist = new list <opportunity>();
        Opportunity opp = new opportunity();
        opp.Name = 'Parent Opp';
        opp.CloseDate = system.today() + 20;
        opp.StageName = 'Prospecting';
        insert opp;
        
        for (integer i=0; i<10; i++){
        Opportunity opp1 = new opportunity();
        opp1.Name = 'child Opp' +i;
        opp1.Parent_Opportunity__c = opp.Id;
        opp1.CloseDate = system.today() + 400;
        opp1.StageName = 'Prospecting';
         opplist.add(opp1);
        }
        insert opplist;
        
        // insert  an oli
Id pricebookId = Test.getStandardPricebookId();
        
        //Create your product
Product2 prod = new Product2(
     Name = 'Product X',
     ProductCode = 'Pro-X',
     isActive = true
);
insert prod;

//Create your pricebook entry
PricebookEntry pbEntry = new PricebookEntry(
     Pricebook2Id = pricebookId,
     Product2Id = prod.Id,
     UnitPrice = 100.00,
     IsActive = true
);
insert pbEntry;

//create your opportunity line item.  This assumes you already have an opportunity created, called opp
OpportunityLineItem oli = new OpportunityLineItem(
     OpportunityId = opplist.get(0).id,
     Quantity = 5,
     PricebookEntryId = pbEntry.Id,
     TotalPrice = 2 * pbEntry.UnitPrice,
    Total_Weight__c = 40
    
);
insert oli;
        
        opp.Master_Checkbox__c = true;
        
        update opp;
    
    
    
    }    
}