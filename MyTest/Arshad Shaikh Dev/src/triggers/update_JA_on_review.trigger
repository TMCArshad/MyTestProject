trigger update_JA_on_review on Review__c (after insert) {
    List<Id> JaId= new List<Id>();
    for(Review__c rev:Trigger.New){
        JaId.add(rev.Job_Application__c);
    }
    
    List<Job_Application__c> JaOb=[select id, Status__c from Job_Application__c where id IN: JaId];
    
    for(Job_Application__c ja: JaOb){
        ja.Status__c= 'Interview completed';
    }
    update JaOb;
}