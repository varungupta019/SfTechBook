trigger ClosedOpportunityTrigger on Opportunity (before Insert, before update) {
list<task> taslist = New list <task>();
for (opportunity opp:trigger.new){
if(opp.stageName == 'Closed Won'){
task tas = new task();
tas.Whatid = opp.id;
tas.subject = 'Follow Up Test Task';
taslist.add(tas);
}

}
insert taslist;
}