<aura:application >
    <ltng:require styles="/resource/SLDSWin17/assets/styles/salesforce-lightning-design-system-ltng.css" />
    <div class="TeeOffTech">
        //This is where components will live
        <table class="slds-table slds-table--bordered slds-table--cell-buffer slds-table--fixed-layout">
            <thead>
                <tr class="slds-text-title--caps">
                    <th scope="col">
                        <div class="slds-truncate" title="Opportunity Name">Opportunity Name</div>
                    </th>
                    <th scope="col">
                        <div class="slds-truncate" title="Account Name">Account Name</div>
                    </th>
                    <th scope="col">
                        <div class="slds-truncate" title="Close Date">Close Date</div>
                    </th>
                    <th scope="col">
                        <div class="slds-truncate" title="Stage">Stage</div>
                    </th>
                    <th scope="col">
                        <div class="slds-truncate" title="Confidence">Confidence</div>
                    </th>
                    <th scope="col">
                        <div class="slds-truncate" title="Amount">Amount</div>
                    </th>
                    <th scope="col">
                        <div class="slds-truncate" title="Contact">Contact</div>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row" data-label="Opportunity Name">
                        <div class="slds-truncate" title="Short name"><a href="javascript:void(0);">Short name</a></div>
                    </th>
                    <td data-label="Account Name">
                        <div class="slds-truncate" title="Cloudhub">Cloudhub</div>
                    </td>
                    <td data-label="Close Date">
                        <div class="slds-truncate" title="4/14/2015">4/14/2015</div>
                    </td>
                    <td data-label="Prospecting">
                        <div class="slds-truncate" title="Prospecting">Prospecting</div>
                    </td>
                    <td data-label="Confidence">
                        <div class="slds-truncate" title="20%">20%</div>
                    </td>
                    <td data-label="Amount">
                        <div class="slds-truncate" title="$25k">$25k</div>
                    </td>
                    <td data-label="Contact">
                        <div class="slds-truncate" title="jrogers@cloudhub.com"><a href="javascript:void(0);">jrogers@cloudhub.com</a></div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" data-label="Opportunity Name">
                        <div class="slds-truncate" title="Long names get truncated"><a href="javascript:void(0);">Long names get truncated</a></div>
                    </th>
                    <td data-label="Account Name">
                        <div class="slds-truncate" title="Cloudhub">Cloudhub</div>
                    </td>
                    <td data-label="Close Date">
                        <div class="slds-truncate" title="4/14/2015">4/14/2015</div>
                    </td>
                    <td data-label="Prospecting">
                        <div class="slds-truncate" title="Prospecting">Prospecting</div>
                    </td>
                    <td data-label="Confidence">
                        <div class="slds-truncate" title="20%">20%</div>
                    </td>
                    <td data-label="Amount">
                        <div class="slds-truncate" title="$25k">$25k</div>
                    </td>
                    <td data-label="Contact">
                        <div class="slds-truncate" title="jrogers@cloudhub.com"><a href="javascript:void(0);">jrogers@cloudhub.com</a></div>
                    </td>
                </tr>
            </tbody>
        </table>
    
        <span class="slds-icon__container slds-icon-standard-account">
            <c:svg class="slds-icon" xlinkHref="/resource/SLDSWin17/assets/icons/standard-sprite/svg/symbols.svg#account" />
            <span class="slds-assistive-text">Account Icon</span>
        </span>
        <c:LightningComponent2 />
        <c:GridComponent1 />
        
        <c:ButtonComponent1 class="slds-button slds-button--neutral" 
             label="Details" 
             svgXlinkHref="/resource/SLDSWin17/assets/icons/standard-sprite/svg/symbols.svg#account" 
             svgClass="slds-icon slds-icon-text-default"
             onclick="{!c.showDetails}"/>
        <div class="slds-media">
  <div class="slds-media__figure">
    <img src="/assets/images/avatar3.jpg" class="slds-avatar--large" alt="Placeholder" />
  </div>
  <div class="slds-media__body">
    <p >Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat minus molestias reprehenderit consequuntur sapiente. Modi veritatis totam accusantium numquam assumenda.</p>
            </div>
            <div class="slds-p-top--small"></div>
            <div class="slds-size--1-of-2">
  <div class="slds-box slds-box--x-small slds-text-align--center slds-m-around--x-small">.slds-size--1-of-2</div>
</div>
<div class="slds-size--1-of-2">
  <div class="slds-box slds-box--x-small slds-text-align--center slds-m-around--x-small">.slds-size--1-of-2</div>
</div>
<div class="slds-size--2-of-2">
  <div class="slds-box slds-box--x-small slds-text-align--center slds-m-around--x-small">.slds-size--2-of-2</div>
</div>
</div>
    </div>
</aura:application>