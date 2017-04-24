public class ContactsController {
   @AuraEnabled
   public static List<Contact> getContacts() {
       return [SELECT Id, name, Email, Phone, MailingStreet, MailingCity, MailingState, MailingPostalCode
       FROM Contact ORDER BY createdDate ASC];
   }   
}