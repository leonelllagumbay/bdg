
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
	controllers: ['queryoutput.FBC.NS_48C5C146D7214EC68A1D29DE42066016.Controller'],
	appFolder: '../../../../app',
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.NS_48C5C146D7214EC68A1D29DE42066016.APIDesc);
		GLOBAL_VARS_DIRECT = {
			USERID : 'ADMIN',
			PID : 'PI0',
			FIRSTNAME : 'Admin First Name',
			LASTNAME : 'Admin Last Name',
			MIDDLENAME : 'Admin Middel Name',
			MYMESSAGE : 'MMessage',
			MYPROFILEPIC : '../../../../resource/image/pics201/fbc/noicon.png',
			COMPANYLOGO : '../../../../resource/image/companylogo/fbclogo.png',
			COMPANYCODE: 'FBC',
			COMPANYNAME: 'Filinvest Baseline Company',
			SITE: 'http://localhost:8500/'
		};
	},
	launch: function(){
		console.log('app launched');
		Ext.create('Ext.container.Viewport', {
			layout: {
				type: 'card'
			},
			items: [{
				xtype: 'NS_48C5C146D7214EC68A1D29DE42066016'
			}],
			renderTo: Ext.getBody()

		});
	}
});