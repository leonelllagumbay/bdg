Ext.define('Form.model.administrator.companyListModel', {
	extend: 'Ext.data.Model',
	fields: [{
		name: 'A-COMPANYCODE',
		type: 'string'
	},{
		name: 'A-DESCRIPTION',
		type: 'string'
	},{
		name: 'A-SLOGAN',
		type: 'string'
	},{
		name: 'A-DBMS',
		type: 'string'
	},{
		name: 'A-DBMSVERSION',
		type: 'string'
	},{
		name: 'A-HOMEPAGE',
		type: 'string'
	},{
		name: 'A-COMPANYDEFAULTAPP',
		type: 'string'
	},{
		name: 'A-COMPANYTHEME',
		type: 'string'
	},{
		name: 'A-TEMPLATECODE',
		type: 'string'
	},{
		name: 'A-TEMPLATEDATACODE',
		type: 'string'
	},{
		name: 'A-WEBDOMAIN',
		type: 'string'
	},{
		name: 'A-UNSTRUCDATALOC',
		type: 'string'
	},{
		name: 'A-UNSTRUCTDATAMAP',
		type: 'string'
	},{
		name: 'A-WEBSITEEMAILADD',
		type: 'string'
	},{
		name: 'A-ISACTIVE',
		type: 'string'
	},{
		name: 'A-WITHATTENDANCE',
		type: 'string'
	},{
		name: 'A-WITHATTENDANCELOG',
		type: 'string'
	},{
		name: 'A-LDAPSERVER',
		type: 'string'
	},{
		name: 'A-LDAPPORT',
		type: 'string'
	},{
		name: 'A-LDAPTIMEOUT',
		type: 'int'
	},{
		name: 'A-LDAPSTARTROW',
		type: 'string'
	},{
		name: 'A-LDAPSTART',
		type: 'string'
	},{
		name: 'A-LDAPATTRIBUTES',
		type: 'string'
	},{
		name: 'A-LDAPFILTERCONDITIONS',
		type: 'string'
	},{
		name: 'A-LDAPSORTCONTROL',
		type: 'string'
	},{
		name: 'A-LDAPSEPARATOR',
		type: 'string'
	},{
		name: 'A-LDAPSECURE',
		type: 'string'
	},{
		name: 'A-LDAPSCOPE',
		type: 'string'
	},{
		name: 'A-LDAPRETURNASBINARY',
		type: 'string'
	},{
		name: 'A-LDAPREFERRAL',
		type: 'string'
	},{
		name: 'A-LDAPREBIND',
		type: 'string'
	},{
		name: 'A-LDAPNAME',
		type: 'string'
	},{
		name: 'A-LDAPMAXROWS',
		type: 'int'
	},{
		name: 'A-LDAPFILTER',
		type: 'string'
	},{
		name: 'A-LDAPDN',
		type: 'string'
	},{
		name: 'A-LDAPDELIMITER',
		type: 'string'
	},{
		name: 'A-LDAPSORT',
		type: 'string'
	},{
		name: 'A-MAILSERVER',
		type: 'string'
	},{
		name: 'A-EMAILUSERNAME',
		type: 'string'
	},{
		name: 'A-EMAILPASSWORD',
		type: 'string'
	},{
		name: 'A-EMAILTIMEOUT',
		type: 'int'
	},{
		name: 'A-EMAILPORT',
		type: 'string'
	},{
		name: 'A-EMAILUSETLS',
		type: 'string'
	},{
		name: 'A-EMAILUSESSL',
		type: 'string'
	},{
		name: 'A-EMAILTYPE',
		type: 'string'
	},{
		name: 'A-MOODLELOC',
		type: 'string'
	},{
		name: 'A-OPENMEETINGSLOC',
		type: 'string'
	},{
		name: 'A-EROOMSSERVER',
		type: 'string'
	},{
		name: 'A-XMLPOPMAILPASSWORD',
		type: 'string'
	},{
		name: 'A-XMLPOPMAILSERVER',
		type: 'string'
	},{
		name: 'A-XMLPOPMAILUSERNAME',
		type: 'string'
	},{
		name: 'A-RECDATECREATED',
		type: 'date'
	},{
		name: 'A-DATELASTUPDATE',
		type: 'date'
	},{
		name: 'B-GLOBAL_DSN',
		type: 'string'
	},{
		name: 'B-COMPANY_DSN',
		type: 'string'
	},{
		name: 'B-SUBCO_DSN',
		type: 'string'
	},{
		name: 'B-TRANSACT_DSN',
		type: 'string'
	},{
		name: 'B-QUERY_DSN',
		type: 'string'
	},{
		name: 'B-SITE_DSN',
		type: 'string'
	},{
		name: 'B-VAR_DSN',
		type: 'string'
	},{
		name: 'B-SUBNONCO_DSN',
		type: 'string'
	},{
		name: 'C-ADDRESS',
		type: 'string'
	},{
		name: 'C-BANKACCOUNTNOPBG',
		type: 'string'
	},{
		name: 'C-BANKACCOUNTNOSSS',
		type: 'string'
	},{
		name: 'C-BANKACCOUNTNOWTAX',
		type: 'string'
	},{
		name: 'C-BANKCODEFORPBG',
		type: 'string'
	},{
		name: 'C-BANKCODEFORSSS',
		type: 'string'
	},{
		name: 'C-BANKCODEFORWTAX',
		type: 'string'
	},{
		name: 'C-BUSINESSUNITCODE',
		type: 'string'
	},{
		name: 'C-CITY1',
		type: 'string'
	},{
		name: 'C-CITY2',
		type: 'string'
	},{
		name: 'C-COMPANYORDER',
		type: 'int'
	},{
		name: 'C-COMPANYTAG',
		type: 'string'
	},{
		name: 'C-FAXNUMBER',
		type: 'string'
	},{
		name: 'C-INDUSTRY',
		type: 'string'
	},{
		name: 'C-SSSNUMBER',
		type: 'string'
	},{
		name: 'C-NHIPNUMBER',
		type: 'string'
	},{
		name: 'C-TELNUMBER1',
		type: 'string'
	},{
		name: 'C-TELNUMBER2',
		type: 'string'
	},{
		name: 'C-TELNUMBER3',
		type: 'string'
	},{
		name: 'C-TIN',
		type: 'string'
	},{
		name: 'C-DECLARANTNAME',
		type: 'string'
	},{
		name: 'C-DECLARANTPOSITION',
		type: 'string'
	},{
		name: 'C-RDOCODE',
		type: 'string'
	},{
		name: 'C-ZIPCODE',
		type: 'string'
	},{
		name: 'C-RRTREE',
		type: 'string'
	},{
		name: 'C-SECTIONCODE',
		type: 'string'
	},{
		name: 'C-SSSEDIBRANCHCODE',
		type: 'string'
	},{
		name: 'C-SSSEDILOCCODE',
		type: 'string'
	},{
		name: 'C-DRIVERNAME',
		type: 'string'
	},{
		name: 'C-DATALOCATIONCODE',
		type: 'string'
	},{
		name: 'D-COMPANYLOGO',
		type: 'string'
	},{
		name: 'D-MYIBOSELOGO',
		type: 'string'
	}]
})