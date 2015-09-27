Ext.define('Form.view.recruitment.mrfstatus.view', {     
	extend: 'Ext.grid.Panel',
	alias: 'widget.mrfstatusview', 
	width: '100%',
    title: 'MRF Status', 
    multiSelect: true,
    clicksToEdit: 2,
    loadMask: true,
	
	initComponent: function() {     
	    this.store = 'recruitment.mrfstatus.store'; 
	    this.features = [{
			ftype: 'filters',
			encode: true, // json encode the filter query
			local: false, // defaults to false (remote filtering)
			filters: [{
				type: 'string',
				dataIndex: 'A_APPLICANTNUMBER'
			}]
		}];
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'recruitment.mrfstatus.store', 
				        displayInfo: true,
				        emptyMsg: "No result to display"
				   });
		this.tbar = [{
				xtype: 'combobox',
				fieldLabel: 'Department',
				id: 'dptmntddd',
				name: 'department',
				editable: false,
				cls: 'field-margin',
				width: 320,
				queryMode: 'remote',
				store: 'recruitment.mrfstatus.departmentstore',
				displayField: 'departmentname',
				valueField: 'departmentcode'
		  	},{
		  		xtype: 'tbseparator'
		    },{
		  		xtype: 'splitbutton',
				text: 'Show',
				name: 'menuprocess',
		    	menu: {
		        id: 'view-type-menu',
		        items: [{
					xtype: 'menucheckitem',
		            text: 'MRF Basic Information',
					cls: 'white-color',
		            checked: false
		        },{
					xtype: 'menucheckitem',
					cls: 'is-color',
		            text: 'Candidates'
		        },{
					xtype: 'menucheckitem',
		            text: 'Initial Applicant Examination',
					cls: 'dh-color',
					checked: false
		        },{
					xtype: 'menucheckitem',
		            text: 'HR Interview',
					cls: 'sun-color',
					checked: false
		        },{
					xtype: 'menucheckitem',
		            text: 'Hiring Department Interview (First)',
					cls: 'globe-color',
					checked: false
		        },{
					xtype: 'menucheckitem',
		            text: 'Hiring Department Interview (Second)',
					cls: 'benefits-color',
					checked: false
		        },{
					xtype: 'menucheckitem',
		            text: 'Hiring Department Interview (Final)',
					cls: 'audit-color',
					checked: false
		        },{
					xtype: 'menucheckitem',
		            text: 'Job Offer',
					cls: 'auditb-color',
					checked: false
		        },{
					xtype: 'menucheckitem',
		            text: 'Pre-Employment Checklist',
					cls: 'it-color',
					checked: false
		        },{
					xtype: 'menucheckitem',
		            text: 'Contract',
					cls: 'acct-color',
					checked: false
		        },{
					xtype: 'menucheckitem',
		            text: 'Onboarding Checklist',
					cls: 'white-color',
					checked: false
		        },{
					xtype: 'menucheckitem',
					text: 'All Columns',
					checked: true
		        }]
		    }
		  },{
		  		xtype: 'tbseparator'
		  },{
		  	text: 'Send e-mail',
		  		action: 'sendemail'
		  },{
		  		xtype: 'tbseparator'
		  },{
			  	text: 'Display maximum TAT',
				action: 'tatmax'
		  },{
		  		xtype: 'tbseparator'
		  },{
			  	text: 'Settings',
				action: 'settings'
		  },{
		  		xtype: 'tbseparator'
		  },{
			  	text: 'Export to Excel',
				action: 'exporttoexcel'
		  },'->',
		  {
			  	xtype: 'displayfield',
			  	name: 'mrfdisp',
				value: ' '
		  }];
		  
		this.columns =  [{
	            xtype: 'rownumberer',
				name: 'rownum',
				locked: true,
	            width: 50,
	            sortable: false
	       },{  
			    text: 'Requisition No.',
			    dataIndex: 'G_REQUISITIONNO',
				name: 'grequisition',
				locked: true,
				action: 'visiblegroup',
				filterable: true,
				tdCls: 'white-color',
			    width: 150
		  },{  
			    text: 'First Name',
			    dataIndex: 'A_FIRSTNAME',
				filterable: true,
				locked: true,
				action: 'visiblegroup',
			    width: 100
		  },{  
			    text: 'Last Name',
			    dataIndex: 'A_LASTNAME',
				filterable: true,
				action: 'visiblegroup',
			    width: 150
		  },{  
			    text: 'Position',
			    dataIndex: 'Z_DESCRIPTION',  
				filterable: true,
				tdCls: 'white-color',
				action: 'visiblegroup',
			    width: 200
		  },{  
			    text: 'Hiring Department',
			    dataIndex: 'I_DEPARTMENTCODE',
				filterable: true,
				tdCls: 'white-color',
				action: 'igroup',
			    width: 200
		  },{  
			    text: 'Division',
			    dataIndex: 'I_DIVISIONCODE',
				filterable: true,
				action: 'igroup',
				tdCls: 'white-color',
			    width: 200
		  },{
			    text: 'MRF Date Received',
			    dataIndex: 'I_DATELASTUPDATE',
				tdCls: 'white-color',
				action: 'igroup',
			    width: 150,
			    xtype: 'datecolumn'
		  },{
			    text: 'Posting Date',
			    dataIndex: 'I_DATEACTIONWASDONE',
				tdCls: 'white-color',	
				action: 'igroup',
			    width: 150,
			    xtype: 'datecolumn'
		  },{  
			    text: 'Requisitioner',
			    dataIndex: 'I_REQUISITIONEDBY',
				filterable: true,
				action: 'igroup',
				tdCls: 'white-color',
			    width: 200
		  },{  
			    text: 'TAT (MRF to Posting)',
			    dataIndex: 'TATMRFPOST',
				filterable: true,
				action: 'igroup',
				tdCls: 'white-color',
			    width: 200,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATMRFPOST;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{  
			    text: 'Applicant Number',
			    dataIndex: 'A_APPLICANTNUMBER',
				filterable: true,
				action: 'agroup',
				tdCls: 'is-color',
			    width: 200 
		  },{  
			    text: 'Contact No.',
			    dataIndex: 'H_CONTACTCELLNUMBER',
				filterable: true,
				action: 'agroup',
				tdCls: 'is-color',
			    width: 200
		  },{  
			    text: 'e-mail Address',
			    dataIndex: 'H_EMAILADDRESS',
				filterable: true,
				action: 'agroup',
				tdCls: 'is-color',
			    width: 250
		  },{  
			    text: 'Source',
			    dataIndex: 'A_SOURCE',
				filterable: true,
				action: 'agroup',
				tdCls: 'is-color',		
			    width: 200
		  },{
			    text: 'Date of Application',
			    dataIndex: 'A_APPLICATIONDATE',
				tdCls: 'is-color',	
				action: 'visiblegroup',
			    width: 150,
			    xtype: 'datecolumn'
		  },{
			    text: 'Sourcing Date',
			    dataIndex: 'A_RECDATECREATED',
				tdCls: 'is-color',	
				action: 'agroup',
			    width: 150,
			    xtype: 'datecolumn'
		  },{  
			    text: 'TAT (Sourcing)',
				tdCls: 'is-color',	
				action: 'agroup',
			    dataIndex: 'TATSOURCING',
				filterable: true,
			    width: 200,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATSOURCING;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{
			    text: 'Date Pre-Screened',
			    dataIndex: 'G_DATEPRESCREEN',
				tdCls: 'is-color',	
				action: 'agroup',
			    width: 150,
			    xtype: 'datecolumn'
		  },{
			    text: 'Date of Invite Send-out',
			    dataIndex: 'G_DATESENDOUT',
			    action: 'agroup',
				tdCls: 'is-color',	
			    width: 150,
			    xtype: 'datecolumn'
		  },{  
			    text: 'TAT (Pre-screen to Invite)',
				tdCls: 'is-color',	
				action: 'agroup',
			    dataIndex: 'TATPRESCREENINVITE',
				filterable: true,
			    width: 200,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATPRESCREENINVITE;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{  
			    text: 'Exam type',
			    dataIndex: 'X_EXAMTYPE',
				filterable: true,
				action: 'examgroup',
				tdCls: 'dh-color',		
			    width: 200
		  },{
			    text: 'Date of Exam',
			    dataIndex: 'X_EXAMSCHEDDATE',
				tdCls: 'dh-color',	
				action: 'examgroup',
			    width: 150,
			    xtype: 'datecolumn'
		  },{  
			    text: 'Exam Status',
			    dataIndex: 'X_EXAMSTATUS',
				tdCls: 'dh-color',	
				action: 'examgroup',
				filterable: true,
			    width: 200
		  },{  
			    text: 'Exam Comments',
			    dataIndex: 'X_EXAMCOMMENTS',
				tdCls: 'dh-color',	
				action: 'examgroup',
				filterable: true,
			    width: 200
		  },{  
			    text: 'Exam Attachment',
			    dataIndex: 'X_EXAMATTACHMENT',
				tdCls: 'dh-color',	
				action: 'examgroup',
				filterable: true,
			    width: 200
		  },{  
			    text: 'TAT (Exam to HR Interview)',
			    dataIndex: 'TATEXAMHRINT',
				filterable: true,
				action: 'examgroup',
				tdCls: 'dh-color',	
			    width: 200,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATEXAMHRINT;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{  
			    text: 'TAT Summary',
			    dataIndex: 'TATSUMMARYSC',
				filterable: true,
				action: 'examgroup',
				tdCls: 'dh-color',	
			    width: 200,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATSUMMARYSC;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{
			    text: 'Date of HR Interview',
			    dataIndex: 'X_HRINTERVIEWDATE',
			    width: 150,
			    action: 'hrgroup',
				tdCls: 'sun-color',	
				xtype: 'datecolumn'
		  },{  
			    text: 'HR Interviewer',
			    dataIndex: 'X_HRINTERVIEWER',
				filterable: true,
				action: 'hrgroup',
				tdCls: 'sun-color',	
			    width: 200
		  },{  
			    text: 'HR Status',
			    dataIndex: 'X_HRSTATUS',
				filterable: true,
				action: 'hrgroup',
				tdCls: 'sun-color',	
			    width: 200
		  },{  
			    text: 'HR Comments',
			    dataIndex: 'X_HRCOMMENTS',
				filterable: true,
				action: 'hrgroup',
				tdCls: 'sun-color',	
			    width: 200
		  },{  
			    text: 'HR Attachment',
			    dataIndex: 'X_HRATTACHMENT',
				filterable: true,
				action: 'hrgroup',
				tdCls: 'sun-color',	
			    width: 200
		  },{ 
			    text: 'HR Date of Feedback',
			    dataIndex: 'X_HRFEEDBACKDATE',
			    width: 150,
			    action: 'hrgroup',
				tdCls: 'sun-color',	
				xtype: 'datecolumn'
		  },{  
			    text: 'TAT (HR Interview to Feedback)',
			    dataIndex: 'TATHRFEEDBACK',
				filterable: true,
				action: 'hrgroup',
				tdCls: 'sun-color',	
			    width: 210,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATHRFEEDBACK;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{
			    text: 'Date of Interview - First Department ',
			    dataIndex: 'X_FDINTERVIEWDATE',
			    width: 200,
			    action: 'fdgroup',
				tdCls: 'globe-color',	
				xtype: 'datecolumn'
		  },{
			    text: 'Date of Actual Interview - First Dept',
			    dataIndex: 'X_FDDATEACTUALINTERVIEW',
			    width: 220,
			    action: 'fdgroup',
				tdCls: 'globe-color',
				xtype: 'datecolumn'
		  },{  
			    text: 'Interviewer - First Department',
			    dataIndex: 'X_FDINTERVIEWER',
				filterable: true,
				action: 'fdgroup',
				tdCls: 'globe-color',
			    width: 200
		  },{  
			    text: 'TAT (Feedback from HR interview to 1st Dept Interview)',
			    dataIndex: 'TATHDFD',
				filterable: true,
				action: 'fdgroup',
				tdCls: 'globe-color',
			    width: 350,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATHDFD;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{  
			    text: 'Status - First Dept',
			    dataIndex: 'X_FDSTATUS',
				filterable: true,
				action: 'fdgroup',
				tdCls: 'globe-color',
			    width: 200
		  },{  
			    text: 'Comments - First Dept',
			    dataIndex: 'X_FDCOMMENTS',
				filterable: true,
				action: 'fdgroup',
				tdCls: 'globe-color',
			    width: 200
		  },{
			    text: 'Date of Feedback from Hiring Department',
			    dataIndex: 'X_FDFEEDBACKDATE',
			    width: 280,
			    action: 'fdgroup',
				tdCls: 'globe-color',
				xtype: 'datecolumn'
		  },{  
			    text: 'TAT (First Department Interview Feedback)',
			    dataIndex: 'TATFD',
				filterable: true,
				action: 'fdgroup',
				tdCls: 'globe-color',
			    width: 300,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATFD;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{  
			    text: 'TAT (First Dept Interview TAT Summary)',
			    dataIndex: 'TATSUMMARYFD',
				filterable: true,
				action: 'fdgroup',
				tdCls: 'globe-color',
			    width: 300,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATSUMMARYFD;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{
			    text: 'Date of Interview - 2nd Dept',
			    dataIndex: 'X_DHINTERVIEWDATE',
			    width: 200,
			    action: 'dhgroup',
				tdCls: 'benefits-color',
				xtype: 'datecolumn'
		  },{
			    text: 'Date of Actual 2nd Dept Interview',
			    dataIndex: 'X_DHDATEACTUALINTERVIEW',
			    width: 250,
			    action: 'dhgroup',
				tdCls: 'benefits-color',
				xtype: 'datecolumn'
		  },{  
			    text: 'Interviewer - 2nd Dept',
			    dataIndex: 'X_DHINTERVIEWER',
				filterable: true,
				action: 'dhgroup',
				tdCls: 'benefits-color',
			    width: 200
		  },{  
			    text: 'TAT (Feedback from 1st to 2nd Dept Interview)',
			    dataIndex: 'TATHDSD',
				filterable: true,
				action: 'dhgroup',
				tdCls: 'benefits-color',
			    width: 360,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATHDSD;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{  
			    text: 'Status - 2nd Dept',
			    dataIndex: 'X_DHSTATUS',
				filterable: true,
				action: 'dhgroup',
				tdCls: 'benefits-color',
			    width: 200
		  },{  
			    text: 'Comments - 2nd Dept',
			    dataIndex: 'X_DHCOMMENTS',
				tdCls: 'benefits-color',
				filterable: true,
				action: 'dhgroup',
			    width: 200
		  },{  
			    text: 'Attachment - 2nd Dept',
			    dataIndex: 'X_DHATTACHMENT',
				tdCls: 'benefits-color',
				filterable: true,
				action: 'dhgroup',
			    width: 200
		  },{ 
			    text: 'Date of Feedback from Hiring Dept',
			    dataIndex: 'X_DHFEEDBACKDATE',
			    width: 300,
			    action: 'dhgroup',
				tdCls: 'benefits-color',
				xtype: 'datecolumn'
		  },{  
			    text: 'TAT (2nd Dept Interview Feedback)',
			    dataIndex: 'TATSD',
				filterable: true,
				action: 'dhgroup',
				tdCls: 'benefits-color',
			    width: 300,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATSD;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{  
			    text: 'TAT (2nd Dept Interview TAT Summary)',
			    dataIndex: 'TATSUMMARYSD',
				filterable: true,
				tdCls: 'benefits-color',
			    width: 300,
			    action: 'dhgroup',
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATSUMMARYSD;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{
			    text: 'Date of Final Interview',
			    dataIndex: 'X_GMINTERVIEWDATE',
			    width: 200,
			    action: 'gmgroup',
				tdCls: 'audit-color',
				xtype: 'datecolumn'
		  },{
			    text: 'Date of Actual Final Interview',
			    dataIndex: 'X_GMDATEACTUALINTERVIEW',
			    width: 200,
			    action: 'gmgroup',
				tdCls: 'audit-color',
				xtype: 'datecolumn'
		  },{  
			    text: 'Interviewer - Final Interview',
			    dataIndex: 'X_GMINTERVIEWER',
				filterable: true,
				action: 'gmgroup',
				tdCls: 'audit-color',
			    width: 200
		  },{  
			    text: 'TAT (2nd Dept Interview to Final)',
			    dataIndex: 'TATHDMD',
			    action: 'gmgroup',
				filterable: true,
				tdCls: 'audit-color',
			    width: 300,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATHDMD;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{  
			    text: 'Status - Final Interview',
			    dataIndex: 'X_GMSTATUS',
				filterable: true,
				action: 'gmgroup',
				tdCls: 'audit-color',
			    width: 200
		  },{  
			    text: 'Comments - Final Interview',
			    dataIndex: 'X_GMCOMMENTS',
				filterable: true,
				action: 'gmgroup',
				tdCls: 'audit-color',
			    width: 200
		  },{  
			    text: 'Attachment - Final Interview',
			    dataIndex: 'X_GMATTACHMENT',
				filterable: true,
				action: 'gmgroup',
				tdCls: 'audit-color',
			    width: 200
		  },{ 
			    text: 'Date of Feedback - Final Interview',
			    dataIndex: 'X_GMFEEDBACKDATE',
			    width: 250,
			    action: 'gmgroup',
				tdCls: 'audit-color',
				xtype: 'datecolumn'
		  },{  
			    text: 'TAT (Final Interview Feedback/Hiring Decision)',
			    dataIndex: 'TATMD',
				filterable: true,
				action: 'gmgroup',
				tdCls: 'audit-color',
			    width: 300,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATMD;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{  
			    text: 'TAT (Final Interview TAT Summary)',
			    dataIndex: 'TATSUMMARYMD',
				filterable: true,
				action: 'gmgroup',
				tdCls: 'audit-color',
			    width: 250,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATSUMMARYMD;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{
			    text: 'Date Presented Job Offer to Applicant',
			    dataIndex: 'X_JODATEINVITE',
			    width: 250,
			    action: 'jogroup',
				tdCls: 'auditb-color',
				xtype: 'datecolumn'
		  },{
			    text: 'Date of Applicant\'s Decision',
			    dataIndex: 'X_JODATEDECISION',
			    width: 250,
			    action: 'jogroup',
				tdCls: 'auditb-color',
				xtype: 'datecolumn'
		  },{  
			    text: 'Status - Job Offer',
			    dataIndex: 'X_JOSTATUS',
				filterable: true,
				action: 'jogroup',
				tdCls: 'auditb-color',
			    width: 200
		  },{  
			    text: 'Comments - Job Offer',
			    dataIndex: 'X_JOCOMMENTS',
				filterable: true,
				action: 'jogroup',
				tdCls: 'auditb-color',
			    width: 200
		  },{  
			    text: 'TAT (Job Offer)',
			    dataIndex: 'TATJOBOFFER',
				filterable: true,
				action: 'jogroup',
				tdCls: 'auditb-color',
			    width: 200,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATJOBOFFER;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{  
			    text: 'TAT (Job Offer TAT Summary)',
			    dataIndex: 'TATSUMMARYJO',
				filterable: true,
				action: 'jogroup',
				tdCls: 'auditb-color',
			    width: 250,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATSUMMARYJO;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{
			    text: 'Date Requirements was discussed to applicant',
			    dataIndex: 'X_PECDATERECEIVED',
			    width: 300,
			    action: 'pecgroup',
				tdCls: 'it-color',
				xtype: 'datecolumn'
		  },{
			    text: 'Date Accomplished',
			    dataIndex: 'X_PECDATESUBMITTED',
			    width: 200,
			    action: 'pecgroup',
				tdCls: 'it-color',
				xtype: 'datecolumn'
		  },{  
			    text: 'Status - Pre-emp Checklist',
			    dataIndex: 'X_PECSTATUS',
				filterable: true,
				action: 'pecgroup',
				tdCls: 'it-color',
			    width: 200
		  },{  
			    text: 'Comments - Pre-emp Checklist',
			    dataIndex: 'X_PECCOMMENTS',
				filterable: true,
				action: 'pecgroup',
				tdCls: 'it-color',
			    width: 200
		  },{  
			    text: 'Attachment - Pre-emp Checklist',
			    dataIndex: 'X_PECATTACHMENT',
				filterable: true,
				action: 'pecgroup',
				tdCls: 'it-color',
			    width: 200
		  },{   
			    text: 'TAT (Pre-employment TAT Summary)',
			    dataIndex: 'TATREQ',
				filterable: true,
				action: 'pecgroup',
				tdCls: 'it-color',
			    width: 250,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATREQ;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{
			    text: 'Date Given',
			    dataIndex: 'X_CFDATEGIVEN',
			    width: 200,
			    action: 'cfgroup',
				tdCls: 'acct-color',
				xtype: 'datecolumn'
		  },{
			    text: 'Date Signed by Applicant',
			    dataIndex: 'X_CFDATESIGNED',
			    action: 'cfgroup',
			    width: 200,
				tdCls: 'acct-color',
				xtype: 'datecolumn'
		  },{  
			    text: 'Status - Contract',
			    dataIndex: 'X_CFSTATUS',
				filterable: true,
				action: 'cfgroup',
				tdCls: 'acct-color',
			    width: 200
		  },{  
			    text: 'Comments - Contract',
			    dataIndex: 'X_CFCOMMENTS',
				filterable: true,
				action: 'cfgroup',
				tdCls: 'acct-color',
			    width: 200
		  },{  
			    text: 'Attachment - Contract',
			    dataIndex: 'X_CFATTACHMENT',
				filterable: true,
				action: 'cfgroup',
				tdCls: 'acct-color',
			    width: 200
		  },{  
			    text: 'TAT (Contract)',
			    dataIndex: 'TATCONTRACT',
				filterable: true,
				action: 'cfgroup',
				tdCls: 'acct-color',
			    width: 200,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATCONTRACT;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  },{
			    text: 'NEO DATE', //New Employee Orientation
			    dataIndex: 'X_OCNEODATE',
			    width: 200,
			    action: 'ocgroup',
				tdCls: 'white-color',
				xtype: 'datecolumn'
		  },{
			    text: 'On-Boarding Date',
			    dataIndex: 'X_OCOBDATE',
			    width: 200,
			    action: 'ocgroup',
				tdCls: 'white-color',
				xtype: 'datecolumn'
		  },{  
			    text: 'Status - Onboarding Checklist',
			    dataIndex: 'X_OCSTATUS',
				filterable: true,
				action: 'ocgroup',
				tdCls: 'white-color',
			    width: 200
		  },{  
			    text: 'Comments - Onboarding Checklist',
			    dataIndex: 'X_OCCOMMENTS',
				filterable: true,
				action: 'ocgroup',
				tdCls: 'white-color',
			    width: 200
		  },{  
			    text: 'Attachment - Onboarding Checklist',
			    dataIndex: 'X_OCATTACHMENT',
				filterable: true,
				action: 'ocgroup',
				tdCls: 'white-color',
			    width: 200
		  },{    
			    text: 'TAT (Total)',
			    dataIndex: 'TATTOTAL',
			    action: 'visiblegroup',
				filterable: true,
				tdCls: 'white-color',
			    width: 200,
				renderer: function(value, metaData, record) {
					var maxtat = record.data.TOTALTATTOTAL;
					if(value >= maxtat) {
						metaData.style = 'background-color: #FF0000;';
					}
					return value;
				}
		  }],
		
		
		this.callParent(arguments);
	}
});
