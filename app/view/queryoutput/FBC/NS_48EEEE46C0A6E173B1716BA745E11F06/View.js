Ext.define('Form.view.queryoutput.FBC.NS_48EEEE46C0A6E173B1716BA745E11F06.View', {
	extend: 'Ext.ux.chart.TitleChart',
	alias: 'widget.NS_48EEEE46C0A6E173B1716BA745E11F06',
	store: 'queryoutput.FBC.NS_48EEEE46C0A6E173B1716BA745E11F06.Store',
	width: 300,
	height: 300,
	padding: 10,
	title: 'Radar sample',
	
	
	legend: {position: 'right',
		visible: true,
		action: 'legend'},
	axes: [{type: 'Radial',
		position: 'radial',
		label: {             display: true         },
		majorTickSteps: 5,
		maximum: 50,
		minimum: 0,
		action: '133F04B15FCDB1C410EA5ED10452B30D'
	}],
	series: [{type: 'radar',
		showInLegend: true,
		xField: 'egintestchart-NAMEF',
		yField: 'egintestchart-DATA3',
		style: {             'stroke-width': 2,             fill: 'none'         },
		markerConfig: {             radius: 5,             size: 5         },
		showMarkers: true,
		action: '82F73E01BCC29CFB506554FD410E00BB'
	},{type: 'radar',
		showInLegend: true,
		xField: 'egintestchart-NAMEF',
		yField: 'egintestchart-DATA4',
		style: {             'stroke-width': 2,             fill: 'none'         },
		markerConfig: {             radius: 5,             size: 5         },
		showMarkers: true,
		action: '24C33AFB8072A666EB44A28102FF4056'
	},{type: 'radar',
		showInLegend: true,
		xField: 'egintestchart-NAMEF',
		yField: 'egintestchart-DATA5',
		style: {             'stroke-width': 2,             fill: 'none'         },
		markerConfig: {             radius: 5,             size: 5         },
		showMarkers: true,
		action: 'F88D6783973062152E06603C36676296'
	}]
});