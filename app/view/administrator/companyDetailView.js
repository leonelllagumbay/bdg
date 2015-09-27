Ext.define('Form.view.administrator.companyDetailView', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.companydetailview',
	title: 'Company Details',
	titleAlign: 'center',
	buttonAlign: 'center',
	width: '100%', 
	height: '100%',
	autoScroll: true,
	initComponent: function() {   
		this.tbar = [{
		  	text: 'Back',
			action: 'backtocompanylist'
		}];
		this.defaults = {
			xtype: 'textfield',
			labelWidth: 150,
			padding: '7 7 7 100',
			width: 450
		};
		
		this.items = [{
			xtype: 'fieldset',
			margin: '10 10 0 50',
			padding: 7,
			width: '95%',
			title: 'Basic',
			collapsible: true,
			layout: 'anchor',
			defaults: {
				xtype: 'textfield',
				labelWidth: 150,
				padding: '7 7 7 100',
				width: 450
			},
			items: [{
				fieldLabel: 'Action',
				name: 'COMPANYACTION',
				readOnly: true
			},{
				fieldLabel: 'Company Order',
				name: 'C-COMPANYORDER',
				xtype: 'numberfield'
			},{
				fieldLabel: 'Company Code',
				name: 'A-COMPANYCODE',
				maxLength: 50,
				allowBlank: false
			},{
				fieldLabel: 'Name',
				name: 'A-DESCRIPTION',
				maxLength: 100,
				allowBlank: false
			},{
				fieldLabel: 'Slogan',
				name: 'A-SLOGAN',
				maxLength: 100,
				allowBlank: false
			},{
				fieldLabel: 'Company Email Address',
				name: 'A-WEBSITEEMAILADD',
				maxLength: 50,
				allowBlank: false
			},{
				fieldLabel: 'Home Page',
				name: 'A-HOMEPAGE',
				maxLength: 250,
				allowBlank: false
			},{
				fieldLabel: 'CSS For Theme',
				name: 'A-COMPANYTHEME',
				maxLength: 100,
				allowBlank: false
			},{
				fieldLabel: 'Is Active',
				name: 'A-ISACTIVE',
				maxLength: 1,
				allowBlank: false
			},{
				fieldLabel: 'Company Icon',
				name: 'D-MYIBOSELOGO',
				maxLength: 100,
				value: 'noicon.png'
			},{
				fieldLabel: 'Company Icon',
				name: 'dcompanyicon',
				xtype: 'filefield'
			},{
				fieldLabel: 'Company Logo',
				name: 'D-COMPANYLOGO',
				maxLength: 100,
				value: 'nocompanylogo.png'
			},{
				fieldLabel: 'Company Logo',
				name: 'dcompanylogo',
				xtype: 'filefield'
			}]
		},{
			xtype: 'fieldset',
			margin: '10 10 0 50',
			padding: 7,
			width: '95%',
			title: 'Database and Domain',
			collapsible: true,
			layout: 'anchor',
			defaults: {
				xtype: 'textfield',
				labelWidth: 150,
				padding: '7 7 7 100',
				width: 450
			},
			items: [{
				fieldLabel: 'DBMS',
				name: 'A-DBMS',
				maxLength: 20,
				allowBlank: false
			},{
				fieldLabel: 'DBMS Version',
				name: 'A-DBMSVERSION',
				maxLength: 10,
				allowBlank: false
			},{
				fieldLabel: 'Web Domain (with http/s)',
				name: 'A-WEBDOMAIN',
				maxLength: 100,
				allowBlank: false
			},{
				fieldLabel: 'Template',
				name: 'A-TEMPLATECODE',
				maxLength: 50
			},{
				fieldLabel: 'Template Data',
				name: 'A-TEMPLATEDATACODE',
				maxLength: 50
			},{
				fieldLabel: 'Global Datasource Name',
				name: 'B-GLOBAL_DSN',
				maxLength: 64
			},{
				fieldLabel: 'Company Datasource Name',
				name: 'B-COMPANY_DSN',
				maxLength: 64
			},{
				fieldLabel: 'Sub-company Datasource Name',
				name: 'B-SUBCO_DSN',
				maxLength: 64
			},{
				fieldLabel: 'Transaction Datasource Name',
				name: 'B-TRANSACT_DSN',
				maxLength: 64
			},{
				fieldLabel: 'Query Datasource Name',
				name: 'B-QUERY_DSN',
				maxLength: 64
			},{
				fieldLabel: 'Site Datasource Name',
				name: 'B-SITE_DSN',
				maxLength: 64
			},{
				fieldLabel: 'Variable Datasource Name',
				name: 'B-VAR_DSN',
				maxLength: 64
			},{
				fieldLabel: 'Sub-company Datasource Name (Non confi)',
				name: 'B-SUBNONCO_DSN',
				maxLength: 64
			},{
				fieldLabel: 'Default App',
				name: 'A-COMPANYDEFAULTAPP',
				maxLength: 50
			},{
				fieldLabel: 'Unstructure Location',
				name: 'A-UNSTRUCDATALOC',
				maxLength: 255
			},{
				fieldLabel: 'Unstructure Mapping',
				name: 'A-UNSTRUCTDATAMAP',
				maxLength: 255
			},{
				fieldLabel: 'Moodle Location',
				name: 'A-MOODLELOC',
				maxLength: 255
			},{
				fieldLabel: 'Open Meetings Location',
				name: 'A-OPENMEETINGSLOC',
				maxLength: 255
			},{
				fieldLabel: 'eRooms Server',
				name: 'A-EROOMSSERVER',
				maxLength: 60
			}]
		},{
			xtype: 'fieldset',
			margin: '10 10 0 50',
			padding: 7,
			width: '95%',
			title: 'Email Server',
			collapsible: true,
			layout: 'anchor',
			defaults: {
				xtype: 'textfield',
				labelWidth: 150,
				padding: '7 7 7 100',
				width: 450
			},
			items: [{
				fieldLabel: 'Mail Server',
				name: 'A-MAILSERVER',
				maxLength: 50
			},{
				fieldLabel: 'Mail User Name',
				name: 'A-EMAILUSERNAME',
				maxLength: 100
			},{
				fieldLabel: 'Mail Password',
				name: 'A-EMAILPASSWORD',
				inputType: 'password',
				maxLength: 100
			},{
				fieldLabel: 'Mail Connection Timeout(in seconds)',
				name: 'A-EMAILTIMEOUT',
				xtype: 'numberfield'
			},{
				fieldLabel: 'Mail Server Port',
				name: 'A-EMAILPORT',
				maxLength: 5
			},{
				fieldLabel: 'Enable TLS connection to mail server',
				name: 'A-EMAILUSETLS',
				maxLength: 5
			},{
				fieldLabel: 'Enable SSL socket connections to mail server',
				name: 'A-EMAILUSESSL',
				maxLength: 5
			},{
				fieldLabel: 'POP3 Server',
				name: 'A-XMLPOPMAILSERVER',
				maxLength: 60
			},{
				fieldLabel: 'POP3 User Name',
				name: 'A-XMLPOPMAILUSERNAME',
				maxLength: 60
			},{
				fieldLabel: 'POP3 Password',
				name: 'A-XMLPOPMAILPASSWORD',
				maxLength: 60
			}]
		},{
			xtype: 'fieldset',
			margin: '10 10 0 50',
			padding: 7,
			width: '95%',
			title: 'LDAP Server',
			collapsible: true,
			layout: 'anchor',
			defaults: {
				xtype: 'textfield',
				labelWidth: 150,
				padding: '7 7 7 100',
				width: 450
			},
			items: [{
				fieldLabel: 'LDAP Server',
				name: 'A-LDAPSERVER',
				maxLength: 100
			},{
				fieldLabel: 'LDAP Port',
				name: 'A-LDAPPORT',
				maxLength: 10
			},{
				fieldLabel: 'LDAP Timeout',
				name: 'A-LDAPTIMEOUT',
				maxLength: 10
			},{
				fieldLabel: 'LDAP Start Row',
				name: 'A-LDAPSTARTROW',
				maxLength: 100
			},{
				fieldLabel: 'LDAP Start',
				name: 'A-LDAPSTART',
				maxLength: 100
			},{
				fieldLabel: 'LDAP Attributes',
				name: 'A-LDAPATTRIBUTES',
				maxLength: 100
			},{
				fieldLabel: 'LDAP Filter Conditions',
				name: 'A-LDAPFILTERCONDITIONS',
				maxLength: 100
			},{
				fieldLabel: 'LDAP Sort Control',
				name: 'A-LDAPSORTCONTROL',
				maxLength: 100
			},{
				fieldLabel: 'LDAP Separator',
				name: 'A-LDAPSEPARATOR',
				maxLength: 10
			},{
				fieldLabel: 'LDAP Secure',
				name: 'A-LDAPSECURE',
				maxLength: 5
			},{
				fieldLabel: 'LDAP Scope',
				name: 'A-LDAPSCOPE',
				maxLength: 40
			},{
				fieldLabel: 'LDAP Return as Binary',
				name: 'A-LDAPRETURNASBINARY',
				maxLength: 5
			},{
				fieldLabel: 'LDAP Referral',
				name: 'A-LDAPREFERRAL',
				maxLength: 50
			},{
				fieldLabel: 'LDAP Rebind',
				name: 'A-LDAPREBIND',
				maxLength: 50
			},{
				fieldLabel: 'LDAP Name',
				name: 'A-LDAPNAME',
				maxLength: 50
			},{
				fieldLabel: 'LDAP Max Rows',
				name: 'A-LDAPMAXROWS',
				maxLength: 10
			},{
				fieldLabel: 'LDAP Filter',
				name: 'A-LDAPFILTER',
				maxLength: 50
			},{
				fieldLabel: 'LDAP DN',
				name: 'A-LDAPDN',
				maxLength: 50
			},{
				fieldLabel: 'LDAP Delimiter',
				name: 'A-LDAPDELIMITER',
				maxLength: 20
			},{
				fieldLabel: 'LDAP Sort',
				name: 'A-LDAPSORT',
				maxLength: 20
			}]
		},{
			xtype: 'fieldset',
			margin: '10 10 0 50',
			padding: 7,
			width: '95%',
			title: 'Additional Info',
			collapsible: true,
			layout: 'anchor',
			defaults: {
				xtype: 'textfield',
				labelWidth: 150,
				padding: '7 7 7 100',
				width: 450
			},
			items: [{
				fieldLabel: 'With Attendance',
				name: 'A-WITHATTENDANCE',
				maxLength: 1
			},{
				fieldLabel: 'With Attendance Log',
				name: 'A-WITHATTENDANCELOG',
				maxLength: 1
			},{
				fieldLabel: 'Company Address',
				name: 'C-ADDRESS',
				maxLength: 300
			},{
				fieldLabel: 'Company Industry',
				name: 'C-INDUSTRY',
				maxLength: 100
			},{
				fieldLabel: 'Company Telephone Number 1',
				name: 'C-TELNUMBER1',
				maxLength: 15
			},{
				fieldLabel: 'Company Telephone Number 2',
				name: 'C-TELNUMBER2',
				maxLength: 15
			},{
				fieldLabel: 'Company Telephone Number 3',
				name: 'C-TELNUMBER3',
				maxLength: 15
			},{
				fieldLabel: 'Company TIN',
				name: 'C-TIN',
				maxLength: 11
			},{
				fieldLabel: 'Company SSS',
				name: 'C-SSSNUMBER',
				maxLength: 12
			},{
				fieldLabel: 'Company FAX Number',
				name: 'C-FAXNUMBER',
				maxLength: 15
			}]
		}];
		
		this.api = {
				submit: Ext.administrator.Company.SubmitCompany
		};
		
		this.paramOrder = ['A-COMPANYCODE'];
		
		this.buttons = [{
			text: 'Save',
			action: 'save'
		},{
			text: 'Cancel',
			action: 'cancel'
		}];
		
		this.callParent(arguments);
	}
});