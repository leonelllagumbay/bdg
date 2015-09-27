Ext.define('Form.view.queryoutput.FBC.NS_48F3979CD9E40EA88A5608197A0CFC99.View', {
	extend: 'Ext.ux.chart.TitleChart',
	alias: 'widget.NS_48F3979CD9E40EA88A5608197A0CFC99',
	store: 'queryoutput.FBC.NS_48F3979CD9E40EA88A5608197A0CFC99.Store',
	width: 300,
	height: 300,
	padding: 10,
	title: 'Scatter plot sample',
	
	
	
	axes: [{type: 'Numeric',
		position: 'left',
		title: 'Range',
		fields: ['egintestchart-DATA1','egintestchart-DATA2','egintestchart-DATA3','egintestchart-DATA4','egintestchart-DATA5'],
		grid: true,
		minimum: 0,
		action: 'D2A04CFDC83B3E9B019B83A51037F189'
	},{type: 'Category',
		position: 'bottom',
		title: 'Letters',
		fields: ['egintestchart-NAMEB'],
		action: '5CAEAA320E2E9F8A5830A488D5C68FB5'
	}],
	series: [{type: 'scatter',
		axis: 'left',
		xField: 'egintestchart-NAMEB',
		yField: 'egintestchart-DATA1',
		markerConfig: {             radius: 5,             size: 5         },
		action: 'E7D222E2BD6E4C0841B4F03EBA7EEFD1'
	},{type: 'scatter',
		axis: 'left',
		xField: 'egintestchart-NAMEB',
		yField: 'egintestchart-DATA2',
		markerConfig: {             radius: 5,             size: 5         },
		action: '9AB04971D086DCC40C7631D8D6DD672C'
	},{type: 'scatter',
		axis: 'left',
		xField: 'egintestchart-NAMEB',
		yField: 'egintestchart-DATA3',
		markerConfig: {             radius: 5,             size: 5         },
		action: 'CB7A5F7EE3437D570FADC9D2848418EB'
	},{type: 'scatter',
		axis: 'left',
		xField: 'egintestchart-NAMEB',
		yField: 'egintestchart-DATA4',
		markerConfig: {             radius: 5,             size: 5         },
		action: '1A57CC43BF8AAD67F3B8C59407A86600'
	},{type: 'scatter',
		axis: 'left',
		xField: 'egintestchart-NAMEB',
		yField: 'egintestchart-DATA5',
		markerConfig: {             radius: 5,             size: 5         },
		action: 'CE64748FB5C45B95151658399302782D'
	}]
});