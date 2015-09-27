Ext.define('Form.store.liveboard.liveboardlistStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.liveboard.liveboardlistModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
            property: 'RECDATECREATED',
            direction: 'DESC'
    }],
	filters: [{
			type: 'string',
            dataIndex: 'LBTITLE'  
	}],
	pageSize: 50,
	autoLoad: true,
	
	constructor : function(config) {
		
    Ext.applyIf(config, {
        proxy: {
			type: 'direct',
			timeout: 300000,
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter'],
			api: {
		        read:    Ext.liveboard.Liveboard.ReadNow
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