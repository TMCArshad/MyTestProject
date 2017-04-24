trigger InsertOppTMToOpp on OpportunityTeamMember (after insert) {
	List<Opportunity> opportunityAll= new List<Opportunity>();
    Map<Id,Id> salesManager = new  Map<Id,Id>();
    for(OpportunityTeamMember oppTM: Trigger.new){
    	if(oppTM.TeamMemberRole == 'Sales Manager'){
    		salesManager.put( oppTM.OpportunityId , oppTM.UserId);
    	}
    }
    System.debug('Map Of All Team Member'+ salesManager);
    for(Opportunity opp: [select Id, User__c from Opportunity where id In : salesManager.keySet()]){
    	opp.User__c =  salesManager.get(opp.Id);
    	opportunityAll.add(opp);
    }
    System.debug('List Of All Opportunity'+ opportunityAll);
    update opportunityAll;
}