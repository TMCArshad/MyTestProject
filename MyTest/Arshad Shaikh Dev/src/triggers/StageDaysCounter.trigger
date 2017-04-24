trigger StageDaysCounter on Opportunity (after undelete, before insert, before update) {
    /*
    Radar
	Development
	Initiation
	Qualification 
	Closed - Engaged
	opp.Change_Stage_Date__c
    */
    if(Trigger.IsInsert){
	    for(Opportunity opp: Trigger.new){
			if(opp.Viable__c){
				opp.Viable_Date__c = opp.Change_Stage_Date__c;
				if(opp.StageName == 'Radar'){
					opp.Radar_Date__c = opp.Change_Stage_Date__c;
				}else if(opp.StageName == 'Development'){
					opp.Development_Date__c = opp.Change_Stage_Date__c;
				}else if(opp.StageName == 'Initiation'){
					opp.Initiation_Date__c = opp.Change_Stage_Date__c;
				}else if(opp.StageName == 'Qualification'){
					opp.Qualification_Date__c = opp.Change_Stage_Date__c;
				}else{
					opp.Closed_Date__c = opp.Change_Stage_Date__c;
				}
			}
	    }
    }
    if(Trigger.IsUpdate){
    	StageDaysCounter_Helper.stageCount(Trigger.new, Trigger.old, Trigger.oldMap,Trigger.newMap);
	}
}