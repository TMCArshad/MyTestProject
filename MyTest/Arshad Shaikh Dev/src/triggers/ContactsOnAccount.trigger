trigger ContactsOnAccount on Contact (after insert, after delete,after undelete,after update) {
    Set<Id> aId = new Set<Id>();
    
    if(Trigger.isInsert || Trigger.isUndelete){
        for(Contact opp : Trigger.New){
            aId.add(opp.AccountId);
        }
        List<Account> acc = [select id,Count_Contact__c from Account where Id in:aId];
        List<Contact> con = [select id from contact where AccountId in :aId];
        
        for(Account a : acc){
            a.Count_Contact__c=con.size();
            
        }update acc;
    }
    
    if(Trigger.isDelete){
        for(Contact opp : Trigger.old){
            aId.add(opp.AccountId);
        }
        List<Account> acc = [select id,Count_Contact__c from Account where Id in:aId];
        List<Contact> con = [select id from contact where AccountId in :aId];
        
        for(Account a : acc){
            a.Count_Contact__c=con.size();
            
        }update acc;
    }
   
    if(Trigger.isUpdate){
       Set<Id> OldAId = new Set<Id>(); 
        for(Contact opp : Trigger.new){
        if(opp.AccountId != Trigger.oldMap.get(opp.id).AccountId)
            aId.add(opp.AccountId);
            OldAId.add(Trigger.oldMap.get(opp.id).AccountId);
        
        }
        if(!aId.isEmpty()){
        //for new Accounts
        List<Account> acc = [select id,Count_Contact__c from Account where Id in:aId];
        //For New Account Contacts
        List<Contact> con = [select id from contact where AccountId in :aId];
        
        
        }
    }
}