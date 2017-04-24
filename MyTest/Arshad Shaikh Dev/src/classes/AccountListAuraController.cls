public with sharing class AccountListAuraController {
	@AuraEnabled
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Description, Website FROM Account ORDER BY Name];
    }
}