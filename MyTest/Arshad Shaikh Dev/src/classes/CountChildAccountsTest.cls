@isTest(seeAllData = false)
public class CountChildAccountsTest{
 static testMethod void testMethod1(){

 Test.StartTest(); 
  
 Account testAccount1 = new Account();
 testAccount1.Name='Test Account' ;
 insert testAccount1;
 
 Account testAccount2 = new Account();
 testAccount2.Name='Test Account' ;
 testAccount2.ParentId=testAccount1.id;
 insert testAccount2;
 
 Account testAccount3 = new Account();
 testAccount3.Name='Test Account' ;
 testAccount3.ParentId=testAccount1.id;
 insert testAccount3;
 
 
 delete testAccount2;
 
 Test.StopTest();
 }
}