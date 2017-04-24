public class NewCaseListController {
    public List<Case> getNewCases()
    {
        List<Case> caseList =[Select Id, CaseNumber,status FROM Case WHERE status = 'New'];
       

        return caseList;
    }
}