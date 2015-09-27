
Ext.define('Form.view.home.loginformchangepwdrequest', {
	extend: 'Ext.form.Panel',
	alias: 'widget.littleloginformchangepwdrequest',
	initComponent: function() {
		
		Ext.apply(Ext.form.field.VTypes, {
			pmatch: function(val, field) {
		    	var origVal = Ext.ComponentQuery.query('textfield[name=newpassword]')[0].getValue();
		    	if(val == origVal) {
		    		return true;
		    	} else {
		    		return false;
		    	}
		   	},
			pmatchText: 'Confirmation text is incorrect.'
		});
		
		 this.items = [{
					xtype: 'hiddenfield',
					fieldLabel: 'User name',
					name: 'username',
					labelAlign: 'top',
					height: 45,
					readOnly: true,
					value: '',
					allowBlank: true,
					padding: 7,
					width: 262
				},{
					xtype: 'textfield',
					fieldLabel: 'Old password hashed',
					name: 'myoldhashedpwd',
					hidden: true,
					labelAlign: 'top',
					height: 45,
					value: ' ',
					allowBlank: true,
					padding: 7,
					width: 262
				},{
					xtype: 'textfield',
					fieldLabel: 'Type your new password',
					name: 'newpassword',
					inputType: 'password',
					labelAlign: 'top',
					height: 45,
					minLength: 1,
					maxLength: 50,
					allowBlank: false,
					padding: 7,
					width: 262
				},{
					xtype: 'textfield',
					fieldLabel: 'Confirm your new password',
					name: 'confirmedpassword',
					inputType: 'password',
					height: 45,
					minLength: 1,
					maxLength: 50,
					labelAlign: 'top',
					allowBlank: false,
					padding: 7,
					width: 262,
					vtype: 'pmatch'
				},{
					xtype: 'displayfield',
					name: 'logindisplaymore',
					id: 'displayrespididrequest',
					autoScroll: true,
					value: '',
					padding: 7,
					width: 262
				}];
		
	this.buttons = [{
					 xtype: 'button',
					 padding: 7,
					 text: 'Sign in',
					 width: '100%',
					 action: 'signin'
				   }];
				   
				   
	
					  
		this.callParent(arguments);
	}
});


