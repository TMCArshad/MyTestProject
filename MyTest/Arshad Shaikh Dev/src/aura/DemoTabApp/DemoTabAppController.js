({
     selectTab: function(component, event, helper) {
         var tabindex = event.target.getAttribute("tabindex");
         tabindex = parseInt(tabindex);
         var obj=event.target;
         //alert(tabindex);
         //alert(obj.id);
         $("div").removeAttr('class');
         $("li").removeAttr('class')
         if(obj.id=='tab-scoped-1__item'){
             $(obj).attr("tabindex", 0);
             $(obj).parent("li").attr('class','slds-tabs--scoped__item slds-text-heading--label slds-active');
             //for div class
             $("#tab-scoped-1").attr('class', 'slds-tabs--scoped__content slds-show');
             $("#tab-scoped-2").attr('class', 'slds-tabs--scoped__content slds-hide');
             $("#tab-scoped-3").attr('class', 'slds-tabs--scoped__content slds-hide');
         }
         if(obj.id=='tab-scoped-2__item'){
             $(obj).attr("tabindex", 0);
             $(obj).attr("tabindex", 0);
             $(obj).parent("li").attr('class','slds-tabs--scoped__item slds-text-heading--label slds-active');
             //for div class
             $("#tab-scoped-1").attr('class', 'slds-tabs--scoped__content slds-hide');
             $("#tab-scoped-2").attr('class', 'slds-tabs--scoped__content slds-show');
             $("#tab-scoped-3").attr('class', 'slds-tabs--scoped__content slds-hide');
         }
         if(obj.id=='tab-scoped-3__item'){
             $(obj).attr("tabindex", 0);
             $(obj).attr("tabindex", 0);
             $(obj).parent("li").attr('class','slds-tabs--scoped__item slds-text-heading--label slds-active');
             //for div class
             $("#tab-scoped-1").attr('class', 'slds-tabs--scoped__content slds-hide');
             $("#tab-scoped-2").attr('class', 'slds-tabs--scoped__content slds-hide');
             $("#tab-scoped-3").attr('class', 'slds-tabs--scoped__content slds-show');
         }
   
    }
})