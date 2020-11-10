@istest

public class TestVerifyDate {
    private static testmethod void test1(){
    date dt1 = VerifyDate.CheckDates(date.valueof('2020-08-03'), date.valueof('2020-08-30'));
        date dt2 = VerifyDate.CheckDates(date.valueof('2020-07-03'), date.valueof('2020-08-30'));
        system.assertEquals(date.valueOf('2020-08-30'), dt1);
        system.assertEquals(date.valueOf('2020-07-31'), dt2);
        
    }

}