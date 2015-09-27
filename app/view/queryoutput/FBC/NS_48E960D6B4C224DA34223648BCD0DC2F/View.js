Ext.define('Form.view.queryoutput.FBC.NS_48E960D6B4C224DA34223648BCD0DC2F.View', {
	extend: 'Ext.ux.chart.TitleChart',
	alias: 'widget.NS_48E960D6B4C224DA34223648BCD0DC2F',
	store: 'queryoutput.FBC.NS_48E960D6B4C224DA34223648BCD0DC2F.Store',
	width: 300,
	height: 300,
	padding: 10,
	title: 'Line Sample',
	
	
	legend: {boxFill: '#CCC',
		position: 'top',
		visible: true,
		action: 'legend'},
	axes: [{type: 'Numeric',
		position: 'left',
		title: 'Sample Values',
		fields: ['egintestchart-DATA1','egintestchart-DATA2'],
		grid: true,
		label: {                 renderer: Ext.util.Format.numberRenderer('0,0')             },
		minimum: 0,
		action: '1F46E2022226EF3CCFDC98B3DC0B3EB0'
	},{type: 'Category',
		position: 'bottom',
		title: 'Places',
		fields: ['egintestchart-NAMEH'],
		action: '3102B843407EFE7B95C1B45B90BE340D'
	}],
	series: [{type: 'line',
		highlight: {                 size: 7,                 radius: 7             },
		axis: 'left',
		xField: 'egintestchart-NAMEH',
		yField: 'egintestchart-DATA1',
		markerConfig: {    type: 'cross', size: 4, radius: 4, 'stroke-width': 0  },
		action: 'BCC86B561C7124BA1C31FD5F054377C0'
	},{type: 'line',
		highlight: {                 size: 7,                 radius: 7             },
		axis: 'left',
		xField: 'egintestchart-NAMEH',
		yField: 'egintestchart-DATA2',
		markerConfig: {    type: 'cross', size: 4, radius: 4, 'stroke-width': 0  },
		action: 'AC798668F2A3EA2FCF365C2D4FCC1C7B'
	}]
});