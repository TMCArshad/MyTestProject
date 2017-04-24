@isTest
public class AccountListAuraControllerTest {
      
    static testMethod void testmethod1() {
    Account a1 = new account(name='account1',Description='test account1',Website='abc1@xyz.com');
        Account a2= new account(name='account2',Description='test account2',Website='abc2@xyz.com');
        List <account> aclist = new List<account>();
    acList.add(a1);
    acList.add(a2);
        insert acList;
   
    test.startTest();
        //testing the getAccounts method      
         List<Account> accList = AccountListAuraController.getAccounts();     
        System.assert(acclist!=null); 
        test.stopTest();
        
    }
 
}