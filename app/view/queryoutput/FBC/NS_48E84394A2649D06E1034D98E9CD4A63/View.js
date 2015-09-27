Ext.define('Form.view.queryoutput.FBC.NS_48E84394A2649D06E1034D98E9CD4A63.View', {
	extend: 'Ext.ux.chart.TitleChart',
	alias: 'widget.NS_48E84394A2649D06E1034D98E9CD4A63',
	store: 'queryoutput.FBC.NS_48E84394A2649D06E1034D98E9CD4A63.Store',
	width: 300,
	height: 300,
	margin: 10,
	padding: 10,
	title: 'Gauge Sample',
	
	
	
	axes: [{type: 'gauge',
		position: 'gauge',
		maximum: 100,
		minimum: 0,
		steps: 10,
		action: '5A364335D3811C688732868086A59998'
	}],
	series: [{type: 'gauge',
		donut: 30,
		field: 'egintestchart-DATA6',
		colorSet: ['#F49D10', '#ddd'],
		action: '387F1976A1DBAD201C15884604604042'
	}]
});