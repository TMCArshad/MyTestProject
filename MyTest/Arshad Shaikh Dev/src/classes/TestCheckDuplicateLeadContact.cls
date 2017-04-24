@isTest
public with sharing class TestCheckDuplicateLeadContact {
     static testMethod void CountContactOfAccountUnitTest() { 
     	Lead lead=new Lead();
     	lead.lastname ='Shaikh';
     	lead.Company ='TMC';
     	lead.Status ='Working - Contacted';
     	insert lead;
     	
     	List<Lead> leadCheck= [SELECT lastname FROM Lead WHERE lastname = : lead.lastname];
     	if(leadCheck != null){
     	lead.addError('Potential Contact Duplicate');
     	}
     	
     }
}