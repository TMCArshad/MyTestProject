public class AccountHandler {
    public void checkAvl(List<Account> accList){
        for(Account acc: accList){
            if(acc.Name.length() < 4 ){            
                acc.Name.addError('Length Should should be greater than 4');
            }
        }
    }
}