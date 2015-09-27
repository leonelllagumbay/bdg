Ext.define('Form.store.administrator.assignMenuUserStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.administrator.assignUserModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
            property: 'A_USERID',
            direction: 'ASC'
    }],
	filters: [{
			type: 'string',
            dataIndex: 'A_USERID'  
	}],
	pageSize: 50,
	autoLoad: false,
	autoSync: true,
	autoSave: true,
	constructor : function(config) {
		
    Ext.applyIf(config, {
        proxy: {
			type: 'direct',
			timeout: 300000,
			extraParams: {
				menucode: ''
			},
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'menucode'],
			api: {
		        read: Ext.administrator.Administrator.ReadMenuUser,
		        destroy: Ext.administrator.Administrator.RemoveMenuUser
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