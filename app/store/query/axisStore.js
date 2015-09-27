Ext.define('Form.store.query.axisStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.query.axisModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	sorters: [{
            property: 'LABEL',
            direction: 'ASC'
    }],
	filters: [{
			type: 'string',
            dataIndex: 'EQRYCODEFK'  
	}],
	pageSize: 10,
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
		        read:    Ext.qd.Chart.ReadChartAxis
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