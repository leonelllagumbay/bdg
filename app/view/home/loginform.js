Ext.define('Form.view.home.loginform', {
	extend: 'Ext.window.Window',
	alias: 'widget.littleloginform',
	id: 'littleloginformid',
	modal: true,
    width: 289,
    minWidth: 288,
    maxWidth: 290,
    minHeight: 300,
    layout: 'vbox',
    padding: 1,
    closable: true,
	
	initComponent: function() {
		
		 this.items = [{
			 xtype: 'form',
			 items: [{
						xtype: 'textfield',
						//fieldLabel: 'User name',
						name: 'username',
						labelAlign: 'top',
						height: 35,
						allowBlank: false,
						padding: 7,
						emptyText: 'username',
						width: 262
					},{
						xtype: 'textfield',
						//fieldLabel: 'Password',
						name: 'password',
						inputType: 'password',
						height: 35,
						minLength: 1,
						maxLength: 50,
						emptyText: 'password', 
						labelAlign: 'top',
						allowBlank: false,
						padding: 7,
						width: 262
					},{
						xtype: 'displayfield',
						name: 'logindisplaymore',
						id: 'displayrespidid',
						autoScroll: true,
						value: '',
						padding: 10,
						width: 270
					},{
						xtype: 'displayfield',
						name: 'loginwithgoogle',
						padding: 7,
						value: '<a href="https://accounts.google.com/o/oauth2/auth?scope=openid email&redirect_uri=http://localhost:8500&response_type=code&client_id=561695249357-7tkuphd99v8q1ao3skn35hjgegb52s1f.apps.googleusercontent.com">Login with Google</a>'
					},{
						xtype: 'checkboxfield',
						fieldLabel: 'Login with LDAP',
						padding: '5 5 5 7',
						name: 'authtype',
						inputValue: 'ldap',
						checked: false
					},{
						xtype: 'displayfield',
						name: 'home',
						padding: 7,
						value: '<a href="./">Home</a>'
					},{
						 xtype: 'button',
						 width: '100%',
						 padding: 7,
						 text: 'Sign in',
						 action: 'signin'
					}]
		     }];
		
			  
		this.callParent(arguments);
	}
});