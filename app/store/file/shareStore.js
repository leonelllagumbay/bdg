Ext.define('Form.store.file.shareStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.file.shareModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
            property: 'B_DATESHARED',
            direction: 'DESC'
    }],
	filters: [{
			type: 'string',
            dataIndex: 'A_FILENAME'  
	}],
	pageSize: 35,
	autoLoad: false,
	autoSync: true,
	autoSave: true,
	constructor : function(config) {
		
    Ext.applyIf(config, {
        proxy: {
			type: 'direct',
			timeout: 300000,
			extraParams: {
				fileid: ''
			},
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'fileid'],
			api: {
		        read:    Ext.file.FileDefinition.ReadMySharedTo,
		        destroy: Ext.file.FileDefinition.DestroyMySharedTo
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