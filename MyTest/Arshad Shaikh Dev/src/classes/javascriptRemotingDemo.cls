global with sharing class javascriptRemotingDemo {
    public String objectName {get;set;}
    @RemoteAction
    global static List <Account> getRecords(String objectName) {
        List <Account> sampleData = new List <Account>();                
        sampleData = Database.query('SELECT Id, Name, AccountNumber, ShippingAddress, Phone FROM Account  WHERE Name LIKE \'%' + objectName + '%\' OR AccountNumber LIKE \'%' + objectName + '%\'');
        return sampleData;
    }
}