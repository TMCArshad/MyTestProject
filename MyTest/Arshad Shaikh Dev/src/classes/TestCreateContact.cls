@isTest
public with sharing class TestCreateContact {
 static testMethod void createContact() { 
    Account testAccount = new Account();
    testAccount.Name='Test Account';
    testAccount.Count_Contact__c =56;
    insert testAccount;
        
    Contact cont = new Contact();
    //cont.id=testAccount.id;
    cont.LastName='Test';
    cont.Accountid= testAccount.id;
    insert cont;
    }
}