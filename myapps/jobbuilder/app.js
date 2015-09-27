
Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../../scripts/ext-4.2.2/examples/ux');
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
		'Ext.tree.*',
		'Ext.ux.grid.Printer'
	],
	name: 'Form',
	controllers: ['jobbuilder.MainController','jobbuilder.JobBuilderController','jobbuilder.OrgDevController'],
	appFolder: '../../app',
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.jobbuilder.APIDesc);
	},
	launch: function(){
		console.log('liveboard app launched');
		Ext.create('Ext.container.Viewport', {
		 	title: 'Job Builder',  
		 	
			layout: {
				type: 'fit'
			},
			items: [{
				xtype: 'tabpanel', 
				items: [{
					xtype: 'jobbuilderview',
					tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('jobbuilderview')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
				},{
					xtype: 'orgdevview',
					tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('orgdevview')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
				},{
					xtype: 'orgchartview'
				}]
			}],
			renderTo: Ext.getBody()
		});
	}
});