public class cGetScreenRes {
 
public String param1{get;set;}
public String Param2{get;set;}
public List<String> ListParam{get;set;}

public Pagereference PassParameter(){
    ListParam=new list<String>();
    ListParam.add(param1);  
    ListParam.add(param2);
     return null;
}

    public cGetScreenRes (){
        param1='';
        param2='';
        ListParam=new list<String>();
    }

}