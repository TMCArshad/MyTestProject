trigger LeadConOp on Lead (before update) {
    Map<Id,String> leadAccId = new Map<Id,String>(); // Map of the converted Contact ID and the Lead Status
    Set<Id> leadId = new Set<Id>();
    Set<Id> setCILead = new Set<Id>();
    for(Lead lead : Trigger.new){
        if (lead.IsConverted) {
            leadAccId.put(lead.Id,lead.ConvertedAccountId);
            leadId.add(lead.Id);
            //setCILead.add(lead.Course_Intake_del__c);
            System.debug('>>>>>>leadId'+leadId);
            System.debug('>>>>>>setCILead'+setCILead);
            //System.debug('>>>>>>leadAccId.get(leadId)'+leadAccId.get(leadId));
            System.debug('>>>>>>lead Id'+lead.Id);
            System.debug('>>>>>>AccountId'+lead.ConvertedAccountId);
        }  
    List<Preview_Class__c> conPrevC = [select Id,Account__c from Preview_Class__c WHERE Lead__c IN :leadId];
    for(Lead lead1 : Trigger.new){
        for ( Preview_Class__c prevC : conPrevC){
            if (lead1.IsConverted) {
                prevC.Account__c = lead1.ConvertedAccountId;
                //System.debug('>>>>>>prevC.Id');
            }
        }
    }
    System.debug('>>>>>>conPrevC'+conPrevC);
    System.debug('>>>>>>leadId'+leadId);
    System.debug('>>>>>>leadId .iterator().next();'+leadId.iterator().next());
    }
}