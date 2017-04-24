global class updateAccount implements Database.Batchable<sObject>{
    global final String Query;
    global Integer rankIndex;

    global updateAccount()
    {
        Query = 'SELECT Id FROM Account Order by CreatedDate';
        rankIndex = 1;
    }

    global Database.QueryLocator start(Database.BatchableContext BC) 
    {   
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Account> scope) 
    {   
		
        for (Account ac : scope) 
        {
            ac.Ranking__c = rankIndex;
            rankIndex = rankIndex + 1;
        }
        update scope;
    }

    global void finish(Database.BatchableContext BC) { }    
}