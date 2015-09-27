Ext.define('Form.store.query.assignUserStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.query.assignUserModel',
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
		        read:    Ext.qd.OutputProcess.ReadQueryUser,
		        update:    Ext.qd.OutputProcess.UpdateQueryUser,
		        destroy: Ext.qd.OutputProcess.RemoveQueryUser
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