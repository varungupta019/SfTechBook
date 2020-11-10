public class ContactAndLeadSearch {
    public static list<list<sobject>> searchContactsAndLeads(string nm){
        list<list<sobject>> slist = [find :nm in all fields returning contact(FirstName, LastName), lead(FirstName, LastName)];
    return slist;
    }

}