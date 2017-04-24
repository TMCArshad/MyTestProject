trigger stopDelete on Attendee__c (before delete) {
    for(Attendee__c att: Trigger.new){
        if(Trigger.isDelete){
            if(att.Name.substring(0,2) == 'UST'){
                att.Name.addError('Sorry You can\'t Delete');
            }
        }
    }
}