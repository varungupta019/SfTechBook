public class ContactSearch {
    public static list<contact> searchForContacts(string nm, string pc){
        list <contact> clist = [select id, name from contact where 
                                lastname = :nm AND MailingPostalCode =:pc];
        return clist;
        
    }

}