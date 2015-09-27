Ext.define('Form.view.queryoutput.FBC.NS_48CC09B3FAFB581153784CDEFB17F719.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_48CC09B3FAFB581153784CDEFB17F719',
	loadMask: true,
	multiSelect: true,
	title: 'Summary and Grouping Summary',
	width: 300,
	height: 300,
	padding: 10,

	store    : 'queryoutput.FBC.NS_48CC09B3FAFB581153784CDEFB17F719.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	},{	ftype: 'summary',actionend: ''	},{	ftype: 'groupingsummary',	collapsible: true,
				startCollapsed: true,
			actionend: ''	}],
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
		xtype: 'numbercolumn',
		action: '3D09E301435D67FB3663DAA47C379AA2'
	},{
		text: 'A Number',
		dataIndex: 'egintestquery-ANUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		summaryType: 'min',
		xtype: 'numbercolumn', format: '0',
		action: '64BBDD8EC8C8B51F5A50A2B6D8A1A0DC'
	},{
		text: 'A String',
		dataIndex: 'egintestquery-ASTRING',
		filterable: true,
		sortable: true,
		width: 150,
		summaryType: 'count',
		action: '965B169379AD3F92A8EA9968B9E1EA53'
	},{
		text: 'A Text',
		dataIndex: 'egintestquery-ATEXT',
		filterable: true,
		sortable: true,
		width: 150,
		summaryType: 'count',
		action: '9E9F6A894BDC6F7C05F498EF14E528B6'
	},{
		text: 'A Time',
		dataIndex: 'egintestquery-ATIME',
		filterable: true,
		sortable: true,
		width: 150,
		summaryType: 'count',
		action: 'E76F8694658169D2FDC83C2BD2A23FC6'
	},{
		text: 'egintestqueryTESTID',
		dataIndex: 'egintestquery-TESTID',
		filterable: true,
		sortable: true,
		width: 150,
		summaryType: 'max',
		xtype: 'numbercolumn', format: '0',
		action: '13AC00A0549FE4AA254485FF98A5C10F'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_48CC09B3FAFB581153784CDEFB17F719.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});