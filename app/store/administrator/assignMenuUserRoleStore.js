Ext.define('Form.store.administrator.assignMenuUserRoleStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.administrator.assignUserModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
            property: 'C_USERGRPID',
            direction: 'ASC'
    }],
	filters: [{
			type: 'string',
            dataIndex: 'C_USERGRPID'  
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
				menucode: ''
			},
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'menucode'],
			api: {
		        read:    Ext.administrator.Administrator.ReadMenuUserRole,
		        destroy: Ext.administrator.Administrator.RemoveMenuUserRole
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