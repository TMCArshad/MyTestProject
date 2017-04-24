/*
Version      : 1.0
Company      : WebSolo inc.
Date         : 03.2015
Description  : controller for VF page "PopUpAutoCloseAndRefresh"
History      :             
*/
public class PopUpAutoCloseAndRefreshContr{
    public String messsage {get;set;}
    public String checkParam {get;set;}
    public PopUpAutoCloseAndRefreshContr(){
        checkParam = 'not Ok!';
        messsage = 'Please click outside of the pop up window for Auto Close<br/>Please click  Close  to  see how parent window will be refreshed';
    }
    public PageReference CloseAndRefresh(){
        checkParam = 'Ok!';
    return null;
    }
}