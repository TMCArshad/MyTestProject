public with sharing class RemotingAccountDemo {
    public RemotingAccountDemo(ApexPages.StandardController c) {
    }
    public Account accountLookup { get; set; }
    @RemoteAction
    public static String doSubmitForm(String acctId, String description, String website, String phone) {
        if(acctId != null) {
            Account acct = getAccount(acctId);
            if(acct != null) { 
                //DO VALIDATION HERE@!@@@!!!@!@!!@1111ONE
                acct.Description = description;
                acct.Website = website;
                acct.Phone = phone;
                update acct;
                return 'Success';
            } else {
                return 'Account could not be found';
            }
        } else {
            return 'Account Id was null';
        }
    }
 	@RemoteAction
    public static String doInsertAccount(String rating, String nameText, String phoneText, String parentAcc,
    String fax, String accountNumber, String website, String site, String tickerSymbol, String accType,
    String ownership, String industry, String numberOfEmployees, String annualRevenue, String sic ){
    	
		try{
		System.debug('--Account to be inserted-->>*Rating='+rating+'*Name='+nameText+'*phoneText='+phoneText+'*Number of employee='+numberOfEmployees);
		Integer noe = integer.valueof(numberOfEmployees);
		decimal ar = decimal.valueof(annualRevenue);
		System.debug('****annual revenue='+ar);
			Account acc= new Account(Rating = rating, 
			Name = nameText,
			Phone = phoneText,
			//ParentId = parentAcc,
			Fax = fax,
			AccountNumber = accountNumber,
			Website = website,
			Site = site, 
			TickerSymbol = tickerSymbol,
			Type = accType,
			Ownership = ownership,
			Industry = industry,
			NumberOfEmployees = noe,
			AnnualRevenue = ar,
			Sic = sic);
			insert acc;	
		} catch(DmlException e) {
    		System.debug('An unexpected error has occurred: ' + e.getMessage());
		}
		System.debug('--Values inserted .....Rating-->>'+Rating+'......Name'+nameText);
		return 'Success';
    	
    }
      
    private static Account getAccount(String acctId) {
        list<Account> accounts = [SELECT Id, Name FROM Account WHERE Id =: acctId];
        if(accounts.isEmpty()) {
            return null;
        } else {
            return accounts[0];
        }
    }
}