@isTest
private  class pdfTest {
    @TestSetup
    private static void createContact(){
    
        list<contact> conList = new list <contact>();
    for (integer i =0; i<2; i++){
        contact con = new contact();
        con.LastName = 'test' + i;
        con.AssistantName = 'abc';
        conlist.add(con);
            
    }
        insert conlist;
    }
    static testmethod void pdfData(){
        list<contact> conlist = [select id, lastname, AssistantName from contact  ];
        list<contact> NconList = new list<contact> ();
        for (contact con:conlist){
            con.AssistantName = 'xyz';
            Nconlist.add(con);
        }
        Update Nconlist;
        
    }
    
    static testMethod void pdfMethod1(){
        
        
        
    }
    
     
    

}