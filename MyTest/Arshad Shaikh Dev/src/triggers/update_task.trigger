trigger update_task on opportunity (before update){

set<id> oppids = new set<id>();
map<id,list<task>> opptotaskmap = new map<id,list<task>>();
list<task> taskstoupdate = new list<task>();

for(opportunity opp : trigger.new){
oppids.add(opp.id);
}

list<task> tasklist = [select whatid,status from task where whatid in : oppids];

for(Task t : tasklist){
if(opptotaskmap.get(t.whatid)!=null){
list<task> temp = opptotaskmap.get(t.whatid);
temp.add(t);
opptotaskmap.put(t.whatid, temp);
}
else
{
opptotaskmap.put(t.whatid, new list<task>{t});
}

}

for(opportunity opp : trigger.new){

if(opp.Opportunity_Size__c == '> 25M' && (opp.StageName__c == '6 Month' || opp.StageName__c == '3 Month'|| opp.StageName__c == '1 Month')){
list<Task> tasklisttemp = opptotaskmap.get(opp.id);
for(task t : tasklisttemp){
t.Priority__c ='1';
taskstoupdate.add(t);
}
}
if(opp.Opportunity_Size__c == '< 25M' && opp.StageName__c == '1 Month'){
list<Task> tasklisttemp = opptotaskmap.get(opp.id);
for(task t : tasklisttemp){
t.Priority__c ='2';
taskstoupdate.add(t);
}
}
if(opp.Opportunity_Size__c == '< 25M' && opp.StageName__c == '6 Month'){
list<Task> tasklisttemp = opptotaskmap.get(opp.id);
for(task t : tasklisttemp){
t.Priority__c ='3';
taskstoupdate.add(t);
}
}

}

if(taskstoupdate.size()>0){
update taskstoupdate;
}
}