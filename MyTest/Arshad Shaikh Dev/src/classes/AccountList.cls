/*
    @Author:Mohammad Usman
    @Description: Class to get 20 Account where BillingCountry is not null
*/
public with sharing class AccountList {
public list<Account> objAccounts {get;set;}
    public AccountList(){
        try{
            objAccounts = new list<Account>();  
            objAccounts.addAll([SELECT Name,BillingStreet,BillingCity,BillingPostalCode,
                                BillingCountry FROM Account 
                                Where BillingCountry <> null limit 20]);
        }catch(Exception ex){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error:'
                                                        +ex.getMessage()));
        }
    }
}