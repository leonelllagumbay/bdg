Ext.define('Form.view.jobbuilder.crudForm', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.crudform',
	width: '100%', 
	id: 'viewform7F6323CC-A1C7-AFB9-A773A680CAD3479A',
	height: '100%',
	autoScroll: true,
	defaults: {
		padding: 10,
	 	labelAlign: 'right',
	 	xtype: 'textfield',
	 	width: 370
	},
	initComponent: function() {   
		
		this.items = [{
			readOnly: true,
			fieldLabel: 'Action',
			name: 'actiontype'
		},{
			
			name: 'clkposition-POSITIONCODE',
			fieldLabel: 'Position Code'
		},{
			name: 'clkposition-DESCRIPTION',
			fieldLabel: 'Description'
		},{
			name: 'clkposition-BUDGETEDHEADCOUNT',
			fieldLabel: 'Budgeted Head Count',
		 	xtype: 'numberfield'
		},{
			name: 'clkposition-TOOLTIP',
			fieldLabel: 'Org Chart Tooltip'
		},{
			name: 'clkposition-JOBSTYLE',
			fieldLabel: 'Org Chart Style'
		},{
			name: 'clkdepartment-DESCRIPTION',
			fieldLabel: 'Department'
		},{
			name: 'clkjobgrade-DESCRIPTION',
			fieldLabel: 'Job Grade'
		},{
			name: 'clkjobclasscode-DESCRIPTION',
			fieldLabel: 'Job Class'
		},{
			name: 'clklabortype-DESCRIPTION',
			fieldLabel: 'Labor Type'
		},{
			name: 'clkposition-DEPARTMENTCODE',
			fieldLabel: 'Department Code'
		},{
			name: 'clkposition-JOBCLASSCODE',
			fieldLabel: 'Job Class Code',
		},{
			name: 'clkposition-JOBGRADECODE',
			fieldLabel: 'Job Grade Code'
		},{
			name: 'clkposition-LABORTYPE',
			fieldLabel: 'Labor Type Code'
		},{
			name: 'clkposition-RECCREATEDBY',
			fieldLabel: 'Created By'
		},{
			name: 'clkposition-RECDATECREATED',
			fieldLabel: 'Date Created',
			readOnly: true,
		 	xtype: 'datefield'
		},{
			name: 'clkposition-DATELASTUPDATE',
			fieldLabel: 'Date Last Update',
			readOnly: true,
		 	xtype: 'datefield'
		}];
		
		this.api = {
				submit: Ext.jobbuilder.Job.CrudSubmit
		};
		
		this.buttons = [{
			text: 'Add',
			action: 'save'
		},{
			text: 'Cancel',
			action: 'cancel'
		}];
		
		this.callParent(arguments);
	}
});