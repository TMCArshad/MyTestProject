@isTest(SeeAllData = false)

private Class LeadConvertTest {

  private static Id leadId;
   static {
     
Lead testLead = new Lead();
testLead.FirstName = 'Test First';
testLead.LastName = 'Test Last';
testLead.Company = 'Test Co';
insert testLead;
leadId = testLead.Id;

  }

static testMethod void Test_LeadConvert(){

test.StartTest();
Database.LeadConvert lc = new database.LeadConvert();
lc.setLeadId(leadId);

LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];
lc.setConvertedStatus(convertStatus.MasterLabel);

Database.LeadConvertResult lcr = Database.convertLead(lc);

System.assert(lcr.isSuccess());

Account acc =new Account();
acc.id = lc.getAccountId();
acc.Name = 'Abc';
acc.Rating ='Hot';
upsert acc;

test.StopTest();

}
   

}