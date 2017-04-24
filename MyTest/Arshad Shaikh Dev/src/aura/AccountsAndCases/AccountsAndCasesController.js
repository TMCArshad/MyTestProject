({  
    handleAccountSelection : function(component, event) {
        var accountId = event.getParam("accountId");
        console.log(accountId);
        
        var view = "CaseList";
        var destination = "markup://c:" + view;
        
        $A.componentService.newComponentAsync(this, function(view) {
            var content = component.find("content");
            content.set("v.body", view);
        }, {
            componentDef: destination,
            attributes: {
                values: {
                    accountId: accountId
                }
            }
        }, component);
    },
    
    navigateToAccounts : function(component, event) {
        var view = "AccountList";
        var destination = "markup://c:" + view;
        
        $A.componentService.newComponentAsync(this, function(view) {
            var content = component.find("content");
            content.set("v.body", view);
        }, {
            componentDef: destination
        }, component);
    }
})