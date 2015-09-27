Ext.define('Form.view.queryoutput.FBC.NS_81A4916208042E18C7C9BA871218F408.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_81A4916208042E18C7C9BA871218F408',
	loadMask: true,
	multiSelect: true,
	title: 'Data Editor - GLKEDUCLEVEL',
	width: 300,
	height: 300,

	store    : 'queryoutput.FBC.NS_81A4916208042E18C7C9BA871218F408.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Educ Level Code',
		dataIndex: 'glkeduclevel-EDUCLEVEL',
		filterable: true,
		sortable: true,
		width: 150,
		action: '8232C5BB7707C21958B674EBC9CE5AA1'
	},{
		text: 'Description',
		dataIndex: 'glkeduclevel-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 400,
		editor: 'textfield',
		action: '24AE2825B60EFB1BF98C837FD6D20CD2'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_81A4916208042E18C7C9BA871218F408.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});