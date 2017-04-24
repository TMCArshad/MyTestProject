public class ConvertPageMessagesController{
    public ConvertPageMessagesController(){
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter Account name'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Account number'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter Account phone'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Please enter Account site'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Please enter Account industry'));
    }
}