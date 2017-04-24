public with sharing class jTableAccountsController {

    @RemoteAction
    public static Map<String, Object> retrieveAccts(String type, List<String> fields, Map<String, Object> criteria) {
        
        // Retrieve using the standard retrieve
        Map<String, Object> result = RemoteObjectController.retrieve(type, fields, criteria);
        
        // Add in the total record count for the current user. Needed for pagination
        Integer numOwnedAccts = [
            SELECT Count() 
            FROM Account 
            WHERE OwnerId =: UserInfo.getUserId()
        ];
        
        // Create a new map since the result map is read-only
        Map<String, Object> customResult = 
            new Map<String, Object> {'TotalRecordCount'=> numOwnedAccts};
        customResult.putAll(result);
        
        return customResult;
    }
}