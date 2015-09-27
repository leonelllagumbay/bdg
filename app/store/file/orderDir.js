Ext.define('Form.store.file.orderDir', {
	extend: 'Ext.data.Store',
	fields: ['propertycode','propertyname'],
	data: [{
		propertycode: 'DESC',
		propertyname: 'DESC'
	},{
		propertycode: 'ASC',
		propertyname: 'ASC'
	}]
});