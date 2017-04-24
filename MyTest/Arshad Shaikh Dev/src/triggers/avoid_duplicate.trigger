trigger avoid_duplicate on Account (before insert) {
    List<String> accName= new List<String>();
    for(Account acc: Trigger.New){
        accName.add(acc.Name);
    }
    
    List<Account> accList= [select id, Name from Account where name IN: accName];
    
    Map<String,Account> mapAccount=new Map<String,Account>();
    for(Account acc: accList){
        mapAccount.put(acc.Name,acc);
    }    
    
    for(Account acc: Trigger.New){
        if(mapAccount.get(acc.name) != Null){
            acc.name.adderror('You cant add duplicate record.');
        }
    }
}