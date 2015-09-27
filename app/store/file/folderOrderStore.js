Ext.define('Form.store.file.folderOrderStore', {
	extend: 'Ext.data.Store',
	fields: ['propertycode','propertyname'],
	data: [{
		propertycode: 'FOLDERNAME',
		propertyname: 'Name'
	},{
		propertycode: 'FOLDERHINT',
		propertyname: 'Description'
	},{
		propertycode: 'DATELASTUPDATE',
		propertyname: 'Date last update'
	}]
});