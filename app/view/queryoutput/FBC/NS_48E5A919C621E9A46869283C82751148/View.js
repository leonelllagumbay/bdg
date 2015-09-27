Ext.define('Form.view.queryoutput.FBC.NS_48E5A919C621E9A46869283C82751148.View', {
	extend: 'Ext.ux.chart.TitleChart',
	alias: 'widget.NS_48E5A919C621E9A46869283C82751148',
	store: 'queryoutput.FBC.NS_48E5A919C621E9A46869283C82751148.Store',
	width: 300,
	height: 300,
	padding: 10,
	title: 'Bar Sample',
	
	
	
	axes: [{type: 'Numeric',
		position: 'bottom',
		title: 'Sample Values',
		fields: ['egintestchart-DATA1'],
		grid: true,
		label: {             renderer: Ext.util.Format.numberRenderer('0,0')         },
		minimum: 0,
		action: '861CDFA6529BCD030799A9B5DE15C755'
	},{type: 'Category',
		position: 'left',
		title: 'Sample Names',
		fields: ['egintestchart-NAMEC'],
		action: '0629C74CDCEF47D1691F79F7F454F79D'
	}],
	series: [{type: 'bar',
		highlight: true,
		label: {           display: 'insideEnd',             field: 'data',             renderer: Ext.util.Format.numberRenderer('0'),             orientation: 'horizontal',             color: '#333',             'text-anchor': 'middle'         },
		tips: {           trackMouse: true,           width: 140,           height: 28,           renderer: function(storeItem, item) {             this.setTitle(storeItem.get('egintestchart-NAMEC') + ': ' + storeItem.get('egintestchart-DATA1') + ' views');           }         },
		axis: 'bottom',
		xField: 'egintestchart-NAMEC',
		yField: 'egintestchart-DATA1',
		action: '32C70E254CCBFAAAC45F81C84C0B4F8E'
	}]
});