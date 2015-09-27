Ext.define('Form.view.queryoutput.FBC.NS_2ECCDD3A98CCBCB8A067E085619C45D4.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2ECCDD3A98CCBCB8A067E085619C45D4',
	loadMask: true,
	multiSelect: true,
	title: 'Positions Applied',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2ECCDD3A98CCBCB8A067E085619C45D4.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Position',
		dataIndex: 'clkposition-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '7AE15043C2D33429EE5CA0DB516C91E9'
	},{
		text: 'Department',
		dataIndex: 'clkdepartment-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'C374BFF3F291AA12D7C1587D11401357'
	},{
		text: 'Priority',
		dataIndex: 'cin21positnapld-PRIORITY',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: 'CD923D4047455CE9296483AD95E57B15'
	},{
		text: 'Recommendation',
		dataIndex: 'cin21positnapld-RECOMMENDATION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '902AA2803789853FE9520638391B3ECD'
	},{
		text: 'Position Code',
		dataIndex: 'cin21positnapld-POSITIONCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '162284EFA52E1B2B3E58F40FE4BD77D8'
	},{
		text: 'Department Code',
		dataIndex: 'cin21positnapld-DEPARTMENTCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '20B45AD9ACF3E425C73F23579DC08CB1'
	},{
		text: 'Location Code',
		dataIndex: 'cin21positnapld-LOCATIONCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '58B3AF8633699CE864705A1337F82F2C'
	},{
		text: 'Section Code',
		dataIndex: 'cin21positnapld-SECTIONCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '9076B716B203B6913390A701B6A2FDFD'
	},{
		text: 'Division Code',
		dataIndex: 'cin21positnapld-DIVISIONCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '36FFFE286292608347DD2A33C6BA4878'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2ECCDD3A98CCBCB8A067E085619C45D4.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});