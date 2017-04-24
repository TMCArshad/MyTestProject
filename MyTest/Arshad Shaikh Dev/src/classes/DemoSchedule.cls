global class DemoSchedule implements Schedulable{
   public list<Account> accountList = new list<Account>();
   public Integer rankIndex = 1;   
   global void execute(SchedulableContext sc){
        
        Map<String,Schema.RecordTypeInfo> rtMap = Schema.SObjectType.Account.getRecordTypeInfosByName();
        accountList = [SELECT Id, Ranking__c FROM Account Order by CreatedDate];
        system.debug('--lstChnReq--'+accountList);    
              //and Lead_Merchant_Name__r.recordtypeId = :rtLeadID
        for(Account acc: accountList){
                  
        acc.Ranking__c = rankIndex;
		system.debug('--CR.Updated__c--'+acc.Ranking__c);
        system.debug('--acc.FirstName--'+rankIndex);
        rankIndex = rankIndex + 1;
        } 
		system.debug('--accountList--'+accountList);
		update accountList;
    }
    
}