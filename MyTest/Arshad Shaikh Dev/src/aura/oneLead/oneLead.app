<aura:application controller="LeadController">
    <aura:attribute name="leads" type="Lead[]"/>
    
 <div class="slds-page-header">
          <div class="slds-grid">
            <div class="slds-col slds-has-flexi-truncate">
              <p class="slds-text-heading--label">Lightning to Lead</p>
              <div class="slds-grid">
                <div class="slds-grid slds-type-focus slds-no-space">
                  <h1 class="slds-text-heading--medium slds-truncate" title="My Expenses">New Lead</h1>
                </div>
              </div>
            </div>
          </div>
        </div>
    
    <c:inputLeadList items="{!v.leads}"/>
    
    <table>
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Company</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <aura:iteration items="{!v.leads}" var="lead">
                <tr>
                    <td>{!lead.FirstName}</td>
                    <td>{!lead.LastName}</td>
                    <td>{!lead.Company}</td>
                    <td>{!lead.Email}</td>
                </tr>
            </aura:iteration>
        </tbody>
    </table>
    
    <ui:button label="Submit Leads" press="{!c.save}"/>
</aura:application>