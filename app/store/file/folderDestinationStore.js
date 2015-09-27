Ext.define('Form.store.file.folderDestinationStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.file.folderDestinationModel',
	autoLoad: false,
	proxy: {
			type: 'direct',
			directFn: 'Ext.file.File.getFolderDestination',
			reader: {
	            root: 'topics',
	            totalProperty: 'totalCount'
	        }
		}
});
