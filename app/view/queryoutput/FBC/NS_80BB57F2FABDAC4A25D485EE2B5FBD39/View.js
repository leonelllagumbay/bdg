Ext.define('Form.view.queryoutput.FBC.NS_80BB57F2FABDAC4A25D485EE2B5FBD39.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_80BB57F2FABDAC4A25D485EE2B5FBD39',
	loadMask: true,
	multiSelect: true,
	title: 'Data Editor - CLKDEPARTMENT',
	width: 300,
	height: 300,

	store    : 'queryoutput.FBC.NS_80BB57F2FABDAC4A25D485EE2B5FBD39.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Department Head',
		dataIndex: 'clkdepartment-DEPARTMENTCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '5DB28E82836EC0D1BD69E674C4B2DB94'
	},{
		text: 'Description',
		dataIndex: 'clkdepartment-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 300,
		editor: 'textfield',
		action: 'C374BFF3F291AA12D7C1587D11401357'
	},{
		text: 'First Name of DH',
		dataIndex: 'cmfpa-FIRSTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '285A3FFD6747BEE5502BAA4872D4DE6C'
	},{
		text: 'Last Name of DH',
		dataIndex: 'cmfpa-LASTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '5B0ACA42BB84B24C7FBD6F53C319E7FA'
	},{
		text: 'Department Head PID',
		dataIndex: 'clkdepartment-DEPARTMENTHEAD',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: 'F7040CE8882D92BDDB472C90B030F978'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_80BB57F2FABDAC4A25D485EE2B5FBD39.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});