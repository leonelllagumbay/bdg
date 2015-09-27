Ext.define('Form.model.jobbuilder.OrgDevModel', {
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
			name: 'cmfpa-PERSONNELIDNO',
			type: 'string'
		},{
			name: 'cmfpa-SUPERIORCODE',
			type: 'string'
		},{
			name: 'cmfpa-FIRSTNAME',
			type: 'string'
		},{
			name: 'cmfpa-LASTNAME',
			type: 'string'
		},{
			name: 'cmfpa-MIDDLENAME',
			type: 'string'
		},{
			name: 'ecrgmyibose-AVATAR',
			type: 'string'
		}]
});