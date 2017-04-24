({
   //Fetch the accounts from the Apex controller
  getContactList: function(component) {
    var action = component.get("c.getContacts");

    //Set up the callback
    var self = this;
    action.setCallback(this, function(actionResult) {
        component.set("v.contacts", actionResult.getReturnValue());            
    });
    $A.enqueueAction(action);
  }   
})