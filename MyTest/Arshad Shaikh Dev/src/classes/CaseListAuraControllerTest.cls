@isTest(seeAllData ='False')
public class CaseListAuraControllerTest {
    
   // Test Method to cover getCaseInfo method 
   static testMethod void testmethod1() {
         Account a1 = new account(name='account1',Description='test account1',Website='abc1@xyz.com');
         List <account> aclist = new List<account>();
    //acList.add(a1);
        insert a1;
   //public static List<Case> getCaseInfo(String accountId) {
       Case case1 = new Case(
        AccountId = a1.id,
        Status = 'Working',
        Origin = 'Phone');
       insert case1;
 
   test.startTest(); 
      List<Case> caseList = CaseListAuraController.getCaseInfo(a1.Id);
      System.assert(caseList!=null);
   test.stopTest();
   }
}