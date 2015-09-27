Ext.define('Form.store.query.assignUserRoleStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.query.assignUserModel',
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
				querycode: ''
			},
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode'],
			api: {
		        read:    Ext.qd.OutputProcess.ReadQueryUserRole,
		        update:    Ext.qd.OutputProcess.UpdateQueryUserRole,
		        destroy: Ext.qd.OutputProcess.RemoveQueryUserRole
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