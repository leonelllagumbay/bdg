Ext.define('Form.view.queryoutput.FBC.NS_816C04EBC2049A9341D34F40AC344F53.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_816C04EBC2049A9341D34F40AC344F53',
	loadMask: true,
	multiSelect: true,
	title: 'Data Editor - GLKCOURSE',
	width: 300,
	height: 300,

	store    : 'queryoutput.FBC.NS_816C04EBC2049A9341D34F40AC344F53.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Course Code',
		dataIndex: 'glkcourse-COURSECODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'F37F95CCA3AC0A9AA30849CCB27C450C'
	},{
		text: 'Description',
		dataIndex: 'glkcourse-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 400,
		editor: 'textfield',
		action: '0693B66385BE2679F17BC040BCD581E8'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_816C04EBC2049A9341D34F40AC344F53.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});