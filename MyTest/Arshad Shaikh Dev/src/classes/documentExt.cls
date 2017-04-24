public class documentExt {
public string GPSLatitude{get;set;}
public string GPSLongitude{get;set;}
public Document d {get;set;}
public documentExt(ApexPages.StandardController controller) {
    d = (Document) controller.getRecord();
    d.folderid = UserInfo.getUserId(); //this puts it in My Personal Documents
}   
public pageReference Save(){
    d.Description = 'GPSLatitude: '+GPSLatitude+'; '+'GPSLongitude: '+GPSLongitude;
    insert d;
    return new pageReference('/'+d.id);
}
}