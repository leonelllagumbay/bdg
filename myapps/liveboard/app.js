Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../../scripts/extjs/examples/ux');

Ext.application({
	requires: [
		'Ext.container.Viewport',
		'Ext.direct.*',
	    'Ext.data.*',
	    'Ext.util.*',
		'Ext.panel.*',
		'Ext.layout.*',
		'Ext.toolbar.*',
		'Ext.ux.grid.FiltersFeature',
		'Ext.grid.plugin.*',
		'Ext.ux.ajax.JsonSimlet',
	    'Ext.ux.ajax.SimManager',
		'Ext.button.*',
		'Ext.grid.*',
		'Ext.form.*',
		'Ext.chart.*',
		'Ext.dd.*',
		'Ext.picker.*',
		'Ext.resizer.*',
		'Ext.menu.*',
		'Ext.state.*',
		'Ext.tree.*'
	],
	name: 'Form',
	controllers: [
		'liveboard.liveboardcontroller'
	],
	
	appFolder: '../../app',
	
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.liveboard.APIDesc);
		
	},
	
	launch: function(){
		
	_myAppGlobal = this;	
		Ext.create('Ext.container.Viewport', { 
			layout: {
				type: 'card'
			},
			items: [{
				xtype: 'liveboardlistview'
			},{
				xtype: 'liveboardlistdetailview'
			},{
				xtype: 'liveboarditemview'
			},{
				xtype: 'liveboarditemdetailview'
			}],
			renderTo: Ext.getBody()
		});
	}
});



