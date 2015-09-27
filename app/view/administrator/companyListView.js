Ext.define('Form.view.administrator.companyListView', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.companylistview',
	title: 'Company List',
	width: '100%',
	 
	initComponent: function() {    
	
		this.features = [{
			ftype: 'filters',
			encode: true,
			local: false, 
			filters: [{
				type: 'string',
				dataIndex: 'A-COMPANYCODE'
			}]
		}];
	 
		this.store = 'administrator.companyListStore';
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'administrator.companyListStore', 
				        displayInfo: true,
				        emptyMsg: 'No result to display'
				   });
		this.tbar = [{
		  	text: 'Edit',
			action: 'editcompany'
		},{
		  	text: 'Add',
			action: 'addcompany'
		},{
		  	text: 'Copy',
			action: 'copycompany'
		},{
		  	text: 'Remove',
			action: 'removecompany'
		}];
		  
		this.columns =  [{
            xtype: 'rownumberer',
            width: 50,
            sortable: false
	    },{  
		    text: 'Company Order',
		    dataIndex: 'C-COMPANYORDER',
		    xtype: 'numbercolumn',
		    format: '0',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Company Code',
		    dataIndex: 'A-COMPANYCODE',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Name',
		    dataIndex: 'A-DESCRIPTION',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Slogan',
		    dataIndex: 'A-SLOGAN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Company Email Address',
		    dataIndex: 'A-WEBSITEEMAILADD',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Home Page',
		    dataIndex: 'A-HOMEPAGE',
			hidden: false,
			filterable: true,
		    width: 150
		},{  
		    text: 'CSS For Theme',
		    dataIndex: 'A-COMPANYTHEME',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Is Active',
		    dataIndex: 'A-ISACTIVE',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Company Icon',
		    dataIndex: 'D-MYIBOSELOGO',
			hidden: false,
			filterable: true,
		    width: 150
		},{  
		    text: 'Company Logo',
		    dataIndex: 'D-COMPANYLOGO',
			hidden: false,
			filterable: true,
		    width: 150
		},{  
		    text: 'DBMS',
		    dataIndex: 'A-DBMS',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'DBMS Version',
		    dataIndex: 'A-DBMSVERSION',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Web Domain (with http/s)',
		    dataIndex: 'A-WEBDOMAIN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Template',
		    dataIndex: 'A-TEMPLATECODE',
			hidden: false,
			filterable: true,
		    width: 150
		},{  
		    text: 'Template Data',
		    dataIndex: 'A-TEMPLATEDATACODE',
			hidden: false,
			filterable: true,
		    width: 150
		},{  
		    text: 'Default App',
		    dataIndex: 'A-COMPANYDEFAULTAPP',
			hidden: false,
			filterable: true,
		    width: 150
		},{  
		    text: 'Unstructure Location',
		    dataIndex: 'A-UNSTRUCDATALOC',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Unstructure Mapping',
		    dataIndex: 'A-UNSTRUCTDATAMAP',
			hidden: false,
			filterable: true,
		    width: 150
		},{  
		    text: 'Mail Server',
		    dataIndex: 'A-MAILSERVER',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Mail User Name',
		    dataIndex: 'A-EMAILUSERNAME',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Mail Password',
		    dataIndex: 'A-EMAILPASSWORD',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Mail Connection Timeout(in seconds)',
		    dataIndex: 'A-EMAILTIMEOUT',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Mail Server Port',
		    dataIndex: 'A-EMAILPORT',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Enable TLS connection to mail server',
		    dataIndex: 'A-EMAILUSETLS',
			hidden: false,
			filterable: true,
		    width: 250
		},{  
		    text: 'Enable SSL socket connections to mail server',
		    dataIndex: 'A-EMAILUSESSL',
			hidden: false,
			filterable: true,
		    width: 250
		},{  
		    text: 'LDAP Server',
		    dataIndex: 'A-LDAPSERVER',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'LDAP Port',
		    dataIndex: 'A-LDAPPORT',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Timeout',
		    dataIndex: 'A-LDAPTIMEOUT',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Start Row',
		    dataIndex: 'A-LDAPSTARTROW',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Start',
		    dataIndex: 'A-LDAPSTART',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Attributes',
		    dataIndex: 'A-LDAPATTRIBUTES',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Filter Conditions',
		    dataIndex: 'A-LDAPFILTERCONDITIONS',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Sort Control',
		    dataIndex: 'A-LDAPSORTCONTROL',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Separator',
		    dataIndex: 'A-LDAPSEPARATOR',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Secure',
		    dataIndex: 'A-LDAPSECURE',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Scope',
		    dataIndex: 'A-LDAPSCOPE',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Return as Binary',
		    dataIndex: 'A-LDAPRETURNASBINARY',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Referral',
		    dataIndex: 'A-LDAPREFERRAL',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Rebind',
		    dataIndex: 'A-LDAPREBIND',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Name',
		    dataIndex: 'A-LDAPNAME',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Max Rows',
		    dataIndex: 'A-LDAPMAXROWS',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Filter',
		    dataIndex: 'A-LDAPFILTER',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP DN',
		    dataIndex: 'A-LDAPDN',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Delimiter',
		    dataIndex: 'A-LDAPDELIMITER',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'LDAP Sort',
		    dataIndex: 'A-LDAPSORT',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'Moodle Location',
		    dataIndex: 'A-MOODLELOC',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Open Meetings Location',
		    dataIndex: 'A-OPENMEETINGSLOC',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'eRooms Server',
		    dataIndex: 'A-EROOMSSERVER',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'POP3 Server',
		    dataIndex: 'A-XMLPOPMAILSERVER',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'POP3 User Name',
		    dataIndex: 'A-XMLPOPMAILUSERNAME',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'POP3 Password',
		    dataIndex: 'A-XMLPOPMAILPASSWORD',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'With Attendance',
		    dataIndex: 'A-WITHATTENDANCE',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'With Attendance Log',
		    dataIndex: 'A-WITHATTENDANCELOG',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Global Datasource Name',
		    dataIndex: 'B-GLOBAL_DSN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Company Datasource Name',
		    dataIndex: 'B-COMPANY_DSN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Sub-company Datasource Name',
		    dataIndex: 'B-SUBCO_DSN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Transaction Datasource Name',
		    dataIndex: 'B-TRANSACT_DSN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Query Datasource Name',
		    dataIndex: 'B-QUERY_DSN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Site Datasource Name',
		    dataIndex: 'B-SITE_DSN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Variable Datasource Name',
		    dataIndex: 'B-VAR_DSN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Sub-company Datasource Name (Non confi)',
		    dataIndex: 'B-SUBNONCO_DSN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Company Address',
		    dataIndex: 'C-ADDRESS',
			hidden: false,
			filterable: true,
		    width: 250
		},{  
		    text: 'Company Industry',
		    dataIndex: 'C-INDUSTRY',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Company Telephone Number 1',
		    dataIndex: 'C-TELNUMBER1',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Company Telephone Number 2',
		    dataIndex: 'C-TELNUMBER2',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Company Telephone Number 3',
		    dataIndex: 'C-TELNUMBER3',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Company TIN',
		    dataIndex: 'C-TIN',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Company SSS',
		    dataIndex: 'C-SSSNUMBER',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Company FAX Number',
		    dataIndex: 'C-FAXNUMBER',
			hidden: false,
			filterable: true,
		    width: 150
		}],
		
		this.callParent(arguments);
	}
});