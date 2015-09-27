Ext.define('Form.view.queryoutput.FBC.NS_48E36ADAD99F6BDD5FA11E51143C7634.View', {
	extend: 'Ext.ux.chart.TitleChart',
	alias: 'widget.NS_48E36ADAD99F6BDD5FA11E51143C7634',
	store: 'queryoutput.FBC.NS_48E36ADAD99F6BDD5FA11E51143C7634.Store',
	width: 300,
	height: 300,
	padding: 10,
	title: 'Area Sample',
	
	
	
	axes: [{type: 'Numeric',
		position: 'left',
		title: 'Sample Values',
		fields: ['egintestchart-DATA1','egintestchart-DATA2','egintestchart-DATA3','egintestchart-DATA4','egintestchart-DATA5'],
		grid: {                 odd: {                     opacity: 1,                     fill: '#ddd',                     stroke: '#bbb',                     'stroke-width': 1                 }             },
		minimum: 0,
		adjustMinimumByMajorUnit: 0,
		action: '81C9CBE9C684F716EE28F5EB5AE7080E'
	},{type: 'Category',
		position: 'bottom',
		title: 'Fruits',
		fields: ['egintestchart-NAMEA'],
		grid: true,
		label: {                 rotate: {                     degrees: 315                 }             },
		action: 'A8850A479C0D3CE397059B3FB5D24053'
	},{type: 'Numeric',
		position: 'right',
		title: 'Sample Values Right',
		fields: ['egintestchart-DATA1','egintestchart-DATA2','egintestchart-DATA3','egintestchart-DATA4','egintestchart-DATA5'],
		grid: {                 odd: {                     opacity: 1,                     fill: '#ddd',                     stroke: '#bbb',                     'stroke-width': 1                 }             },
		minimum: 0,
		adjustMinimumByMajorUnit: 0,
		action: '1F6A715DDF384F46732B45D03D5F8016'
	},{type: 'Category',
		position: 'top',
		title: 'Fruits Top',
		fields: ['egintestchart-NAMEA'],
		grid: true,
		label: {                 rotate: {                     degrees: 315                 }             },
		action: '93EF46949B1698D9143791F91960F00B'
	}],
	series: [{type: 'area',
		highlight: false,
		axis: 'left',
		xField: 'egintestchart-NAMEA',
		yField: ['egintestchart-DATA1','egintestchart-DATA2','egintestchart-DATA3','egintestchart-DATA4','egintestchart-DATA5'],
		style: {opacity: 0.93},
		action: '2305D28C4A7306F836DE421F83F76CE2'
	}]
});