Ext.define('Form.view.administrator.userDetailView', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.userdetailview',
	title: 'User Details',
	titleAlign: 'center',
	buttonAlign: 'center',
	width: '100%', 
	height: '100%',
	autoScroll: true,
	initComponent: function() {   
		this.tbar = [{
		  	text: 'Back',
			action: 'backtouserlist'
		}];
		this.defaults = {
			xtype: 'textfield',
			labelWidth: 150,
			padding: '7 7 7 100',
			width: 450
		};
		
		this.items = [{
			fieldLabel: 'Action',
			name: 'USERACTION',
			readOnly: true
		},{
			fieldLabel: 'Is Active',
			name: 'B-ISACTIVE',
			maxLength: 5,
			value: 'true'
		},{
			fieldLabel: 'Account is disabled',
			name: 'A-DISABLEACCOUNT',
			maxLength: 1,
			value: false
		},{
			fieldLabel: 'User ID',
			name: 'A-USERID',
			maxLength: 50,
			allowBlank: false
		},{
			fieldLabel: 'Personnel ID',
			name: 'C-PERSONNELIDNO',
			maxLength: 50,
			allowBlank: false
		},{
			fieldLabel: 'Salutation',
			name: 'B-SALUTATION',
			maxLength: 10
		},{
			fieldLabel: 'First name',
			name: 'B-FIRSTNAME',
			maxLength: 30,
			allowBlank: false
		},{
			fieldLabel: 'Middle name',
			name: 'B-MIDDLENAME',
			maxLength: 30,
		},{
			fieldLabel: 'Last name',
			name: 'B-LASTNAME',
			maxLength: 30,
			allowBlank: false
		},{
			fieldLabel: 'Company code',
			name: 'B-COMPANYCODE',
			maxLength: 50,
			allowBlank: false
		},{
			fieldLabel: 'Sub-company code',
			name: 'B-SUBCOMPANYCODE',
			maxLength: 50,
			allowBlank: false
		},{
			fieldLabel: 'User type',
			name: 'A-USERTYPE',
			maxLength: 25,
			allowBlank: false
		},{
			fieldLabel: 'Email profile name',
			name: 'A-PROFILENAME',
			maxLength: 200,
			allowBlank: false
		},{
			fieldLabel: 'Global user ID',
			name: 'A-GUID',
			maxLength: 50,
			allowBlank: false
		},{
			fieldLabel: 'Max eFile drive size (Kb)',
			name: 'A-MAXDRIVESIZE',
			allowBlank: false,
			xtype: 'numberfield',
			maxValue: 99999999,
			value: '70000'
		},{
			fieldLabel: 'User password',
			name: 'A-PASSWORD',
			maxLength: 50,
			inputType: 'password',
			allowBlank: false
		},{
			fieldLabel: 'Password reference date',
			name: 'A-DATEPASSWORD',
			xtype: 'datefield',
			allowBlank: false
		},{
			fieldLabel: 'Question',
			name: 'A-PASSQUESTION',
			maxLength: 50,
			value: 'What is the name of your company?'
		},{
			fieldLabel: 'Answer',
			maxLength: 50,
			inputType: 'password',
			name: 'A-PASSANSWER'
		},{
			fieldLabel: 'User must change password at next logon',
			name: 'A-CHANGEPWDNEXTLOGON',
			maxLength: 5,
			allowBlank: false,
			value: false
		},{
			fieldLabel: 'Is able to change password',
			name: 'A-CANNOTCHANGEPWD',
			maxLength: 5,
			hidden: true
		},{
			fieldLabel: 'Password never expires',
			name: 'A-PWDNEVEREXPIRES',
			maxLength: 5,
			allowBlank: false,
			value: false
		},{
			fieldLabel: 'Reset using',
			name: 'A-USERCANRESETUSING',
			maxLength: 50,
			hidden: true
		},{
			fieldLabel: 'Maximum password age',
			name: 'A-MAXPASSWORDAGE',
			allowBlank: false,
			maxLength: 15,
			value: '60:00:00:00'
		},{
			fieldLabel: 'Minimum password age',
			name: 'A-MINPASSWORDAGE',
			allowBlank: false,
			maxLength: 15,
			value: '00:01:00:00'
		},{
			fieldLabel: 'Minimum password length',
			name: 'A-MINPASSWORDLENGTH',
			allowBlank: false,
			xtype: 'numberfield',
			maxValue: '50',
			minValue: '3',
			value: 5
		},{
			fieldLabel: 'Password must meet complexity requirements',
			name: 'A-PWDMUSTMEETCOMPLEXITY',
			allowBlank: false,
			maxLength: 5,
			value: false
		},{
			fieldLabel: 'Account lockout duration',
			name: 'A-ACCOUNTLOCKOUTDURATION',
			allowBlank: false,
			value: '00:00:30:00'
		},{
			fieldLabel: 'Account lockout threshhold',
			name: 'A-ACCOUNTLOCKOUTTHRESHHOLD',
			allowBlank: false,
			xtype: 'numberfield',
			maxValue: 9999,
			value: 7
		},{
			fieldLabel: 'Reset account lockout counter after',
			name: 'A-RESETACCOUNTLOCKOUTCOUNTERAFTER',
			value: '00:00:30:00'
		},{
			fieldLabel: 'Reset password',
			name: 'A-RESETPASSWORD',
			hidden: true
		},{
			fieldLabel: 'Set new password',
			name: 'A-SETNEWPASSWORD',
			hidden: true
		},{
			fieldLabel: 'Password count failed attempt',
			name: 'A-PWDCOUNTFAILEDATTEMPT',
			xtype: 'numberfield',
			maxValue: 9999,
			hidden: false
		},{
			fieldLabel: 'Date last failed attempt',
			name: 'A-DATELASTFAILEDATTEMPT',
			xtype: 'datefield',
			hidden: false
		},{
			fieldLabel: 'Gmail (for google login)',
			name: 'A-GOOGLEEMAIL',
			maxLength: 150
		},{
			fieldLabel: 'Date last update',
			name: 'A-DATELASTUPDATE',
			xtype: 'datefield',
			hidden: true
		},{
			fieldLabel: 'Record date created',
			name: 'A-RECDATECREATED',
			xtype: 'datefield',
			hidden: true
		},{
			fieldLabel: 'Default App',
			name: 'A-DEFAULTAPPID',
			hidden: false
		},{
			fieldLabel: 'Number of error logins',
			name: 'A-NOOFERRLOGINS',
			xtype: 'numberfield',
			hidden: true
		},{
			fieldLabel: 'Number of login',
			name: 'A-NOOFLOGIN',
			xtype: 'numberfield',
			hidden: true
		},{
			fieldLabel: 'Alternate Approver',
			name: 'A-ALTERNATEAPPROVER',
			hidden: true
		},{
			fieldLabel: 'Login Counter',
			name: 'A-LOGINCOUNTER',
			xtype: 'numberfield',
			hidden: true
		},{
			fieldLabel: 'Old password',
			name: 'A-OLDPASSWORD',
			hidden: true
		},{
			fieldLabel: 'Is logged in',
			name: 'A-ISLOGGEDIN',
			hidden: true
		},{
			fieldLabel: 'AD user name',
			name: 'A-ADUSERNAME',
			hidden: true
		},{
			fieldLabel: 'Nick Name',
			name: 'B-NICKNAME',
			maxLength: 30
		},{
			fieldLabel: 'Suffix',
			name: 'B-SUFFIX',
			maxLength: 30
		},{
			fieldLabel: 'PAGIBIG',
			name: 'B-PAGIBIGNUMBER',
			maxLength: 15,
			hidden: true
		},{
			fieldLabel: 'SSS',
			name: 'B-SSSNUMBER',
			maxLength: 15,
			hidden: true
		},{
			fieldLabel: 'TIN',
			name: 'B-TIN',
			maxLength: 15,
			hidden: true
		},{
			fieldLabel: 'Record created by',
			name: 'B-RECCREATEDBY',
			maxLength: 20,
			hidden: true
		},{
			fieldLabel: 'Record date created',
			name: 'B-RECDATECREATED',
			xtype: 'datefield',
			hidden: true
		},{
			fieldLabel: 'Date last update',
			name: 'B-DATELASTUPDATE',
			xtype: 'datefield',
			hidden: true
		},{
			fieldLabel: 'Mobile Number',
			maxLength: 15,
			name: 'B-HOTLINECELLPHONE'
		},{
			fieldLabel: 'Telephone number',
			maxLength: 15,
			name: 'B-HOTLINEPHONE'
		},{
			fieldLabel: 'Memo',
			name: 'B-MEMO'
		},{
			fieldLabel: 'Is Visible',
			name: 'C-ISVISIBLE',
			maxLength: 5,
			value: 'Y'
		},{
			fieldLabel: 'Personal Theme',
			name: 'C-MYTHEME',
			maxLength: 50
		},{
			fieldLabel: 'My Message',
			name: 'C-MYMESSAGE',
			maxLength: 400
		},{
			fieldLabel: 'Default personal theme',
			name: 'C-DEFAULTTHEME',
			maxLength: 50,
			hidden: true
		},{
			fieldLabel: 'My Signature',
			name: 'C-SIGNATURE',
			maxLength: 600
		},{
			fieldLabel: 'My Picture',
			name: 'C-AVATAR',
			value: 'noicon.png',
			maxLength: 600
		}];
		
		this.api = {
				submit: Ext.administrator.User.SubmitUser
		};
		
		this.paramOrder = ['A-USERID'];
		
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