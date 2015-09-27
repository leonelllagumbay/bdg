Ext.define('Form.view.queryoutput.FBC.NS_7640CD87E6104BF5DE19E74C6011E564.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7640CD87E6104BF5DE19E74C6011E564',
	loadMask: true,
	multiSelect: true,
	title: 'Possible actions',
	padding: 10,

	store    : 'queryoutput.FBC.NS_7640CD87E6104BF5DE19E74C6011E564.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Y',
		dataIndex: 'cbr201-CASUALMONTHS',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: false,
		action: '96F49CBD813A658E39C51EA494002164'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_7640CD87E6104BF5DE19E74C6011E564.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});