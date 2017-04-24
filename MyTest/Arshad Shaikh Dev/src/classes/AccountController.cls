public with sharing class AccountController { 
private string accountID = '';
public String str{get;set;} 
public String str1{get;set;} 
public String str2{get;set;} 
public Account accountItem{get;set;} 
public AccountController(){ 
//Constructor 
//This is account Controller
list<Account> accountList = new list<Account>(); 
accountID = System.currentPageReference().getParameters().get('aId');    
accountList = [Select ID, Name From Account Where ID = :accountID]; 
if(accountList.isEmpty() == false){ 
accountItem = accountList[0]; 
}
else{ 
ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'The Account ID is invalid.'); 
ApexPages.addMessage(msg); 
} 
}
public pageReference cancelAction(){ 
return returnToOrigination(); 
} 
public pageReference saveItem(){ 
//Do something to the Account object and then update it 
//update accountItem; 
return returnToOrigination(); 
} 
private pageReference returnToOrigination(){ 
PageReference page = new PageReference('/' + accountID ); 
page.setRedirect(true); 
return page; 
} 
}
