Ext.define('Form.view.queryoutput.FBC.NS_51C021FCD2BE8380E4E874578E885A28.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_51C021FCD2BE8380E4E874578E885A28',
	loadMask: true,
	multiSelect: true,
	title: 'Special Skills',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_51C021FCD2BE8380E4E874578E885A28.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Special Talents',
		dataIndex: 'cin21miscinfo1-SPECIALTALENTS',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'EE0D7432D78159892528308F6F7DCAB5'
	},{
		text: 'Years of Experience',
		dataIndex: 'cin21miscinfo1-CLASSIFICATION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '886A654F5FE057A84082A8CB50CCA008'
	},{
		text: 'Level of Expertise',
		dataIndex: 'cin21miscinfo1-RANKHELD',
		filterable: true,
		sortable: true,
		width: 150,
		action: '826440CFA3F2D385B8D03872554EAA2E'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_51C021FCD2BE8380E4E874578E885A28.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});