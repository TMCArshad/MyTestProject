@IsTest(seeAllData=true)

public class AccountsController_Test{

    public static testmethod void testAccountsController(){
        test.startTest();
        
        AccountsController.getAccounts();
        test.stopTest();
    
    }

}