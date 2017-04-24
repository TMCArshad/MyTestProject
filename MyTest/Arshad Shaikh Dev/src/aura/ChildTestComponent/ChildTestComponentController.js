({
    childEventFire : function(component, event, helper) {
        var searchCompleteEvent = component.getEvent("childComponentClicked");
        
        searchCompleteEvent.setParams({
            message: 'a message from child'
        }).fire();
    },
    
    handleChildClick : function(component, event, helper) {
        var message = event.getParam("message");
        component.set("v.message", message+" for child");
    }
})