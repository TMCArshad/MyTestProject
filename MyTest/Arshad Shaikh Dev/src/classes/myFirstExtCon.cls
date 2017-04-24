public with sharing class myFirstExtCon {
     public String ownership {get;set;}
    public myFirstExtCon (){
    
    }
    public myFirstExtCon(ApexPages.StandardController controller) {

    }
    Public PageReference Cancel(){ 
    PageReference pageCancel = new PageReference ('/apex/mycustomVF2?id=0019000001UpDsc'); 
    return pageCancel; 
    }
     public List<SelectOption> getownershipOptions()    
    {    
        List<SelectOption> options =  new List<SelectOption>();    
        options.add(new selectOption('None','--- None ---'));    
        Schema.DescribeFieldResult fieldResult = Account.ownership.getDescribe();    
        List<Schema.picklistEntry> ple = fieldResult.getPicklistValues();    
        for(Schema.picklistEntry f:ple)    
        {    
            options.add(new selectOption(f.getLabel(),f.getValue()));                    
        }    
        return Options;    
    }      
}