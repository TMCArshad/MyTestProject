public with sharing class RemotingDemo {
    public RemotingDemo(ApexPages.StandardController c) {
    }
     
    @RemoteAction
    public static String doGetText() {
        return 'Hey, we got a response!';
    }
}