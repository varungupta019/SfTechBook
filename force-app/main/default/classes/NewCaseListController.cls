public class NewCaseListController {
    
    public list<case> getNewCases(){
         List<Case> results = Database.query(
        'SELECT Id, caseNumber,Accountd, FROM Case where status=\'new\'');
        return results;
    }
}