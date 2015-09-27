
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
	controllers: ['queryoutput.FBC.NS_48BE94A2DD9ECDA5486A247307F50D14.Controller'],
	appFolder: '../../../../app',
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.NS_48BE94A2DD9ECDA5486A247307F50D14.APIDesc);
	},
	launch: function(){
		console.log('app launched');
		Ext.create('Ext.container.Viewport', {
			layout: {
				type: 'card'
			},
			items: [{
				xtype: 'NS_48BE94A2DD9ECDA5486A247307F50D14'
			}],
			renderTo: Ext.getBody()

		});
	}
});