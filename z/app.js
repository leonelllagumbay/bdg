Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../../scripts/extjs/examples/ux');

Ext.application({
	requires: [
		'Ext.container.Viewport',
		'Ext.layout.container.Card',
		'Ext.form.Panel',
		'Ext.window.Window',
		'Ext.form.field.Display',
		'Ext.form.field.Checkbox',
		'Ext.form.field.Text',
		'Ext.util.md5',
		'Ext.util.*',
		'Ext.data.*',
		'Ext.direct.*',
		'Ext.form.field.Checkbox'
	],
	name: 'Form',
	controllers: [
		'home.homecontroller'
	],
	
	appFolder: '../app',
	
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.home.APIDesc);
		
	},
	
	launch: function(){
		
	_myAppGlobal = this;	
		Ext.create('Ext.panel.Panel', { 
			layout: {
				type: 'card'
			},
			items: [
			        
			],
			renderTo: Ext.getBody()
		});
	}
});



