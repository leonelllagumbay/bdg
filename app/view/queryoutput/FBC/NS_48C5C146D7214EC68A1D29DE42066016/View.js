Ext.define('Form.view.queryoutput.FBC.NS_48C5C146D7214EC68A1D29DE42066016.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_48C5C146D7214EC68A1D29DE42066016',
	multiSelect: true,
	title: 'Grouping',
	width: 300,
	height: 300,
	padding: 10,

	store    : 'queryoutput.FBC.NS_48C5C146D7214EC68A1D29DE42066016.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	},{	ftype: 'grouping',	hideGroupedHeader: true,
			actionend: ''	}],
    plugins: [{	ptype: 'cellediting',actionend: ''	}],
    columns: [{
		text: 'A String',
		dataIndex: 'egintestquery-ASTRING',
		filterable: true,
		sortable: true,
		width: 150,
		action: '965B169379AD3F92A8EA9968B9E1EA53'
	},{
		text: 'egintestqueryTESTID',
		dataIndex: 'egintestquery-TESTID',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn', format: '0',
		action: '13AC00A0549FE4AA254485FF98A5C10F'
	},{
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
		text: 'A Text',
		dataIndex: 'egintestquery-ATEXT',
		filterable: true,
		sortable: true,
		width: 150,
		action: '9E9F6A894BDC6F7C05F498EF14E528B6'
	},{
		text: 'A Time',
		dataIndex: 'egintestquery-ATIME',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'E76F8694658169D2FDC83C2BD2A23FC6'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_48C5C146D7214EC68A1D29DE42066016.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});