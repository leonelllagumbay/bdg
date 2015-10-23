Ext.define('Form.view.queryoutput.FBC.NS_48ABB0BFFB9D56789988D6F49F6E3E35.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_48ABB0BFFB9D56789988D6F49F6E3E35',
	loadMask: true,
	multiSelect: true,
	title: 'Open Weather',
	width: 300,
	height: 300,
	padding: 10,

	store    : 'queryoutput.FBC.NS_48ABB0BFFB9D56789988D6F49F6E3E35.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowexpander',	expandOnDblClick: true,
			rowBodyTpl : [
	'<p><b>Day:</b>  {egintestquery-ATEXT}</h1></p>',
    '<p><b>Pressure:</b>  {egintestquery-AFLOAT}</p></br>',
    '<p><b>Humidity:</b>  {egintestquery-ANUMBER}</p>'],actionend: ''	}],
    columns: [{
		text: 'dt',
		dataIndex: 'egintestquery-ASTRING',
		filterable: true,
		sortable: true,
		width: 120,
		renderer: function(value) { 	var d = new Date(value*1000); 	var newd = d.toDateString();     return newd; },
		action: '965B169379AD3F92A8EA9968B9E1EA53'
	},{
		text: 'Max Temperature (F)',
		dataIndex: 'egintestquery-ATEXT',
		filterable: true,
		sortable: true,
		width: 130,
		action: '9E9F6A894BDC6F7C05F498EF14E528B6'
	},{
		text: 'Pressure',
		dataIndex: 'egintestquery-AFLOAT',
		filterable: true,
		sortable: true,
		width: 90,
		renderer: function(value) { 	return value + ' hpa'; },
		xtype: 'numbercolumn',
		action: '3D09E301435D67FB3663DAA47C379AA2'
	},{
		text: 'Humidity',
		dataIndex: 'egintestquery-ANUMBER',
		filterable: true,
		sortable: true,
		width: 90,
		renderer: function(value) { 	return value + ' %'; },
		xtype: 'numbercolumn', format: '0',
		action: '64BBDD8EC8C8B51F5A50A2B6D8A1A0DC'
	},{
		text: 'Weather',
		dataIndex: 'egintestquery-ATIME',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'E76F8694658169D2FDC83C2BD2A23FC6'
	},{
		text: 'Degree',
		dataIndex: 'egintestquery-ADATETIME',
		filterable: true,
		sortable: true,
		width: 90,
		xtype: 'numbercolumn',
		action: 'F481224FADCD4EFEABA1206C81D18B1E'
	},{
		text: 'Speed',
		dataIndex: 'egintestquery-TESTID',
		filterable: true,
		sortable: true,
		width: 90,
		renderer: function(value) { 	return value + ' m/s'; },
		xtype: 'numbercolumn', format: '0',
		action: '13AC00A0549FE4AA254485FF98A5C10F'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_48ABB0BFFB9D56789988D6F49F6E3E35.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});