Ext.define('Form.store.administrator.assignUserRoleStore', {
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
				appcode: ''
			},
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'appcode'],
			api: {
		        read:    Ext.administrator.Administrator.ReadAppUserRole,
		        destroy: Ext.administrator.Administrator.RemoveAppUserRole
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