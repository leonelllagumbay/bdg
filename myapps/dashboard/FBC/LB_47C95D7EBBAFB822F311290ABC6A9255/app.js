
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
			controllers: ['dashboard.FBC.LB_47C95D7EBBAFB822F311290ABC6A9255.Controller','queryoutput.FBC.NS_48F3979CD9E40EA88A5608197A0CFC99.Controller','queryoutput.FBC.NS_48EEEE46C0A6E173B1716BA745E11F06.Controller','queryoutput.FBC.NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD.Controller','queryoutput.FBC.NS_48E960D6B4C224DA34223648BCD0DC2F.Controller','queryoutput.FBC.NS_48E84394A2649D06E1034D98E9CD4A63.Controller','queryoutput.FBC.NS_48E70F48CE38988FAE729C963CBDA61C.Controller','queryoutput.FBC.NS_48E5A919C621E9A46869283C82751148.Controller','queryoutput.FBC.NS_48E36ADAD99F6BDD5FA11E51143C7634.Controller'],
			appFolder: '../../../../app',
			init: function(app) {
				Ext.direct.Manager.addProvider(Ext.LB_47C95D7EBBAFB822F311290ABC6A9255.APIDesc);;
		Ext.direct.Manager.addProvider(Ext.NS_48F3979CD9E40EA88A5608197A0CFC99.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48EEEE46C0A6E173B1716BA745E11F06.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48E960D6B4C224DA34223648BCD0DC2F.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48E84394A2649D06E1034D98E9CD4A63.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48E70F48CE38988FAE729C963CBDA61C.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48E5A919C621E9A46869283C82751148.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48E36ADAD99F6BDD5FA11E51143C7634.APIDesc)
			},
			launch: function(){
				console.log('liveboard app launched');
				Ext.create('Ext.panel.Panel', {
				 	title: 'Liveboard Blue (Chart)',  
				 	
					layout: {
						type: 'table',
						// The total column count must be specified here
				        columns: 3
					},
					items: [{xtype: 'NS_48F3979CD9E40EA88A5608197A0CFC99', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48EEEE46C0A6E173B1716BA745E11F06', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48E960D6B4C224DA34223648BCD0DC2F', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48E84394A2649D06E1034D98E9CD4A63', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48E70F48CE38988FAE729C963CBDA61C', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48E36ADAD99F6BDD5FA11E51143C7634', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48E5A919C621E9A46869283C82751148', rowspan: 1, colspan: 1   }],
					renderTo: Ext.getBody()
				});
			}
		});