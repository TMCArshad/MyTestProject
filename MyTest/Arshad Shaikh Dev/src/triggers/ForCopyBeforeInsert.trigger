trigger ForCopyBeforeInsert on Leave__c (before insert) {
    for(Leave__c l : Trigger.new){
        l.copuyyyy__c = l.Name;
    }
}