Ext.define('Form.view.queryoutput.FBC.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_48C9ECD6A7DA0635AC7384C754FAD8CD',
	loadMask: true,
	multiSelect: true,
	title: 'Grouping Summary',
	width: 300,
	height: 300,
	padding: 10,

	store    : 'queryoutput.FBC.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	},{	ftype: 'groupingsummary',actionend: ''	}],
    plugins: [],
    columns: [{
		text: 'A Date Time',
		dataIndex: 'egintestquery-ADATETIME',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: 'F481224FADCD4EFEABA1206C81D18B1E'
	},{
		text: 'A Float',
		dataIndex: 'egintestquery-AFLOAT',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'numberfield',
		summaryType: 'count',
		xtype: 'numbercolumn',
		action: '3D09E301435D67FB3663DAA47C379AA2'
	},{
		text: 'A Number',
		dataIndex: 'egintestquery-ANUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn', format: '0',
		action: '64BBDD8EC8C8B51F5A50A2B6D8A1A0DC'
	},{
		text: 'A String',
		dataIndex: 'egintestquery-ASTRING',
		filterable: true,
		sortable: true,
		width: 150,
		action: '965B169379AD3F92A8EA9968B9E1EA53'
	},{
		text: 'A Text',
		dataIndex: 'egintestquery-ATEXT',
		filterable: true,
		sortable: true,
		width: 150,
		action: '9E9F6A894BDC6F7C05F498EF14E528B6'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});