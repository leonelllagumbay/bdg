Ext.define('Form.store.administrator.assignUserRoleMemberStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.administrator.assignUserModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
            property: 'A_USERGRPMEMBERSIDX',
            direction: 'ASC'
    }],
	filters: [{
			type: 'string',
            dataIndex: 'A_USERGRPMEMBERSIDX'  
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
				rolecode: ''
			},
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'rolecode'],
			api: {
		        read: Ext.administrator.Administrator.ReadRoleMember,
		        destroy: Ext.administrator.Administrator.RemoveRoleMember
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