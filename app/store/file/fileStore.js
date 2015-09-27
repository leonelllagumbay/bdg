Ext.define('Form.store.file.fileStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.file.fileModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
            property: 'DATELASTUPDATE',
            direction: 'DESC'
    }],
	filters: [{
			type: 'string',
            dataIndex: 'FILENAME'  
	}],
	pageSize: 35,
	autoLoad: true,
	autoSync: true,
	autoSave: true,
	constructor : function(config) {
		
    Ext.applyIf(config, {
        proxy: {
			type: 'direct',
			timeout: 300000,
			extraParams: {
				folderid: ''
			},
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'folderid'],
			api: {
		        read:    Ext.file.FileDefinition.Read,
		        update:  Ext.file.FileDefinition.Update,
		        destroy: Ext.file.FileDefinition.Destroy
		    },
			paramsAsHash: false,
			filterParam: 'filter',
			sortParam: 'sort',
			limitParam: 'limit',
			idParam: 'ID',
			pageParam: 'page',
			reader: {
	            root: 'topics',
	            totalProperty: 'totalCount'
	        }
		}
    });

    this.callParent([config]);
}
	
	
});