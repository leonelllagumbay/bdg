Ext.define('Form.view.queryoutput.FBC.NS_81BD6282D2719B46D04E84B10725A3DF.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_81BD6282D2719B46D04E84B10725A3DF',
	loadMask: true,
	multiSelect: true,
	title: 'Data Editor - GLKDEGREE',
	width: 300,
	height: 300,

	store    : 'queryoutput.FBC.NS_81BD6282D2719B46D04E84B10725A3DF.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Degree Code',
		dataIndex: 'glkdegree-DEGREECODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'C3474ACAAB2BDF7526D1550522B1EBBE'
	},{
		text: 'Description',
		dataIndex: 'glkdegree-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 400,
		editor: 'textfield',
		action: '02C4F84838E0757467494C700AC1C6C2'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_81BD6282D2719B46D04E84B10725A3DF.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});