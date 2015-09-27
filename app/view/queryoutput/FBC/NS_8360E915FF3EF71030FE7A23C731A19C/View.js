Ext.define('Form.view.queryoutput.FBC.NS_8360E915FF3EF71030FE7A23C731A19C.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_8360E915FF3EF71030FE7A23C731A19C',
	loadMask: true,
	multiSelect: true,
	title: 'OrgDev',
	width: 1000,
	height: 500,

	store    : 'queryoutput.FBC.NS_8360E915FF3EF71030FE7A23C731A19C.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Position Code',
		dataIndex: 'clkposition-POSITIONCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'F5A87E351D44C7AB6791D2C0003D8017'
	},{
		text: 'Parent Position Code',
		dataIndex: 'clkposition-PARENTPOSITION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'CCF65AE29056A4D9327816AC8D5EB95A'
	},{
		text: 'Description',
		dataIndex: 'clkposition-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '7AE15043C2D33429EE5CA0DB516C91E9'
	},{
		text: 'Budgeted Head Count',
		dataIndex: 'clkposition-BUDGETEDHEADCOUNT',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: '99EA11AFD05D143A8C5CEEBEB16A7429'
	},{
		text: 'Org Chart Tooltip',
		dataIndex: 'clkposition-TOOLTIP',
		filterable: true,
		sortable: true,
		width: 150,
		action: '97119070AC43DE41C7C5A8098386B1F2'
	},{
		text: 'Org Chart Style',
		dataIndex: 'clkposition-JOBSTYLE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '8D0AAD1559133909140DC3597E72DE90'
	},{
		text: 'First Name',
		dataIndex: 'cmfpa-FIRSTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '285A3FFD6747BEE5502BAA4872D4DE6C'
	},{
		text: 'Last Name',
		dataIndex: 'cmfpa-LASTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '5B0ACA42BB84B24C7FBD6F53C319E7FA'
	},{
		text: 'Middle Name',
		dataIndex: 'cmfpa-MIDDLENAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '6F5DE70AB42BBBCF196BF2EF795BDE95'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_8360E915FF3EF71030FE7A23C731A19C.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});