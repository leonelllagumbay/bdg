Ext.define('Form.view.queryoutput.FBC.NS_48E70F48CE38988FAE729C963CBDA61C.View', {
	extend: 'Ext.ux.chart.TitleChart',
	alias: 'widget.NS_48E70F48CE38988FAE729C963CBDA61C',
	store: 'queryoutput.FBC.NS_48E70F48CE38988FAE729C963CBDA61C.Store',
	width: 300,
	height: 300,
	padding: 10,
	title: 'Column Sample',
	
	
	
	axes: [{type: 'Numeric',
		position: 'left',
		title: 'Values',
		fields: ['egintestchart-DATA1'],
		grid: true,
		label: {                 renderer: Ext.util.Format.numberRenderer('0,0')             },
		minimum: 0,
		action: 'E131ADA1C60315DD6F3C4AA818804854'
	},{type: 'Category',
		position: 'bottom',
		title: 'Animals',
		fields: ['egintestchart-NAMEE'],
		action: '8D749347B6970172DA73B12BA0A4C178'
	}],
	series: [{type: 'column',
		highlight: true,
		label: {               display: 'insideEnd',               'text-anchor': 'middle',                 field: 'data',                 renderer: Ext.util.Format.numberRenderer('0'),                 orientation: 'vertical',                 color: '#883'             },
		tips: {               trackMouse: true,               width: 140,               height: 28,               renderer: function(storeItem, item) {                 this.setTitle(storeItem.get('egintestchart-NAMEE') + ': ' + storeItem.get('egintestchart-DATA1') + ' $');               }             },
		axis: 'left',
		xField: 'egintestchart-NAMEE',
		yField: 'egintestchart-DATA1',
		action: '4E04C49E273B9801E17A7F6131E22121'
	}]
});