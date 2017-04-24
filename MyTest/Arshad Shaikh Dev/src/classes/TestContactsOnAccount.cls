@isTest
private class TestContactsOnAccount  { 

//Method
    static testMethod void CountContactOfAccountUnitTest() { 
             
        Account testAccount = new Account();
        testAccount.Name='Test Account';
        testAccount.Count_Contact__c =56;
        insert testAccount;
        
        Contact cont = new Contact();
        //cont.id=testAccount.id;
        cont.LastName='Test';
        cont.Accountid= testAccount.id;
        insert cont;
        
        //List<Contact> delContact= [select Id,LastName FROM Contact WHERE Id = : cont.id];
        Contact contactToBeUpdated= new Contact(Id = cont.id ,AccountId = testAccount.id, lastname = 'testdata', firstname ='testdata1', OwnerId = Userinfo.getUserid());
        update contactToBeUpdated;   
        
        List<Account> Oldacc = [select id,Count_Contact__c from Account where Id = : testAccount.id];        
        List<Contact> OldCon = [select id from contact where AccountId = : cont.id ];   
        
        List<Contact> contactToBeDeleted= [select Id,LastName FROM Contact WHERE Id = : cont.id];
        delete contactToBeDeleted;  
    } 
}