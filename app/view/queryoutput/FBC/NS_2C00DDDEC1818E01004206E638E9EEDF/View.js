Ext.define('Form.view.queryoutput.FBC.NS_2C00DDDEC1818E01004206E638E9EEDF.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2C00DDDEC1818E01004206E638E9EEDF',
	loadMask: true,
	multiSelect: true,
	title: 'Achievements',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2C00DDDEC1818E01004206E638E9EEDF.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Award Title',
		dataIndex: 'cin21achievements-AWARDTITLE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'A1A4DA10587EBA1156CE674B138069DC'
	},{
		text: 'Nature or Category',
		dataIndex: 'cin21achievements-NATURECATEGORY',
		filterable: true,
		sortable: true,
		width: 150,
		action: '850AF195CB0B501378F4622048484C9E'
	},{
		text: 'Date Given',
		dataIndex: 'cin21achievements-DATEGIVEN',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'CEDC1A9FC8B4FD01B6B46429319FD607'
	},{
		text: 'Given By',
		dataIndex: 'cin21achievements-GIVENBY',
		filterable: true,
		sortable: true,
		width: 150,
		action: '48E23CF3B2FF0A183DC534FBD6EF7E88'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2C00DDDEC1818E01004206E638E9EEDF.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});