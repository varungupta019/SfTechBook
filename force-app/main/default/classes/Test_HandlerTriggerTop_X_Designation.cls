@istest

public class Test_HandlerTriggerTop_X_Designation {
    private static testMethod void  afterInsert(){
        
        opportunity opp = new opportunity();
        opp.name = 'test';
        Opp.CloseDate = system.today() + 30;
        opp.StageName = 'Qualification';
        opp.Handoff_Attached__c = 'no';
        insert opp;
        
        list <Top_X_Designation__c> txdList = new list<Top_X_Designation__c>();
        for (integer i = 0; i<10; i++){ 
            Top_X_Designation__c txd = new Top_X_Designation__c();
            txd.Document_Attached__c = true;
            txd.Type__c = 'Contract Flow Down';
            txd.Name = 'test' +i;
            txd.Opportunity__c = opp.Id;
            
            txdlist.add(txd);
                                 }
        
        insert txdlist;
             
    }    
     private static Testmethod void afterUpdate(){
         
        opportunity opp = new opportunity();
        opp.name = 'test';
        Opp.CloseDate = system.today() + 30;
        opp.StageName = 'Qualification';
        opp.Handoff_Attached__c = 'no';
        insert opp;
        
        list <Top_X_Designation__c> txdList = new list<Top_X_Designation__c>();
        for (integer i = 0; i<10; i++){ 
            Top_X_Designation__c txd = new Top_X_Designation__c();
            txd.Document_Attached__c = false;
            txd.Name = 'test' +i;
            txd.Type__c = null;
            txd.Opportunity__c = opp.Id;
            
            txdlist.add(txd);
                                 }
          for (integer i = 0; i<10; i++){ 
            Top_X_Designation__c txd = new Top_X_Designation__c();
            txd.Document_Attached__c = false;
            txd.Name = 'test' +i;
            txd.Type__c = 'Handoff';
            txd.Opportunity__c = opp.Id;
            
            txdlist.add(txd);
                                 }
        
        insert txdlist;
         list <Top_X_Designation__c> upTxdList = new list<Top_X_Designation__c>();
         for (Top_X_Designation__c txd: txdlist){
           Top_X_Designation__c txdNew = new Top_X_Designation__c();  
             txdNew.Id = txd.Id;
             txdNew.Type__c = 'Contract Flow Down';
             txdnew.Document_Attached__c = true;
             txdnew.Opportunity__c = opp.Id;
             upTxdList.add(txdNew);
         }
         update upTxdList;
    }    
    private static Testmethod void afterUpdateFalse(){
         
        opportunity opp = new opportunity();
        opp.name = 'test';
        Opp.CloseDate = system.today() + 30;
        opp.StageName = 'Qualification';
        opp.Handoff_Attached__c = 'no';
        insert opp;
        
        list <Top_X_Designation__c> txdList = new list<Top_X_Designation__c>();
        for (integer i = 0; i<10; i++){ 
            Top_X_Designation__c txd = new Top_X_Designation__c();
            txd.Document_Attached__c = true;
            txd.Name = 'test' +i;
            txd.Type__c = 'Contract Flow Down';
            txd.Opportunity__c = opp.Id;
            
            txdlist.add(txd);
                                 }
        
        insert txdlist;
         list <Top_X_Designation__c> upTxdList = new list<Top_X_Designation__c>();
         for (Top_X_Designation__c txd: txdlist){
           Top_X_Designation__c txdNew = new Top_X_Designation__c();  
        txdNew.Id = txd.Id;
             txdNew.Type__c = '';
             upTxdList.add(txdNew);
         }
         update upTxdList;
    }    
    
    //Delete trigger
    private static Testmethod void afterDelete(){
         
        opportunity opp = new opportunity();
        opp.name = 'test';
        Opp.CloseDate = system.today() + 30;
        opp.StageName = 'Qualification';
        opp.Handoff_Attached__c = 'no';
        insert opp;
        
        list <Top_X_Designation__c> txdList = new list<Top_X_Designation__c>();
        for (integer i = 0; i<10; i++){ 
             Top_X_Designation__c txd = new Top_X_Designation__c();
            txd.Document_Attached__c = true;
            txd.Name = 'test' +i;
        txd.Type__c = 'Contract Flow Down';
            txd.Opportunity__c = opp.Id;
            
            txdlist.add(txd);
                                 }
        
        insert txdlist;
        
                 delete txdlist;
        
         
         
    }    
    

}