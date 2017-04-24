trigger avoidDeletionOFEmployeeConsultant on Consultant__c (before delete) {
    for(Consultant__c con:trigger.old){
     if(con.Type__c == 'Employee'){
        con.adderror('You cant delete Employee Consultant.');
     }
    }
}