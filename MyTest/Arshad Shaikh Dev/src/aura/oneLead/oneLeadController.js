({
    save : function(component, event, helper) {
        var self = this;
        var createLeads = component.get("c.createLeads");
        createLeads.setParams({
            "newLeads": $A.util.json.encode(component.get("v.leads"))
        });
        createLeads.setCallback(self, function(a) {
            if (a.getState() === "SUCCESS") {
                console.log("returned: %o", a.getReturnValue());
            } else {
                alert($A.util.json.encode(a.getError()));
            }
        })
        $A.enqueueAction(createLeads);
    }
})