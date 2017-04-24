<aura:application >
    <ltng:require styles="/resource/SLDS202/assets/styles/salesforce-lightning-design-system.min.css" />
    <ltng:require scripts="/resource/jquery214"></ltng:require>
    
   <div class="slds-tabs--scoped">
  <ul class="slds-tabs--scoped__nav" role="tablist">
    <li class="slds-tabs--scoped__item slds-text-heading--label slds-active" title="ACCOUNTS" 
	role="presentation">
        <a class="slds-tabs--scoped__link" href="javascript:void(0);" role="tab" tabindex="0" aria-selected="true" 
	aria-controls="tab-scoped-1" id="tab-scoped-1__item" onclick="{!c.selectTab}">
         ACCOUNTS</a></li>
    <li class="slds-tabs--scoped__item slds-text-heading--label" title="CONTACTS" role="presentation">
     <a class="slds-tabs--scoped__link" href="javascript:void(0);" role="tab" tabindex="-1" aria-selected="false" 
        aria-controls="tab-scoped-2" id="tab-scoped-2__item" onclick="{!c.selectTab}">
         CONTACTS</a></li>
    <li class="slds-tabs--scoped__item slds-text-heading--label" title="ITEM THREE"  role="presentation">
        <a class="slds-tabs--scoped__link" href="javascript:void(0);" role="tab" tabindex="-1" aria-selected="false" 
           aria-controls="tab-scoped-3" id="tab-scoped-3__item" onclick="{!c.selectTab}">
            ITEM THREE</a></li>
  </ul>
  <div id="tab-scoped-1" class="slds-tabs--scoped__content slds-show" role="tabpanel" aria-labelledby="tab-scoped-1__item"><c:AccountsList /></div>
  <div id="tab-scoped-2" class="slds-tabs--scoped__content slds-hide" role="tabpanel" aria-labelledby="tab-scoped-2__item"><c:ContactList /></div>
  <div id="tab-scoped-3" class="slds-tabs--scoped__content slds-hide" role="tabpanel" aria-labelledby="tab-scoped-3__item">Item Three Content</div>
</div>
</aura:application>