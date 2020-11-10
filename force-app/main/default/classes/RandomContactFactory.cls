public class RandomContactFactory {
    public static list<contact> generateRandomContacts(integer i, string sn){
        
        list<contact> conlist = new list <contact>();
        for (integer j=0;j<i;j++){
            contact con = new contact();
            con.FirstName = 'Test ' + j;
            con.lastName = 'fds';
            conlist.add(con);
        }
    return conlist;
    }
    
}