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
global class SoqlBuilderPicklist extends VisualEditor.DynamicPickList {
    
    global SoqlBuilderPicklist() {}

    global override VisualEditor.DataRow getDefaultValue()
    {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        Map<String,Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();
        
        Set<String> objectNamesSet = (Set<String>) globalDescription.keySet();
            
        List<String> objectNames = new List<String>();
        objectNames.addAll(objectNamesSet);
        objectNames.sort();

        String defaultObjectName = objectNames[0];
        return new VisualEditor.DataRow(defaultObjectName, defaultObjectName);
    }

    global override VisualEditor.DynamicPickListRows getValues()
    {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        Map<String,Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();

        Set<String> objectNamesSet = (Set<String>) globalDescription.keySet();
            
        List<String> objectNames = new List<String>();
        objectNames.addAll(objectNamesSet);
        objectNames.sort();

        VisualEditor.DynamicPickListRows objectValues = new VisualEditor.DynamicPickListRows();

        for (String objectName : objectNames)
        {
            VisualEditor.DataRow objectValue = new VisualEditor.DataRow(objectName, objectName);
            objectValues.addRow(objectValue);
        }

        return objectValues;
    }
}
