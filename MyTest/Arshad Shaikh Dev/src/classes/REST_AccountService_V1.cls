@RestResource(urlMapping='/v1/accounts/*')
global with sharing class REST_AccountService_V1 {
    
    @HttpGet
    global static AccountWrapper doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        AccountWrapper response = new AccountWrapper();
        
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        accountId +=  ' && '+req.requestURI;
        response.acctList = [select id, name from account limit 10];
        response.status = 'Success';
        response.message = accountId;
        return response;
    }
    
    @Httppost
    global static AccountWrapper createaccont(string name,string phone,string website){
        Restrequest req = restcontext.request;
        Restresponse res = restcontext.response;
        account a = new account();
        a.name = name;
        a.phone = phone;
        a.website = website;
        insert a;
        
        AccountWrapper response1 = new AccountWrapper();
        
        response1.acctList = [select id, name, phone, website from account where id =: a.id];
        response1.status = 'Success';
        response1.message= 'Record inserted successfully';
        
        return response1;
    }
        
    global class AccountWrapper {
        public List<Account> acctList;
        public String status;
        public String message;
        
        public AccountWrapper(){
            acctList = new List<Account>();
        }
    }
}