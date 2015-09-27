Ext.define('Form.view.queryoutput.FBC.NS_2C5E8A1F92610514C6746E94C9F0D587.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2C5E8A1F92610514C6746E94C9F0D587',
	loadMask: true,
	multiSelect: true,
	title: 'Actual Skills',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2C5E8A1F92610514C6746E94C9F0D587.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Level of Adeptness',
		dataIndex: 'cin21actualskills-LEVELOFADEPTNESS',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'EA0A83B4B7345C90B9A99F7CDD5B3229'
	},{
		text: 'Skill',
		dataIndex: 'clkskill-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '25CA8E2A596A459F364ACD85E1EB5553'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2C5E8A1F92610514C6746E94C9F0D587.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});