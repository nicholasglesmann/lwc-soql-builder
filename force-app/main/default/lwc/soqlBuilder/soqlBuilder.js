import { LightningElement, wire, api } from 'lwc';
import getRecordsFromSObject from '@salesforce/apex/SoqlBuilderController.getRecordsFromSObject';

const defaultColumns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' }
];

export default class BasicDataTable extends LightningElement {

    @api
    sObjectName;

    @api
    sObjectFields;

    data = [];
    columns = defaultColumns;

    buildColumns() {

        console.log('Building Columns...');
        console.log(this.sObjectFields);

        if (!this.sObjectFields) { return defaultColumns; }

        let objectColumns = [];

        let sObjectFieldsArr = this.sObjectFields.split(',');

        for (let sObjectField in sObjectFieldsArr) {

            let objectFieldDefinition = {
                label: sObjectFieldsArr[sObjectField],
                fieldName: sObjectFieldsArr[sObjectField]
            };

            objectColumns.push(objectFieldDefinition);
        }

        console.log(objectColumns);

        return objectColumns;
    }

    @wire(getRecordsFromSObject, { sObjectName: '$sObjectName', sObjectFields: '$sObjectFields' })
        wiredRecordsMethod({ error, data }) {
            if (data) {
                this.data = data;
                this.columns = this.buildColumns();
                this.error = undefined;
            } else if (error) {
                this.error = error;
                this.data = undefined;
            }
        }


}
