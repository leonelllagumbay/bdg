Ext.define('Form.view.queryoutput.FBC.NS_8042B445DA9830A56B12EF3924EFF604.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_8042B445DA9830A56B12EF3924EFF604',
	loadMask: true,
	multiSelect: true,
	title: 'Data Editor - CLKJOBCLASSCODE',
	width: 300,
	height: 300,

	store    : 'queryoutput.FBC.NS_8042B445DA9830A56B12EF3924EFF604.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Job Class Code',
		dataIndex: 'clkjobclasscode-JOBCLASSCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'FC3D6C451668022061BF88DCD068635E'
	},{
		text: 'Description',
		dataIndex: 'clkjobclasscode-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 400,
		editor: 'textfield',
		action: 'C8BB61E978722D9B916CF0A194E8ED15'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_8042B445DA9830A56B12EF3924EFF604.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});