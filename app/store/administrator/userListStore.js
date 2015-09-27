Ext.define('Form.store.administrator.userListStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.administrator.userListModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
        property: 'A-DATELASTUPDATE',
        direction: 'DESC'
    }],
	filters: [{
		type: 'string',
        dataIndex: 'B-LASTNAME'  
	}],
	pageSize: 100,
	autoLoad: true,
	constructor : function(config) {
		
	    Ext.applyIf(config, {
	        proxy: {
				type: 'direct',
				timeout: 300000,
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter'],
				api: {
			        read: Ext.administrator.User.ReadMe
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