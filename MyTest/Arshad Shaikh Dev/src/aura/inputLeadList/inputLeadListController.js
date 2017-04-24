({
    addLead : function(component, event, helper) {
        var leads = component.get("v.items");
        leads.push(component.get("v.newLead"));
        component.set("v.items", leads);
        
        helper.initNewLead(component);
    },
    handleInit : function(component, event, helper) {
        helper.initNewLead(component);
    },
    save : function(component, event, helper) {
         var self = this;
         var led=component.get("v.newLead");
         led.sobjectType='Lead';
        
        var createLead = component.get("c.createLead");
        createLead.setParams({"newLead": led});
        createLead.setCallback(self, function(a) {
            console.log("returned: %o", a.getReturnValue());
        });
        
        $A.enqueueAction(createLead);
    }
})