Ext.define('Form.model.recruitment.mrfstatus.model', {
	extend: 'Ext.data.Model',
	fields: [
		'A_GUID',
		'A_APPLICANTNUMBER',
		'A_FIRSTNAME',
		'A_LASTNAME',
		'A_SOURCE', 
		{
			name: 'A_APPLICATIONDATE',
			type: 'date' 
		}, 
		{
			name: 'A_RECDATECREATED',
			type: 'date' 
		}, 
		'X_EXAMTYPE',
		{
			name: 'X_EXAMSCHEDDATE',
			type: 'date' 
		},
		'X_EXAMSTATUS',
		'X_EXAMCOMMENTS', 
		'X_EXAMATTACHMENT',
		{
			name: 'X_HRINTERVIEWDATE',
			type: 'date' 
		},
		'X_HRINTERVIEWER',
		'X_HRSTATUS',
		'X_HRCOMMENTS',
		'X_HRATTACHMENT',
		{
			name: 'X_HRFEEDBACKDATE',
			type: 'date'
		}, 
		{
			name: 'X.JODATEINVITE',
			type: 'date'
		}, 
		{
			name: 'X_JODATEDECISION',
			type: 'date'
		}, 
		'X_JOSTATUS',
		'X_JOCOMMENTS',  
		{
			name: 'X_PECDATESUBMITTED',
			type: 'date'
		}, 
		{
			name: 'X_PECDATERECEIVED',
			type: 'date'
		}, 
		'X_PECSTATUS',
		'X_PECCOMMENTS',
		'X_PECATTACHMENT',
		'X_OCNEODATE',
		'X_OCOBDATE',
		'X_OCSTATUS',
		'X_OCCOMMENTS',
		'X_OCATTACHMENT',
		'G_REQUISITIONNO',  
		{
			name: 'G_DATEPRESCREEN',
			type: 'date'
		}, 
		{
			name: 'G_DATESENDOUT',
			type: 'date'
		}, 
		'H_CONTACTCELLNUMBER',
		'H_EMAILADDRESS',
		'I_REQUISITIONEDBY',
		'I_DIVISIONCODE',
		'I_DEPARTMENTCODE', 
		{
			name: 'I_DATEREQUESTED',
			type: 'date'
		},  
		{
			name: 'I_DATELASTUPDATE',
			type: 'date'
		},
		{
			name: 'I_DATEACTIONWASDONE',
			type: 'date'
		}, 
		{
			name: 'X_CFDATEGIVEN',
			type: 'date'
		},
		{
			name: 'X_CFDATESIGNED',
			type: 'date'
		},
		'X_CFSTATUS',
		'X_CFCOMMENTS',
		'X_CFATTACHMENT',
		{
			name: 'X_FDDATEACTUALINTERVIEW',
			type: 'date'
		},
		{
			name: 'X_FDINTERVIEWDATE',
			type: 'date'
		},
		'X_FDINTERVIEWER',
		'X_FDSTATUS',
		'X_FDCOMMENTS',
		{
			name: 'X_FDFEEDBACKDATE',
			type: 'date'
		}, 
		{
			name: 'X_DHDATEACTUALINTERVIEW',
			type: 'date'
		},
		{
			name: 'X_DHINTERVIEWDATE',
			type: 'date'
		},
		'X_DHINTERVIEWER',
		'X_DHSTATUS',
		'X_DHCOMMENTS', 
		'X_DHATTACHMENT',
		{
			name: 'X_DHFEEDBACKDATE',
			type: 'date'
		}, 
		{
			name: 'X_GMDATEACTUALINTERVIEW',
			type: 'date'
		},
		{
			name: 'X_GMINTERVIEWDATE',
			type: 'date'
		},
		'X_GMINTERVIEWER',
		'X_GMSTATUS',
		'X_GMCOMMENTS', 
		'X_GMATTACHMENT',
		{
			name: 'X_GMFEEDBACKDATE',
			type: 'date'
		},
		'Z_DESCRIPTION',
		{
			name: 'TATMRFPOST', 
			type: 'number'
		},{
			name: 'TATSOURCING', 
			type: 'number'
		},{
			name: 'TATPRESCREENINVITE', 
			type: 'number'
		},{
			name: 'TATEXAMHRINT', 
			type: 'number'
		},{
			name: 'TATSUMMARYSC', 
			type: 'number'
		},{
			name: 'TATHRFEEDBACK', 
			type: 'number'
		},{
			name: 'TATHDFD', 
			type: 'number'
		},{
			name: 'TATFD', 
			type: 'number'
		},{
			name: 'TATSUMMARYFD', 
			type: 'number'
		},{
			name: 'TATHDSD', 
			type: 'number'
		},{
			name: 'TATSD', 
			type: 'number'
		},{
			name: 'TATSUMMARYSD', 
			type: 'number'
		},{
			name: 'TATHDMD', 
			type: 'number'
		},{
			name: 'TATMD', 
			type: 'number'
		},{
			name: 'TATSUMMARYMD', 
			type: 'number'
		},{
			name: 'TATJOBOFFER', 
			type: 'number'
		},{
			name: 'TATSUMMARYJO', 
			type: 'number'
		},{
			name: 'TATREQ', 
			type: 'number'
		},{
			name: 'TATTOTAL', 
			type: 'number'
		},{
			name: 'TATCONTRACT',
			type: 'number'
		},{
			name: 'TOTALTATSOURCING',
			type: 'number'
		},{
			name: 'TOTALTATEXAMHRINT',
			type: 'number'
		},{
			name: 'TOTALTATSUMMARYSC',
			type: 'number'
		},{
			name: 'TOTALTATHRFEEDBACK',
			type: 'number'
		},{
			name: 'TOTALTATJOBOFFER',
			type: 'number'
		},{
			name: 'TOTALTATSUMMARYJO',
			type: 'number'
		},{
			name: 'TOTALTATREQ',
			type: 'number'
		},{
			name: 'TOTALTATTOTAL',
			type: 'number'
		},{
			name: 'TOTALTATPRESCREENINVITE',
			type: 'number'
		},{
			name: 'TOTALTATMRFPOST',
			type: 'number'
		},{
			name: 'TOTALTATCONTRACT',
			type: 'number'
		},{
			name: 'TOTALTATHDFD',
			type: 'number'
		},{
			name: 'TOTALTATFD',
			type: 'number'
		},{
			name: 'TOTALTATSUMMARYFD',
			type: 'number'
		},{
			name: 'TOTALTATHDSD',
			type: 'number'
		},{
			name: 'TOTALTATSD',
			type: 'number'
		},{
			name: 'TOTALTATSUMMARYSD',
			type: 'number'
		},{
			name: 'TOTALTATHDMD',
			type: 'number'
		},{
			name: 'TOTALTATMD',
			type: 'number'
		},{
			name: 'TOTALTATSUMMARYMD',
			type: 'number'
		},{
			name: 'X_REQUISITIONNO',
			type: 'string'
		}
	]
});

