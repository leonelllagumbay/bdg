Ext.define('Form.store.administrator.companyListStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.administrator.companyListModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
            property: 'C-COMPANYORDER',
            direction: 'ASC'
    }],
	filters: [{
			type: 'string',
            dataIndex: 'A-COMPANYCODE'  
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
			        read:    Ext.administrator.Company.ReadMe
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