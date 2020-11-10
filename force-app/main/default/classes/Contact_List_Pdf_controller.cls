public class Contact_List_Pdf_controller {
    public list <contact> conlist {get;set;}
                                  
    public Contact_List_Pdf_controller(){
        conlist= [select id, lastName, firstName, phone, account.name from contact];
        
    }      
}