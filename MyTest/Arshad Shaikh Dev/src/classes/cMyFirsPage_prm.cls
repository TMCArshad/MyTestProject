public class cMyFirsPage_prm {
public List<String> LstPrm{get;set;}
public cMyFirsPage_prm (){
    String firstNamex= ApexPages.currentPage().getParameters().get('firstName');
    String salaryx= ApexPages.currentPage().getParameters().get('salary');
    String emailx= ApexPages.currentPage().getParameters().get('email');
    String idx= ApexPages.currentPage().getParameters().get('id');
    String joiningDatex= ApexPages.currentPage().getParameters().get('joiningDate');
    String jdWithTimex= ApexPages.currentPage().getParameters().get('jdWithTime');
    
    LstPrm=new List<String>();
    LstPrm.add(firstNamex);
    LstPrm.add(salaryx);
    LstPrm.add(emailx);
    LstPrm.add(idx);
    LstPrm.add(joiningDatex);
    LstPrm.add(jdWithTimex);
}
}