Ext.define('Form.view.queryoutput.FBC.NS_80933CE1F1D1B408BB3C9333EF00349C.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_80933CE1F1D1B408BB3C9333EF00349C',
	loadMask: true,
	multiSelect: true,
	title: 'Data Editor - CLKLABORTYPE',
	width: 300,
	height: 300,

	store    : 'queryoutput.FBC.NS_80933CE1F1D1B408BB3C9333EF00349C.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Labor Type Code',
		dataIndex: 'clklabortype-LABORTYPECODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '37D4CC3121ACDCAB9923AA6111B24077'
	},{
		text: 'Description',
		dataIndex: 'clklabortype-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 400,
		editor: 'textfield',
		action: 'BBA452BC74B3444F240288ED1E11F6A2'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_80933CE1F1D1B408BB3C9333EF00349C.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});