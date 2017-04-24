public with sharing class RSSNewsReader { 
   
    public String zipCode {get;set;}
    
    public String rssQuery {get;set;}
    public boolean recordNotFound{get;set;}
    public String age{get;set;}     
    public YahooRssWrapper.channel rssFeed {get;set;}
    
    public PageReference getWeather() { //user clicked getWeather button
      return null;
   }
   
    public RSSNewsReader(ApexPages.StandardController controller) {
        age = apexpages.currentpage().getparameters().get('age');
        String query = apexpages.currentpage().getparameters().get('q');
        if(age == null || age.trim().equals('')){
            age = '';
        }
        if(query == null || query.trim().equals('')){
                Account objAcc = [SELECT Name FROM Account WHERE Id=:controller.getRecord().Id ];
            rssQuery = ObjAcc.Name;//default on load
        } else{
            rssQuery = query;
        }       
        init('http://news.search.yahoo.com/rss?p='+EncodingUtil.urlEncode(rssQuery,'UTF-8')+'&fr=sfp&age=' + age.trim());
    }


    private void init(String rssURL) {
        try{
            recordNotFound = true;
            rssFeed = YahooRssWrapper.getRSSData(rssURL);            
        }catch(Exception ex){
            recordNotFound = false;
        }
    }
    
     public pagereference getRSSFeed2() {  
        apexpages.currentpage().getparameters().put('q',rssQuery);      
        init('http://news.search.yahoo.com/rss?p='+EncodingUtil.urlEncode(rssQuery,'UTF-8')+'&fr=sfp&age=' + age.trim());        
        return null;
     }
}