public with sharing class CaseListAuraController {
    
    @AuraEnabled
    public static List<Case> getCaseInfo(String accountId) {
        List <Case> caseList = New List<Case>();
        for(Account acc:[select id,name,(select CaseNumber, Contact.Name, Subject , Priority, CreatedDate, Status, Owner.Name from cases) from account where id= :accountId]){
            for(case c:acc.cases)
                caseList.add(c); 
            system.debug('list of contact '+caseList);
        }
        return caseList;
    }
}