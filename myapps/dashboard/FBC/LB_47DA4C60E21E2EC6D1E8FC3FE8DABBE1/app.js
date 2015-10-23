
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
			controllers: ['dashboard.FBC.LB_47DA4C60E21E2EC6D1E8FC3FE8DABBE1.Controller','queryoutput.FBC.NS_81885B92D0CDC40CB36CDABAA240841E.Controller','queryoutput.FBC.NS_48ABB0BFFB9D56789988D6F49F6E3E35.Controller'],
			appFolder: '../../../../app',
			init: function(app) {
				Ext.direct.Manager.addProvider(Ext.LB_47DA4C60E21E2EC6D1E8FC3FE8DABBE1.APIDesc);;
		Ext.direct.Manager.addProvider(Ext.NS_81885B92D0CDC40CB36CDABAA240841E.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48ABB0BFFB9D56789988D6F49F6E3E35.APIDesc)
			},
			launch: function(){
				console.log('liveboard app launched');
				Ext.create('Ext.panel.Panel', {
				 	title: 'From other sources',  
				 	
					layout: {
						type: 'table',
						// The total column count must be specified here
				        columns: 3
					},
					items: [{xtype: 'NS_48ABB0BFFB9D56789988D6F49F6E3E35', rowspan: 1, colspan: 1   
		},{xtype: 'NS_81885B92D0CDC40CB36CDABAA240841E', rowspan: 1, colspan: 1   }],
					renderTo: Ext.getBody()
				});
			}
		});