Ext.define('Form.view.queryoutput.FBC.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC',
	loadMask: true,
	multiSelect: true,
	title: 'Relatives (inside company)',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Name',
		dataIndex: 'cin21relative-NAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '66F93D91877E1FB21ABA37096DADFC86'
	},{
		text: 'Relationship',
		dataIndex: 'cin21relative-RELATIONSHIP',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'AF913EDF4EDC795F2950D54B748730B9'
	},{
		text: 'Company',
		dataIndex: 'cin21relative-COMPANY',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'A128997C95AE56CCF1AD6B77345BF66F'
	},{
		text: 'Position',
		dataIndex: 'cin21relative-POSITION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '243E9873A024BA4F0C851B146196ACB7'
	},{
		text: 'Department Area',
		dataIndex: 'cin21relative-DEPARTMENTAREAD',
		filterable: true,
		sortable: true,
		width: 150,
		action: '7AD50E9C39ECF9014F229B1BC53F1654'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});