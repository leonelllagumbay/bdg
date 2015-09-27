Ext.define('Form.store.liveboard.liveboarditemStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.liveboard.liveboarditemModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
            property: 'ITEMORDER',
            direction: 'ASC'
    }],
	filters: [{
			type: 'string',
            dataIndex: 'XTYPETITLE'  
	}],
	pageSize: 50,
	autoLoad: false,
	
	constructor : function(config) {
		
	    Ext.applyIf(config, {
	        proxy: {
				type: 'direct',
				extraParams: {
					liveboardcode: ''
				},
				timeout: 300000,
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter','liveboardcode'],
				api: {
			        read:    Ext.liveboard.Liveboard.ReadLiveBoardItem
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