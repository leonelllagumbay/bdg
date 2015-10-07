
Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../../../../scripts/ext-4.2.2/examples/ux');

Ext.application({
	requires: [
				'Ext.container.Viewport',
				'Ext.direct.*',
			    'Ext.data.*',
				'Ext.panel.*',
				'Ext.layout.container.Card',
				'Ext.util.*',
				'Ext.chart.*',
				'Ext.draw.*',
				'Ext.ux.chart.Chart'
			],
	name: 'Form',
	controllers: ['queryoutput.FBC.NS_48F3979CD9E40EA88A5608197A0CFC99.Controller'],
	appFolder: '../../../../app',
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.NS_48F3979CD9E40EA88A5608197A0CFC99.APIDesc);
		GLOBAL_VARS_DIRECT = {
			USERID : 'ADMIN',
			PID : 'PI0',
			FIRSTNAME : 'Admin First Name',
			LASTNAME : 'Admin Last Name',
			MIDDLENAME : 'Admin Middel Name',
			MYMESSAGE : 'MMessage',
			MYPROFILEPIC : '../../../../resource/image/pics201/fbc/noicon.png',
			COMPANYLOGO : '../../../../resource/image/companylogo/banner.png',
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
				xtype: 'NS_48F3979CD9E40EA88A5608197A0CFC99'
			}],
			renderTo: Ext.getBody()

		});
	}
});