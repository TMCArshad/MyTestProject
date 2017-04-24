public class ContentNewController {
  public String var {get;set;}

  public ContentNewController (ApexPages.StandardController controller){ }
    public Pagereference pageredir()
    {

        var= ApexPages.currentPage().getParameters().get('aId'); 
        if(var!=null)
            {
            Pagereference newpage = new Pagereference ('/apex/contententrypage?'+var+'&action=edit');
            return newpage;
            }
        else
            {
            Pagereference newpage =Page.ContentEntryPage; 
            return newpage;
            }
        }

}