Ext.define('Form.view.administrator.userListView', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.userlistview',
	title: 'User List',
	width: '100%',
	
	initComponent: function() {    
	
		this.features = [{
			ftype: 'filters',
			encode: true,
			local: false
		}];
	 
		this.store = 'administrator.userListStore';
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'administrator.userListStore', 
				        displayInfo: true,
				        emptyMsg: 'No result to display'
				   });
		this.tbar = [{
		  	text: 'Edit',
			action: 'edituser'
		},{
		  	text: 'Add',
			action: 'adduser'
		},{
		  	text: 'Copy',
			action: 'copyuser'
		},{
		  	text: 'Remove',
			action: 'removeuser'
		},{
			text: 'Insert multiple user',
			action: 'insertmultipleuser'
		}];
		  
		this.columns =  [{
            xtype: 'rownumberer',
            width: 50,
            sortable: false
	    },{  
		    text: 'Company Code',
		    dataIndex: 'B-COMPANYCODE',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Is Active',
		    dataIndex: 'B-ISACTIVE',
			hidden: false,
			filterable: true,
		    width: 80
		},{  
		    text: 'Disabled',
		    dataIndex: 'A-DISABLEACCOUNT',
			hidden: false,
			filterable: true,
		    width: 80
		},{  
		    text: 'User ID',
		    dataIndex: 'A-USERID',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Personnel ID',
		    dataIndex: 'C-PERSONNELIDNO',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Salutation',
		    dataIndex: 'B-SALUTATION',
			hidden: false,
			sortable: true,
			filterable: true,
		    width: 80
		},{  
		    text: 'First name',
		    dataIndex: 'B-FIRSTNAME',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Middle name',
		    dataIndex: 'B-MIDDLENAME',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Last name',
		    dataIndex: 'B-LASTNAME',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Sub-company code',
		    dataIndex: 'B-SUBCOMPANYCODE',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'User type',
		    dataIndex: 'A-USERTYPE',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Email profile name',
		    dataIndex: 'A-PROFILENAME',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Global user ID',
		    dataIndex: 'A-GUID',
			hidden: false,
			filterable: true,
		    width: 100
		},{  
		    text: 'Max eFile drive size (Kb)',
		    dataIndex: 'A-MAXDRIVESIZE',
			hidden: false,
			xtype: 'numbercolumn',
			format: '0',
			filterable: true,
		    width: 200
		},{  
		    text: 'User password',
		    dataIndex: 'A-PASSWORD',
			hidden: true,
			filterable: true,
		    width: 150
		},{  
		    text: 'Password reference date',
		    dataIndex: 'A-DATEPASSWORD',
		    xtype: 'datecolumn',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Question',
		    dataIndex: 'A-PASSQUESTION',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Answer',
		    dataIndex: 'A-PASSANSWER',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'User must change password at next logon',
		    dataIndex: 'A-CHANGEPWDNEXTLOGON',
			hidden: false,
			filterable: true,
		    width: 250
		},{  
		    text: 'Is able to change password',
		    dataIndex: 'A-CANNOTCHANGEPWD',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Password never expires',
		    dataIndex: 'A-PWDNEVEREXPIRES',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Reset using',
		    dataIndex: 'A-USERCANRESETUSING',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Maximum password age',
		    dataIndex: 'A-MAXPASSWORDAGE',
			hidden: false,
			filterable: true,
		    width: 150
		},{  
		    text: 'Minimum password age',
		    dataIndex: 'A-MINPASSWORDAGE',
			hidden: false,
			filterable: true,
		    width: 150
		},{  
		    text: 'Minimum password length',
		    dataIndex: 'A-MINPASSWORDLENGTH',
			hidden: false,
			xtype: 'numbercolumn',
			format: '0',
			filterable: true,
		    width: 200
		},{  
		    text: 'Password must meet complexity requirements',
		    dataIndex: 'A-PWDMUSTMEETCOMPLEXITY',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Account lockout duration',
		    dataIndex: 'A-ACCOUNTLOCKOUTDURATION',
			hidden: false,
			filterable: true,
			width: 200
		},{  
		    text: 'Account lockout threshhold',
		    dataIndex: 'A-ACCOUNTLOCKOUTTHRESHHOLD',
		    xtype: 'numbercolumn',
		    format: '0',
			hidden: false,
			filterable: true,
			width: 200
		},{  
		    text: 'Reset account lockout counter after',
		    dataIndex: 'A-RESETACCOUNTLOCKOUTCOUNTERAFTER',
			hidden: false,
			filterable: true,
			width: 200
		},{  
		    text: 'Reset password',
		    dataIndex: 'A-RESETPASSWORD',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'Set new password',
		    dataIndex: 'A-SETNEWPASSWORD',
			hidden: true,
			filterable: true,
		    width: 100
		},{  
		    text: 'Password count failed attempt',
		    dataIndex: 'A-PWDCOUNTFAILEDATTEMPT',
			hidden: true,
			xtype: 'numbercolumn',
			format: '0',
			filterable: true,
		    width: 200
		},{  
		    text: 'Date last failed attempt',
		    dataIndex: 'A-DATELASTFAILEDATTEMPT',
			hidden: true,
			xtype: 'datecolumn',
			filterable: true,
		    width: 200
		},{  
		    text: 'Gmail (for google login)',
		    dataIndex: 'A-GOOGLEEMAIL',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Date last update',
		    dataIndex: 'A-DATELASTUPDATE',
			hidden: true,
			xtype: 'datecolumn',
			sortable: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Record date created',
		    dataIndex: 'A-RECDATECREATED',
			hidden: true,
			xtype: 'datecolumn',
			filterable: true,
		    width: 200
		},{  
		    text: 'Default App',
		    dataIndex: 'A-DEFAULTAPPID',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Number of error logins',
		    dataIndex: 'A-NOOFERRLOGINS',
		    xtype: 'numbercolumn',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Number of login',
		    dataIndex: 'A-NOOFLOGIN',
		    xtype: 'numbercolumn',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Alternate Approver',
		    dataIndex: 'A-ALTERNATEAPPROVER',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Login Counter',
		    dataIndex: 'A-LOGINCOUNTER',
		    xtype: 'numbercolumn',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Old password',
		    dataIndex: 'A-OLDPASSWORD',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Is logged in',
		    dataIndex: 'A-ISLOGGEDIN',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'AD user name',
		    dataIndex: 'A-ADUSERNAME',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Nick Name',
		    dataIndex: 'B-NICKNAME',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Suffix',
		    dataIndex: 'B-SUFFIX',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'PAGIBIG',
		    dataIndex: 'B-PAGIBIGNUMBER',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'SSS',
		    dataIndex: 'B-SSSNUMBER',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'TIN',
		    dataIndex: 'B-TIN',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Record created by',
		    dataIndex: 'B-RECCREATEDBY',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Record date created',
		    dataIndex: 'B-RECDATECREATED',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Date last update',
		    dataIndex: 'B-DATELASTUPDATE',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'Mobile Number',
		    dataIndex: 'B-HOTLINECELLPHONE',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Telephone number',
		    dataIndex: 'B-HOTLINEPHONE',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Memo',
		    dataIndex: 'B-MEMO',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Is Visible',
		    dataIndex: 'C-ISVISIBLE',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Personal Theme',
		    dataIndex: 'C-MYTHEME',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'My Message',
		    dataIndex: 'C-MYMESSAGE',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'Default personal theme',
		    dataIndex: 'C-DEFAULTTHEME',
			hidden: true,
			filterable: true,
		    width: 200
		},{  
		    text: 'My Signature',
		    dataIndex: 'C-SIGNATURE',
			hidden: false,
			filterable: true,
		    width: 200
		},{  
		    text: 'My Picture',
		    dataIndex: 'C-AVATAR',
			hidden: false,
			filterable: true,
		    width: 200
		}],
		
		this.callParent(arguments);
	}
});