Ext.define('Form.view.queryoutput.FBC.NS_7F8FB262C5554926072B082C2C3F1658.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7F8FB262C5554926072B082C2C3F1658',
	loadMask: true,
	multiSelect: true,
	title: 'Data Editor - CLKJOBGRADE',
	width: 300,
	height: 300,

	store    : 'queryoutput.FBC.NS_7F8FB262C5554926072B082C2C3F1658.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Job Grade Code',
		dataIndex: 'clkjobgrade-JOBGRADECODE',
		filterable: true,
		sortable: true,
		width: 200,
		action: '67758341A6968E5F9A24C99C1CF27664'
	},{
		text: 'Description',
		dataIndex: 'clkjobgrade-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 400,
		editor: 'textfield',
		action: '216AA6488E711828701A1471AB194A0E'
	},{
		text: 'Abbreviation',
		dataIndex: 'clkjobgrade-JOBABBREVIATION',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: '0BA88902099196A2890F102181018E8A'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_7F8FB262C5554926072B082C2C3F1658.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});