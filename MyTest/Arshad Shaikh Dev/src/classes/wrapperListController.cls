public class wrapperListController {

public List<OverrideWrapper> wrappers {get; set;}
public static Integer toDelIdent {get; set;}
public static Integer addCount {get; set;}
private Integer nextIdent=0;

public wrapperListController ()
{
    wrappers=new List<OverrideWrapper>();
    wrappers.add(new OverrideWrapper(nextIdent++));
    wrappers.add(new OverrideWrapper(nextIdent++));
    wrappers.add(new OverrideWrapper(nextIdent++));
}

public class OverrideWrapper
{
    public Account ovr {get; set;}
    public boolean isSelected{ get; set; }  
    public Integer ident {get; set;}

    public OverrideWrapper(Integer inIdent)
    {
        ident=inIdent;
        isSelected = false;
        ovr=new Account();
    }
}  


public void delRow()
{
    Integer toDelPos=-1;
    for (Integer idx=0; idx<wrappers.size(); idx++)
    {
        if (wrappers[idx].ident==toDelIdent)
        {
            toDelPos=idx;
        }
    }

    if (-1!=toDelPos)
    {
        wrappers.remove(toDelPos);
    }
}

public void addRow()
{
    for (OverrideWrapper ovrw : wrappers)
    {
        system.debug('#### Is Selected = ' + ovrw.isSelected); 
        system.debug('#### Deposit Date = ' + ovrw.ovr.Name);            
        if(ovrw.isSelected) {
            ovrw.ovr.Name= '';
        }
    }
    wrappers.add(new OverrideWrapper(nextIdent++));
}
}