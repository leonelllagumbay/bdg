Ext.define('Form.model.jobbuilder.JobBuilderModel', {
	extend: 'Ext.data.Model',
	fields: [{
			name: 'clkposition-POSITIONCODE',
			type: 'string'
		},{
			name: 'clkposition-PARENTPOSITION',
			type: 'string'
		},{
			name: 'clkposition-DESCRIPTION',
			type: 'string'
		},{
			name: 'clkposition-BUDGETEDHEADCOUNT',
			type: 'float'
		},{
			name: 'clkposition-TOOLTIP',
			type: 'string'
		},{
			name: 'clkposition-JOBSTYLE',
			type: 'string'
		},{
			name: 'clkdepartment-DESCRIPTION',
			type: 'string'
		},{
			name: 'clkjobgrade-DESCRIPTION',
			type: 'string'
		},{
			name: 'clkjobclasscode-DESCRIPTION',
			type: 'string'
		},{
			name: 'clklabortype-DESCRIPTION',
			type: 'string'
		},{
			name: 'clkposition-DEPARTMENTCODE',
			type: 'string'
		},{
			name: 'clkposition-JOBCLASSCODE',
			type: 'string'
		},{
			name: 'clkposition-JOBGRADECODE',
			type: 'string'
		},{
			name: 'clkposition-LABORTYPE',
			type: 'string'
		},{
			name: 'clkposition-RECDATECREATED',
			type: 'date'
		},{
			name: 'clkposition-DATELASTUPDATE',
			type: 'date'
		},{
			name: 'clkposition-RECCREATEDBY',
			type: 'string'
		}]
});