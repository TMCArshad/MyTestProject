({
    doInit : function(component, event, helper) {
       //Update expense counters
       helper.getExpenses(component);
        component.set("v.newExpense", { 'sobjectType': 'arshDev__Expense__c',
                          'arshDev__Name': '',
                          'arshDev__Amount__c': 0,
                          'arshDev__Client__c': '',
                          'arshDev__Date__c': '',
                          'arshDev__Reimbursed__c': false
                         });
    },
    
    createExpense : function(component, event, helper) {
    var amtField = component.find("amount");
    var amt = amtField.get("v.value");
    if (isNaN(amt)||amt==''){
        amtField.set("v.errors", [{message:"Enter an expense amount."}]);
    }
    else {
        amtField.set("v.errors", null);
        var newExpense = component.get("v.newExpense");
        helper.createExpense(component, newExpense);
    }
	},
 
    updateEvent : function(component, event, helper) {
    	helper.upsertExpense(component, event.getParam("expense"));
	}
})