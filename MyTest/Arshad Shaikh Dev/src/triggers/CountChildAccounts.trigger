trigger CountChildAccounts on Account (after insert, after delete, after undelete, after update) {

    List<id> accIdList = new List<id>();
    if(Trigger.isInsert || Trigger.isUndelete || Trigger.isUpdate){
        For(Account con1 : Trigger.new){
            if(Trigger.isUpdate && Trigger.oldMap.get(con1.id).parentId != null ){
                if(con1.parentId == null)
                accIdList.add(Trigger.oldMap.get(con1.id).parentId);
            }else{
                accIdList.add(con1.parentId);
            }            
        }
    }
    if(Trigger.isDelete){
        For(Account con1 : Trigger.old){
            accIdList.add(con1.parentId);
        }
    }
    List<Account> accUpdateList = new List<Account>();
    
        For(Account acc : [SELECT arshDev__Rollup_Field__c ,(SELECT parentId FROM ChildAccounts) FROM Account WHERE id=: accIdList]){
            acc.arshDev__Rollup_Field__c  = acc.ChildAccounts.size();
            accUpdateList.add(acc);
        }
    
    try{
        update accUpdateList;
    }Catch(Exception e){
        System.debug('Exception :'+e.getMessage());
    }
}