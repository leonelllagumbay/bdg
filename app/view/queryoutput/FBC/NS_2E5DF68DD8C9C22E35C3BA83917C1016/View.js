Ext.define('Form.view.queryoutput.FBC.NS_2E5DF68DD8C9C22E35C3BA83917C1016.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2E5DF68DD8C9C22E35C3BA83917C1016',
	loadMask: true,
	multiSelect: true,
	title: 'Extra-curricular Activities',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2E5DF68DD8C9C22E35C3BA83917C1016.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Organization',
		dataIndex: 'cin21empextra-ORGANIZATION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'A789C174109C62BCD7B2796DA6E8C79D'
	},{
		text: 'Highest Position',
		dataIndex: 'cin21empextra-HIGHESTPOSITION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '510022A53F01C880F5948887E0E5A8E6'
	},{
		text: 'Period Covered',
		dataIndex: 'cin21empextra-PERIODCOVERED',
		filterable: true,
		sortable: true,
		width: 150,
		action: '099936570028DF96950123FF1DD780CD'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2E5DF68DD8C9C22E35C3BA83917C1016.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});