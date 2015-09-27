
Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../../../../scripts/extjs/examples/ux');

Ext.application({
	requires: [
			'Ext.container.Viewport',
			'Ext.direct.*',
		    'Ext.data.*',
			'Ext.panel.*',
			'Ext.layout.container.Card',
			'Ext.ux.grid.FiltersFeature',
			'Ext.grid.plugin.BufferedRenderer',
			'Ext.toolbar.Paging',
			'Ext.ux.ajax.JsonSimlet',
		    'Ext.ux.ajax.SimManager',
			'Ext.util.*',
			'Ext.grid.*',
			'Ext.form.*',
			'Ext.layout.container.Form'
		],
	name: 'Form',
	controllers: ['queryoutput.FBC.NS_48D7785FC91A7309FDA64C3B4255E270.Controller'],
	appFolder: '../../../../app',
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.NS_48D7785FC91A7309FDA64C3B4255E270.APIDesc);
	},
	launch: function(){
		console.log('app launched');
		Ext.create('Ext.container.Viewport', {
			layout: {
				type: 'card'
			},
			items: [{
				xtype: 'NS_48D7785FC91A7309FDA64C3B4255E270'
			}],
			renderTo: Ext.getBody()

		});
	}
});