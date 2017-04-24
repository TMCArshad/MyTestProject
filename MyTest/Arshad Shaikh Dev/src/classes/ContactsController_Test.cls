@IsTest(seeAllData=true)

public class ContactsController_Test{

    public static testmethod void testContactsController(){
        test.startTest();
        
        ContactsController.getContacts();
        test.stopTest();
    
    }

}