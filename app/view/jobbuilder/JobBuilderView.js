Ext.define('Form.view.jobbuilder.JobBuilderView', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.jobbuilderview',
	loadMask: true,
	multiSelect: true,
	title: 'Positions',

	store    : 'jobbuilder.JobBuilderStore',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    columns: [{
		text: 'Position Code',
		dataIndex: 'clkposition-POSITIONCODE',
		filterable: true,
		sortable: true,
		allowBlank: false,
		width: 150,
		action: 'F5A87E351D44C7AB6791D2C0003D8017'
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
		format: '0',
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
		text: 'Department',
		dataIndex: 'clkdepartment-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'C374BFF3F291AA12D7C1587D11401357'
	},{
		text: 'Job Grade',
		dataIndex: 'clkjobgrade-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '216AA6488E711828701A1471AB194A0E'
	},{
		text: 'Job Class',
		dataIndex: 'clkjobclasscode-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'C8BB61E978722D9B916CF0A194E8ED15'
	},{
		text: 'Labor Type',
		dataIndex: 'clklabortype-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'BBA452BC74B3444F240288ED1E11F6A2'
	},{
		text: 'Department Code',
		dataIndex: 'clkposition-DEPARTMENTCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'B90B04A3DDDAECB9F882D3872CC9294D'
	},{
		text: 'Job Class Code',
		dataIndex: 'clkposition-JOBCLASSCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'C4A6C9B8A39F54DECD4F7C7A946ACD4F'
	},{
		text: 'Job Grade Code',
		dataIndex: 'clkposition-JOBGRADECODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '2412765872458D16AEB94C07B6CF5D64'
	},{
		text: 'Labor Type Code',
		dataIndex: 'clkposition-LABORTYPE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'FFA9723EB5D454585B6E51A004013DF9'
	},{
		text: 'Date Created',
		dataIndex: 'clkposition-RECDATECREATED',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: 'FE3917366F2F6990A720FF584A97B9FE'
	},{
		text: 'Date Last Update',
		dataIndex: 'clkposition-DATELASTUPDATE',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: 'D6C9EAA1A85AA79F7F3BA574BFB25A6C'
	},{
		text: 'Created By',
		dataIndex: 'clkposition-RECCREATEDBY',
		filterable: true,
		sortable: true,
		width: 150,
		action: '39B881F4094FACDCEA4E9E56C3D76BCA'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'jobbuilder.JobBuilderStore',
		        displayInfo: true,
		        emptyMsg: ''
		});
    	
    	this.tbar = [{
    		action: "Print",
			iconCls: "print-icon",
			tooltip: "Print",
			xtype: "button"
    	},{
    		action: "View",
			iconCls: "view-icon",
			tooltip: "View",
			xtype: "button"
    	},{
    		action: "Add",
			iconCls: "add-icon",
			tooltip: "Add",
			xtype: "button"
    	},{
    		action: "Edit",
			iconCls: "edit-icon",
			tooltip: "Edit",
			xtype: "button"
    	},{
    		action: "Copy",
			iconCls: "copy-icon",
			tooltip: "Copy",
			xtype: "button"
    	},{
    		action: "Delete",
			iconCls: "delete-icon",
			tooltip: "Delete",
			xtype: "button"
    	},{
    		action: "Email",
			iconCls: "email-icon",
			tooltip: "Email",
			xtype: "button"
    	}];
    	
		this.callParent(arguments);
    }
});