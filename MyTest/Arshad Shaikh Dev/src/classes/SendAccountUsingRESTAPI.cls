public class SendAccountUsingRESTAPI {
  private final String clientId = '3MVG9ZL0ppGP5UrBnfLP0zq.ms6KiK6PnHeESyZSYPhLKwBllexdhZM7a0HyhREHQ3WNUxJrIzPOinIUn0MR6';
   private final String clientSecret = '3406243990184708183';
   private final String username = 'arshadsdeveloper@gmail.com.dev';
   private final String password = 'arsh@234OyrbDGzqs4Yr6TmYaztcf8Ro';
  
  public class deserializeResponse
   {
      public String id;
      public String access_token;
   }
   public String ReturnAccessToken ()
   {
      String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
      Http h = new Http();
      HttpRequest req = new HttpRequest();
      req.setBody(reqbody);
      req.setMethod('POST');
      req.setEndpoint('https://teeofftech-dev-ed.my.salesforce.com/services/oauth2/token');
      HttpResponse res = h.send(req);
      deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
      return resp1.access_token;
   }
   
   public String ReturnReport (String access_Token)
   {
      Http http = new Http();
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
       
        httpReq.setMethod('GET');
        httpReq.setHeader('Authorization', 'Bearer ' + access_Token);
        httpReq.setEndpoint(
            URL.getSalesforceBaseUrl().toExternalForm()+
            '/services/data/v29.0/analytics/reports/00O28000004tXTA?includeDetails=true'
        );
       
        httpRes = http.send(httpReq);
       
        return httpRes.getBody();
   }
   
   @future(callout=true)
   public static void callcreateAcc ()
   {
      SendAccountUsingRESTAPI acount1 = new SendAccountUsingRESTAPI();
      String accessToken;
      accessToken = acount1.ReturnAccessToken ();
	  System.debug('accessToken==>'+accessToken);
	  String JsonStringReport = acount1.ReturnReport(accessToken);
	  System.debug('JsonStringReport==>'+JsonStringReport);
      
   }
}