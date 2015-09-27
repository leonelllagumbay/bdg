Ext.define('Form.view.queryoutput.FBC.NS_8115E511910BCCE0ABB8BA275E904214.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_8115E511910BCCE0ABB8BA275E904214',
	loadMask: true,
	multiSelect: true,
	title: 'Data Editor - CLKMEASURES',
	width: 300,
	height: 300,

	store    : 'queryoutput.FBC.NS_8115E511910BCCE0ABB8BA275E904214.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Measure Code',
		dataIndex: 'clkmeasures-MEASURESCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '407CFB53D349C057E5808363AED050E3'
	},{
		text: 'Description',
		dataIndex: 'clkmeasures-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 300,
		editor: 'textfield',
		action: 'E3ED7EF9C8CF7611B6B4837D5D23200A'
	},{
		text: 'Points',
		dataIndex: 'clkmeasures-POINTS',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: 'B3FC607F634DDFA962691DC8C3B7C31C'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_8115E511910BCCE0ABB8BA275E904214.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});