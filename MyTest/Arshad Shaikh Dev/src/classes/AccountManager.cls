@RestResource(urlMapping='/Accounts/*/Contacts')
global class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String AccId = request.requestURI.substringBetween('/Accounts/' , '/contacts');
        Account result =  [SELECT Id, Name, (Select Id, Name from Contacts) FROM Account WHERE Id = :AccId];
        return result;
    }
}