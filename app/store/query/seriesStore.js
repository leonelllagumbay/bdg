Ext.define('Form.store.query.seriesStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.query.seriesModel',
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
		        read:    Ext.qd.Chart.ReadChartSeries
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