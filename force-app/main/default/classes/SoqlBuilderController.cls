/**
 * @description       : 
 * @author            : Nicholas Glesmann
 * @group             : 
 * @last modified on  : 11-09-2020
 * @last modified by  : Nicholas Glesmann
 * Modifications Log 
 * Ver   Date         Author              Modification
 * 1.0   11-09-2020   Nicholas Glesmann   Initial Version
**/
public with sharing class SoqlBuilderController {

    @AuraEnabled(cacheable=true)
    public static List<SObject> getRecordsFromSObject(String sObjectName, String sObjectFields){
        try {
            
            System.debug(sObjectFields);

            if (sObjectFields == null || String.isEmpty(sObjectFields)) {
                sObjectFields = 'Id, Name';
            }

            return Database.query('SELECT ' + sObjectFields + ' FROM ' + sObjectName + ' LIMIT 10');

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
