Ext.define('Form.model.administrator.userListModel', {
	extend: 'Ext.data.Model',
	fields: [{
		name: 'A-USERID',
		type: 'string'
	},{
		name: 'A-USERTYPE',
		type: 'string'
	},{
		name: 'A-PASSWORD',
		type: 'string'
	},{
		name: 'A-DATEPASSWORD',
		type: 'date'
	},{
		name: 'A-PASSQUESTION',
		type: 'string'
	},{
		name: 'A-PASSANSWER',
		type: 'string'
	},{
		name: 'A-CHANGEPWDNEXTLOGON',
		type: 'string'
	},{
		name: 'A-CANNOTCHANGEPWD',
		type: 'string'
	},{
		name: 'A-PWDNEVEREXPIRES',
		type: 'string'
	},{
		name: 'A-USERCANRESETUSING',
		type: 'string'
	},{
		name: 'A-MAXPASSWORDAGE',
		type: 'string'
	},{
		name: 'A-MINPASSWORDAGE',
		type: 'string'
	},{
		name: 'A-MINPASSWORDLENGTH',
		type: 'int'
	},{
		name: 'A-PWDMUSTMEETCOMPLEXITY',
		type: 'string'
	},{
		name: 'A-ACCOUNTLOCKOUTDURATION',
		type: 'string'
	},{
		name: 'A-ACCOUNTLOCKOUTTHRESHHOLD',
		type: 'int'
	},{
		name: 'A-RESETACCOUNTLOCKOUTCOUNTERAFTER',
		type: 'string'
	},{
		name: 'A-PROFILENAME',
		type: 'string'
	},{
		name: 'A-DEFAULTAPPID',
		type: 'string'
	},{
		name: 'A-LOGINCOUNTER',
		type: 'int'
	},{
		name: 'A-OLDPASSWORD',
		type: 'string'
	},{
		name: 'A-RESETPASSWORD',
		type: 'string'
	},{
		name: 'A-ALTERNATEAPPROVER',
		type: 'string'
	},{
		name: 'A-NOOFLOGIN',
		type: 'int'
	},{
		name: 'A-DISABLEACCOUNT',
		type: 'string'
	},{
		name: 'A-NOOFERRLOGINS',
		type: 'int'
	},{
		name: 'A-SETNEWPASSWORD',
		type: 'string'
	},{
		name: 'A-ADUSERNAME',
		type: 'string'
	},{
		name: 'A-ISLOGGEDIN',
		type: 'string'
	},{
		name: 'A-PWDCOUNTFAILEDATTEMPT',
		type: 'int'
	},{
		name: 'A-DATELASTFAILEDATTEMPT',
		type: 'date'
	},{
		name: 'A-GOOGLEEMAIL',
		type: 'string'
	},{
		name: 'A-DATELASTUPDATE',
		type: 'date'
	},{
		name: 'A-RECDATECREATED',
		type: 'date'
	},{
		name: 'A-GUID',
		type: 'string'
	},{
		name: 'A-MAXDRIVESIZE',
		type: 'int'
	},{
		name: 'B-SALUTATION',
		type: 'string'
	},{
		name: 'B-FIRSTNAME',
		type: 'string'
	},{
		name: 'B-MIDDLENAME',
		type: 'string'
	},{
		name: 'B-LASTNAME',
		type: 'string'
	},{
		name: 'B-NICKNAME',
		type: 'string'
	},{
		name: 'B-SUFFIX',
		type: 'string'
	},{
		name: 'B-PAGIBIGNUMBER',
		type: 'string'
	},{
		name: 'B-SSSNUMBER',
		type: 'string'
	},{
		name: 'B-TIN',
		type: 'string'
	},{
		name: 'B-RECCREATEDBY',
		type: 'string'
	},{
		name: 'B-RECDATECREATED',
		type: 'string'
	},{
		name: 'B-DATELASTUPDATE',
		type: 'string'
	},{
		name: 'B-HOTLINE',
		type: 'string'
	},{
		name: 'B-HOTLINEPHONE',
		type: 'string'
	},{
		name: 'B-COMPANYCODE',
		type: 'string'
	},{
		name: 'B-SUBCOMPANYCODE',
		type: 'string'
	},{
		name: 'B-ATTACHMENTCODE',
		type: 'string'
	},{
		name: 'B-HOTLINEPAGER',
		type: 'string'
	},{
		name: 'B-HOTLINECELLPHONE',
		type: 'string'
	},{
		name: 'B-HOTLINEFAX',
		type: 'string'
	},{
		name: 'B-HOTLINEEMAIL',
		type: 'string'
	},{
		name: 'B-MEMO',
		type: 'string'
	},{
		name: 'B-ISACTIVE',
		type: 'string'
	},{
		name: 'C-ISVISIBLE',
		type: 'string'
	},{
		name: 'C-PERSONNELIDNO',
		type: 'string'
	},{
		name: 'C-MYTHEME',
		type: 'string'
	},{
		name: 'C-MYMESSAGE',
		type: 'string'
	},{
		name: 'C-DEFAULTTHEME',
		type: 'string'
	},{
		name: 'C-SIGNATURE',
		type: 'string'
	},{
		name: 'C-AVATAR',
		type: 'string'
	}]
})