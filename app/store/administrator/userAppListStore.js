Ext.define('Form.store.administrator.userAppListStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.administrator.userAppListModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
        property: 'DATELASTUPDATE',
        direction: 'DESC'
    }],
    filters: [{
		type: 'string',
        dataIndex: 'NAMEORTITLE'
	}],
	pageSize: 35,
	autoLoad: true,
	constructor : function(config) {
		
	    Ext.applyIf(config, {
	        proxy: {
				type: 'direct',
				timeout: 300000,
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter'],
				api: {
			        read: Ext.administrator.Administrator.ReadUserApp
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