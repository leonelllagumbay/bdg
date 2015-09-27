Ext.define('Form.view.queryoutput.FBC.NS_2DEB4B28CB7237C3F68289B40A6B42F6.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2DEB4B28CB7237C3F68289B40A6B42F6',
	loadMask: true,
	multiSelect: true,
	title: 'Awards',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2DEB4B28CB7237C3F68289B40A6B42F6.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Reward Code',
		dataIndex: 'cin21empawards-REWARDCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '8E39A58A66F5D3882AD207376E43586A'
	},{
		text: 'Measure Description',
		dataIndex: 'clkmeasures-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'E3ED7EF9C8CF7611B6B4837D5D23200A'
	},{
		text: 'Points',
		dataIndex: 'clkmeasures-POINTS',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'B3FC607F634DDFA962691DC8C3B7C31C'
	},{
		text: 'Date Awarded',
		dataIndex: 'cin21empawards-DATEAWARDED',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: 'D1370CAC20817B1CAD3A1FAA3900B1AA'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2DEB4B28CB7237C3F68289B40A6B42F6.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});