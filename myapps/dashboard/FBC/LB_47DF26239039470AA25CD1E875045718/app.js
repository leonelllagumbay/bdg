
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
			controllers: ['dashboard.FBC.LB_47DF26239039470AA25CD1E875045718.Controller','queryoutput.FBC.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Controller','queryoutput.FBC.NS_48E36ADAD99F6BDD5FA11E51143C7634.Controller','queryoutput.FBC.NS_81885B92D0CDC40CB36CDABAA240841E.Controller','queryoutput.FBC.NS_48ABB0BFFB9D56789988D6F49F6E3E35.Controller','queryoutput.FBC.NS_48F3979CD9E40EA88A5608197A0CFC99.Controller','queryoutput.FBC.NS_48BE94A2DD9ECDA5486A247307F50D14.Controller','queryoutput.FBC.NS_48C81A8AD318C16C571F095320D0A3CF.Controller','queryoutput.FBC.NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD.Controller','queryoutput.FBC.NS_48E960D6B4C224DA34223648BCD0DC2F.Controller','queryoutput.FBC.NS_48D56D78AE56BBC908AD2487183EBE46.Controller','queryoutput.FBC.NS_48E70F48CE38988FAE729C963CBDA61C.Controller','queryoutput.FBC.NS_48D7785FC91A7309FDA64C3B4255E270.Controller'],
			appFolder: '../../../../app',
			init: function(app) {
				Ext.direct.Manager.addProvider(Ext.LB_47DF26239039470AA25CD1E875045718.APIDesc);;
		Ext.direct.Manager.addProvider(Ext.NS_48B2EBE0C7002A9E1FF596E5398F02A8.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48E36ADAD99F6BDD5FA11E51143C7634.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_81885B92D0CDC40CB36CDABAA240841E.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48ABB0BFFB9D56789988D6F49F6E3E35.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48F3979CD9E40EA88A5608197A0CFC99.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48BE94A2DD9ECDA5486A247307F50D14.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48C81A8AD318C16C571F095320D0A3CF.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48E960D6B4C224DA34223648BCD0DC2F.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48D56D78AE56BBC908AD2487183EBE46.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48E70F48CE38988FAE729C963CBDA61C.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48D7785FC91A7309FDA64C3B4255E270.APIDesc)
			},
			launch: function(){
				console.log('liveboard app launched');
				Ext.create('Ext.panel.Panel', {
				 	title: 'Combinations',  
				 	
					layout: {
						type: 'table',
						// The total column count must be specified here
				        columns: 4
					},
					items: [{xtype: 'NS_48B2EBE0C7002A9E1FF596E5398F02A8', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48E36ADAD99F6BDD5FA11E51143C7634', rowspan: 1, colspan: 1   
		},{xtype: 'NS_81885B92D0CDC40CB36CDABAA240841E', rowspan: 2, colspan: 2   
		},{xtype: 'NS_48ABB0BFFB9D56789988D6F49F6E3E35', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48F3979CD9E40EA88A5608197A0CFC99', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48BE94A2DD9ECDA5486A247307F50D14', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48C81A8AD318C16C571F095320D0A3CF', rowspan: 1, colspan: 3   
		},{xtype: 'NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD', rowspan: 2, colspan: 2   
		},{xtype: 'NS_48E960D6B4C224DA34223648BCD0DC2F', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48D56D78AE56BBC908AD2487183EBE46', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48D7785FC91A7309FDA64C3B4255E270', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48E70F48CE38988FAE729C963CBDA61C', rowspan: 1, colspan: 1   }],
					renderTo: Ext.getBody()
				});
			}
		});