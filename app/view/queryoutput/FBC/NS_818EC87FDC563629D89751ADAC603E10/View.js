Ext.define('Form.view.queryoutput.FBC.NS_818EC87FDC563629D89751ADAC603E10.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_818EC87FDC563629D89751ADAC603E10',
	loadMask: true,
	multiSelect: true,
	title: 'Data Editor - GLKSCHOOL',
	width: 300,
	height: 300,

	store    : 'queryoutput.FBC.NS_818EC87FDC563629D89751ADAC603E10.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'School Code',
		dataIndex: 'glkschool-SCHOOLCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'BF2C27C6956FA8270F4F8650217EA238'
	},{
		text: 'School Name',
		dataIndex: 'glkschool-SCHOOLNAME',
		filterable: true,
		sortable: true,
		width: 400,
		editor: 'textfield',
		action: 'B6A79CCB0E8CB27B608F6F2B2316AF47'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_818EC87FDC563629D89751ADAC603E10.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});