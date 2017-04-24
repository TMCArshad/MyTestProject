public class LeadController {
   
     @AuraEnabled
    public static Id createLead(Lead newLead) {
        insert newLead;
        return newLead.Id;
    }
   
    @AuraEnabled
    public static Id createLeadRec(Lead newLead) {
        lead led=new Lead();
        led.FirstName='Kushal';
        led.LastName='Mishra';
        led.Company='KMISHRA';
        led.Email='kmishra@kloudrac.com';
        led.Status='Open';
        insert led;
       
        return led.id;
    }
   
   
    @AuraEnabled
    public static List<Id> createLeads(String newLeads) {
        List<SObject> newSObjectsList = convertJSONToListOfSObject(newLeads);
        insert newSObjectsList;
        List<Id> newIds = new List<Id>();
        for (SObject o : newSObjectsList) {   
            newIds.add(o.Id);
        }
        return newIds;
    }
   
   
    private static List<SObject> convertJSONToListOfSObject(String json) {
        Object[] values = (Object[])System.JSON.deserializeUntyped(json);
        List<SObject> newSObjectsList = new List<SObject>();
        for (Object v : values) {
            Map<String, Object> m = (Map<String, Object>)v;
            Schema.SObjectType targetType = Schema.getGlobalDescribe().get((String)m.get('sobjectType'));
            SObject o = targetType.newSObject();
            Map<String, Schema.SObjectField> fields = targetType.getDescribe().fields.getMap();
            for (String fieldName : m.keySet()) {
                // Filter out any psuedo fields such as LastNameLocal
                Schema.SObjectField fi = fields.get(fieldName);
                if (fi != null) {
                    if (fi.getDescribe().isCreateable() && fi.getDescribe().isUpdateable()) {
                        o.put(fieldName, m.get(fieldName));
                    }
                }
            }
            newSObjectsList.add(o);
        }
        return newSObjectsList;
    }
   
    @AuraEnabled
    public static Lead newLead() {
        return (Lead)Lead.sObjectType.newSObject(null, true);
    }
}