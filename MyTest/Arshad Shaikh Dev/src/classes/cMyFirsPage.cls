public class cMyFirsPage {

public PageReference PassPrmToVF() {
    Pagereference pr= Page.MyFirsPage_pass;
    pr.getparameters().put('firstName',firstName);
    pr.getparameters().put('salary',String.ValueOF(salary));
    pr.getparameters().put('email',email);
    pr.getparameters().put('id',String.ValueOF(id));
    pr.getparameters().put('joiningDate',joiningDate);
    pr.getparameters().put('jdWithTime',jdWithTime);
    pr.setRedirect(true);
        return pr;
}


public String firstName{get;set;}
public Integer salary{get;set;}
public String email{get;set;}
public Integer id{get;set;}
public String joiningDate{get;set;}
public String jdWithTime{get;set;}

}