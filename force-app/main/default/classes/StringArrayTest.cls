public class StringArrayTest {
    public static list<string> generateStringArray(integer n){
        list<string> alist = new list <string>();
        for (integer i=0;i<n;i++){
            alist.add('Test '+i);
            system.debug(alist);
        }
        return alist;
    }

}