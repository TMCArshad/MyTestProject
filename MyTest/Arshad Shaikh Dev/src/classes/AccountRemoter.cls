global with sharing class AccountRemoter {

    public String accountName { get; set; }
    public static Account account { get; set; }
    public AccountRemoter() { } // empty constructor
    
    @RemoteAction
    global static boolean getAccount(String accountName) {
        boolean updateCheck = false;
        return updateCheck ;
    }
}