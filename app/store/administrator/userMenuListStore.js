Ext.define('Form.store.administrator.userMenuListStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.administrator.userMenuListModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
            property: 'DATELASTUPDATE',
            direction: 'DESC'
    }],
	filters: [{
			type: 'string',
            dataIndex: 'MENUNAME'  
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
			        read:    Ext.administrator.Administrator.ReadUserMenu
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