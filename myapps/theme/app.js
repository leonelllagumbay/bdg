Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../../../scripts/extjs/examples/ux');

Ext.application({
	requires: [
		'Ext.container.*',
		'Ext.direct.*',
	    'Ext.data.*',
		'Ext.panel.*',
		'Ext.ux.grid.FiltersFeature',
		'Ext.grid.*',
		'Ext.toolbar.*',
		'Ext.ux.ajax.JsonSimlet',
	    'Ext.ux.ajax.SimManager',
		'Ext.util.*',
		'Ext.grid.*',
		'Ext.form.*',
		'Ext.layout.*',
		'Ext.menu.*',
		'Ext.button.*',
		'Ext.chart.*',
		'Ext.tab.*',
		'Ext.draw.*',
		'Ext.slider.*',
		'Ext.tree.*'
	],
	name: 'Form',
	controllers: [
		'theme.themecontroller'
	],
	
	appFolder: '../../app',
	
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.theme.APIDesc);
	},
	
	launch: function(){
		
	console.log('reminder');
	_myAppGlobal = this;	
		Ext.create('Ext.container.Viewport', { 
			layout: {
				type: 'card'
			},
			items: [{
				xtype: 'themeview' 
			}],
			renderTo: Ext.getBody()
		});
	}
});



