
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
			controllers: ['dashboard.FBC.LB_47819023E09D8001CA86F5D183B3ADA8.Controller','queryoutput.FBC.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Controller','queryoutput.FBC.NS_48B7EFC5ED0D4E15A39C26B46682103C.Controller','queryoutput.FBC.NS_48BE94A2DD9ECDA5486A247307F50D14.Controller','queryoutput.FBC.NS_48C5C146D7214EC68A1D29DE42066016.Controller','queryoutput.FBC.NS_48C81A8AD318C16C571F095320D0A3CF.Controller','queryoutput.FBC.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.Controller','queryoutput.FBC.NS_48CC09B3FAFB581153784CDEFB17F719.Controller','queryoutput.FBC.NS_48CE9210F7788560FFBD7697C62E54F8.Controller','queryoutput.FBC.NS_48D56D78AE56BBC908AD2487183EBE46.Controller','queryoutput.FBC.NS_48D7785FC91A7309FDA64C3B4255E270.Controller'],
			appFolder: '../../../../app',
			init: function(app) {
				Ext.direct.Manager.addProvider(Ext.LB_47819023E09D8001CA86F5D183B3ADA8.APIDesc);;
		Ext.direct.Manager.addProvider(Ext.NS_48B2EBE0C7002A9E1FF596E5398F02A8.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48B7EFC5ED0D4E15A39C26B46682103C.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48BE94A2DD9ECDA5486A247307F50D14.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48C5C146D7214EC68A1D29DE42066016.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48C81A8AD318C16C571F095320D0A3CF.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48CC09B3FAFB581153784CDEFB17F719.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48CE9210F7788560FFBD7697C62E54F8.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48D56D78AE56BBC908AD2487183EBE46.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48D7785FC91A7309FDA64C3B4255E270.APIDesc)
			},
			launch: function(){
				console.log('liveboard app launched');
				Ext.create('Ext.panel.Panel', {
				 	title: 'Tabular',  
				 	
					layout: {
						type: 'table',
						// The total column count must be specified here
				        columns: 3
					},
					items: [{xtype: 'NS_48B2EBE0C7002A9E1FF596E5398F02A8', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48B7EFC5ED0D4E15A39C26B46682103C', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48BE94A2DD9ECDA5486A247307F50D14', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48C5C146D7214EC68A1D29DE42066016', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48C81A8AD318C16C571F095320D0A3CF', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48C9ECD6A7DA0635AC7384C754FAD8CD', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48CC09B3FAFB581153784CDEFB17F719', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48CE9210F7788560FFBD7697C62E54F8', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48D7785FC91A7309FDA64C3B4255E270', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48D56D78AE56BBC908AD2487183EBE46', rowspan: 1, colspan: 1   }],
					renderTo: Ext.getBody()
				});
			}
		});