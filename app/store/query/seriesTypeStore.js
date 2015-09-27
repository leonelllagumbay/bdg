Ext.define('Form.store.query.seriesTypeStore', {
	extend: 'Ext.data.Store',
	fields: ['seriestypecode','seriestypename'],
	data: [{
		seriestypecode: 'area',
		seriestypename: 'Area'
	},{
		seriestypecode: 'bar',
		seriestypename: 'Bar'
	},{
		seriestypecode: 'column',
		seriestypename: 'Column'
	},{
		seriestypecode: 'gauge',
		seriestypename: 'Gauge'
	},{
		seriestypecode: 'line',
		seriestypename: 'Line'
	},{
		seriestypecode: 'pie',
		seriestypename: 'Pie'
	},{
		seriestypecode: 'radar',
		seriestypename: 'Radar'
	},{
		seriestypecode: 'scatter',
		seriestypename: 'Scatter'
	}]	
});
