
		Ext.Loader.setConfig({enabled: true});
		Ext.Loader.setPath('Ext.ux', '../../../../scripts/ext-4.2.2/examples/ux');
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
			controllers: ['dashboard.FBC.LB_835691A8CDD1D64D9D5D0C9610E59C21.Controller','queryoutput.FBC.NS_7EB34A22FDC309F7646770F411235A84.Controller','queryoutput.FBC.NS_8360E915FF3EF71030FE7A23C731A19C.Controller'],
			appFolder: '../../../../app',
			init: function(app) {
				Ext.direct.Manager.addProvider(Ext.LB_835691A8CDD1D64D9D5D0C9610E59C21.APIDesc);;
		Ext.direct.Manager.addProvider(Ext.NS_7EB34A22FDC309F7646770F411235A84.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_8360E915FF3EF71030FE7A23C731A19C.APIDesc)
			},
			launch: function(){
				console.log('liveboard app launched');
				Ext.create('Ext.panel.Panel', {
				 	title: 'Job Builder',  
				 	
					layout: {
						type: 'table',
						// The total column count must be specified here
				        columns: 1
					},
					items: [{xtype: 'tabpanel', items: [{xtype: 'NS_7EB34A22FDC309F7646770F411235A84',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_7EB34A22FDC309F7646770F411235A84')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_8360E915FF3EF71030FE7A23C731A19C',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_8360E915FF3EF71030FE7A23C731A19C')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}}], rowspan: 1, colspan: 1   }],
					renderTo: Ext.getBody()
				});
			}
		});