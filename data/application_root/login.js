Ext.application({
	requires: [
	           'Ext.container.Viewport',
	           'Ext.util.md5',
	           'Ext.form.field.Checkbox'

	],
	name: 'Form',
	controllers: [
		'main.login'
	],
	
	appFolder: 'app',
	
	launch: function(){
		Ext.create('Ext.container.Viewport', {
			layout: {
				type: 'vbox',
				align: 'center'
			},
			items: [{
				flex: 2,
				xtype: 'container'
			},{
				xtype: 'littleloginform'
			},{
				flex: 2,
				xtype: 'container'
			}]
		
		});
	}
	
});


