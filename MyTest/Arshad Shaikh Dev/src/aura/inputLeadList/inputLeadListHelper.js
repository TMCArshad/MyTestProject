({
    initNewLead : function(component) {
        var self = this;  // safe reference
        alert('initNewLead');
        var getNewLead = component.get("c.newLead");
        getNewLead.setCallback(self, function(a) {
            console.log("returned: %o", a.getReturnValue());
            component.set("v.newLead", a.getReturnValue());
        });
       
        $A.enqueueAction(getNewLead);
    }
})