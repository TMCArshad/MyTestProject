public with sharing class StageDaysCounter_Helper {
	static Map<String, Integer> stageValue= new Map<String, Integer>();
    	
    public static void stageCount(List<Opportunity> newlistOpps,List<Opportunity> oldlistOpps,Map<Id, Opportunity> oldMap,Map<Id, Opportunity> newMap){
    	stageValue.put('Radar',1);
	    stageValue.put('Development',2);
	    stageValue.put('Initiation',3);
	    stageValue.put('Qualification',4);
	    stageValue.put('Closed - Engaged',5);
	    stageValue.put('Closed - Reffered',6);
	    stageValue.put('Closed - Lost',7);
	    stageValue.put('Closed - NA',8);
	    
	    for(Opportunity opp:newlistOpps){
	    	if(opp.Viable__c){
	    		if(!oldMap.get(opp.Id).Viable__c){
	    			 opp.Viable_Date__c = opp.Change_Stage_Date__c;
					 StageDaysCounter_Helper.setDatesForward(opp,oldMap);	
				}
				if(opp.StageName != oldMap.get(opp.Id).stageName && stageValue.get(opp.StageName) > stageValue.get(oldMap.get(opp.Id).stageName)){
					StageDaysCounter_Helper.setDatesForward(opp,oldMap);
				}
				if(opp.StageName != oldMap.get(opp.Id).stageName && stageValue.get(opp.StageName) < stageValue.get(oldMap.get(opp.Id).stageName)){
					StageDaysCounter_Helper.setDatesBackward(opp,oldMap);
				}
				StageDaysCounter_Helper.calculateDays(opp);
			}
			if(oldMap.get(opp.Id).Viable__c  && opp.Viable__c == false){
				 StageDaysCounter_Helper.calculateDays(opp);	
			}
	    } 
    }
    static void setDatesBackward(Opportunity opp,Map<Id, Opportunity> oldMap){
    	 if(oldMap.get(opp.Id).stageName != 'Radar' && opp.StageName == 'Radar'){
    	 	opp.Development_Days__c = null;
    	 	opp.Initiation_Days__c = null;
    	 	opp.Qualification_Days__c = null;
    	 	
    	 	opp.Development_Date__c = null;
    	 	opp.Initiation_Date__c = null;
    	 	opp.Qualification_Date__c = null;
    	 	opp.Closed_Date__c = null;
    	 }
    	 if(oldMap.get(opp.Id).stageName != 'Development' && opp.StageName == 'Development'){
    	 	opp.Initiation_Days__c = null;
    	 	opp.Qualification_Days__c = null;
    	 	
    	 	opp.Initiation_Date__c = null;
    	 	opp.Qualification_Date__c = null;
    	 	opp.Closed_Date__c = null;
    	 }
    	 if(oldMap.get(opp.Id).stageName != 'Initiation' && opp.StageName == 'Initiation'){
    	 	opp.Qualification_Days__c = null;
    	 	
    	 	opp.Qualification_Date__c = null;
    	 	opp.Closed_Date__c = null;
    	 }
    	 if(oldMap.get(opp.Id).stageName != 'Qualification' && opp.StageName == 'Qualification'){
    	 	opp.Closed_Date__c = null;
    	 }
    }
    static void setDatesForward(Opportunity opp,Map<Id, Opportunity> oldMap){
    	if(opp.StageName == 'Radar'){
			opp.Radar_Date__c = opp.Change_Stage_Date__c;
		}else if(opp.StageName == 'Development'){
			opp.Development_Date__c = opp.Change_Stage_Date__c;
		}else if(opp.StageName == 'Initiation'){
			opp.Initiation_Date__c = opp.Change_Stage_Date__c;
		}else if(opp.StageName == 'Qualification'){
			opp.Qualification_Date__c = opp.Change_Stage_Date__c;
		}else if(!oldMap.get(opp.Id).stageName.contains('Closed') && opp.StageName.contains('Closed')){
			opp.Closed_Date__c = opp.Change_Stage_Date__c;
		}
    }
    static void calculateDays(Opportunity opp){
    	if(opp.Radar_Date__c !=null){
    		Date radarDt = (opp.Development_Date__c!= null) ? (opp.Development_Date__c) : ( opp.Initiation_Date__c!= null ? opp.Initiation_Date__c : (opp.Qualification_Date__c != null  ? opp.Qualification_Date__c : (opp.Closed_Date__c != null ? opp.Closed_Date__c : opp.Change_Stage_Date__c)));
    		opp.Radar_Days__c = opp.Radar_Date__c.daysBetween(radarDt);
    	}
    	if(opp.Development_Date__c !=null){
    		Date devDt = ( opp.Initiation_Date__c!= null ? opp.Initiation_Date__c : (opp.Qualification_Date__c != null  ? opp.Qualification_Date__c : (opp.Closed_Date__c != null ? opp.Closed_Date__c : opp.Change_Stage_Date__c)));
    		opp.Development_Days__c = opp.Development_Date__c.daysBetween( devDt);	
    	}
    	if(opp.Initiation_Date__c !=null){
    		Date intDt = (opp.Qualification_Date__c != null  ? opp.Qualification_Date__c : (opp.Closed_Date__c != null ? opp.Closed_Date__c : opp.Change_Stage_Date__c));
    		opp.Initiation_Days__c = opp.Initiation_Date__c.daysBetween( intDt);	
    	}
    	if(opp.Qualification_Date__c !=null){
    		Date qulDt = opp.Closed_Date__c != null ? opp.Closed_Date__c : opp.Change_Stage_Date__c;
    		opp.Qualification_Days__c = opp.Qualification_Date__c.daysBetween( qulDt);	
    	}
    }
}