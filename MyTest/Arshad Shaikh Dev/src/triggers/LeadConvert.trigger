/*
Description: This Trigger Works On Convert Lead. To Update Account Record Type to NCAA If Lead is NCAA
*/
trigger LeadConvert on Lead (after update) {
    Set<Id> accounts= new Set<Id>();
    for(Lead newLead: Trigger.new){
        if (Trigger.oldMap.get(newLead.id).isConverted == false && newLead.isConverted == true) {

          // if a new account was created
          if (newLead.recordTypeId == label.LeadRecordTypeNCAA) {            
            accounts.add(newLead.ConvertedAccountId);
          }               

        }   
    }
    List<Account> accountList= new List<Account>();
    for(Account acc: [Select a.Id, a.Description, a.Rating From Account a Where a.Id In :accounts]){
            //acc.recordTypeId = System.label;  
            acc.Rating= 'My RATING';
            accountList.add(acc);
    }
    
    upsert accountList; 

}