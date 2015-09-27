Ext.define('Form.view.queryoutput.FBC.NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD.View', {
	extend: 'Ext.ux.chart.TitleChart',
	alias: 'widget.NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD',
	store: 'queryoutput.FBC.NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD.Store',
	width: 600,
	height: 600,
	padding: 10,
	title: 'Chart Sample',
	
	
	legend: {visible: true,
		action: 'legend'},
	axes: [],
	series: [{type: 'pie',
		highlight: {             segment: {                 margin: 20             }         },
		label: {             field: 'egintestchart-NAMEG',             display: 'rotate',             contrast: true,             font: '18px Arial'         },
		showInLegend: true,
		tips: {             trackMouse: true,             width: 140,             height: 28,             renderer: function(storeItem, item) {                 var total = 80;                 this.setTitle(storeItem.get('egintestchart-NAMEG') + ': ' + Math.round(storeItem.get('egintestchart-DATA1') / total * 100) + '%');             }         },
		angleField: 'egintestchart-DATA1',
		action: '78F499EA32E7577A6A4CC57CC464FCD2'
	}]
});