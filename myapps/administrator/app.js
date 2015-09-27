Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../../scripts/extjs/examples/ux');

Ext.application({
	requires: [
		'Ext.container.Viewport',
		'Ext.direct.*',
		'Ext.form.action.DirectSubmit',
	    'Ext.data.*',
		'Ext.panel.*',
		'Ext.tab.Panel',
		'Ext.layout.container.Card',
		'Ext.ux.grid.FiltersFeature',
		'Ext.toolbar.Paging',
		'Ext.ux.ajax.JsonSimlet',
	    'Ext.ux.ajax.SimManager',
		'Ext.util.*',
		'Ext.grid.*',
		'Ext.data.*',
		'Ext.layout.container.Form',
		'Ext.selection.CheckboxModel'
	],
	name: 'Form',
	controllers: [
		'administrator.administratorcontroller'
	],
	
	appFolder: '../../app',
	
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.administrator.APIDesc);
		Ext.direct.Manager.addProvider(Ext.ss.APIDesc);
		Ext.direct.Manager.addProvider(Ext.ibose.APIDesc);
	},
	
	launch: function() {
		
	console.log('administrator');
	
	_myAppGlobal = this;	
		Ext.create('Ext.container.Viewport', { 
			layout: {
				type: 'card'
			},
			items: [{
				xtype: 'tabpanel',
				items: [{
					title: 'Company',
					layout: {
						type: 'card'
					},
					items: [{
						xtype: 'companylistview',
						title: 'Company List'
					},{
						xtype: 'companydetailview',
						title: 'Company Details'
					}]
				},{
					title: 'User',
					layout: {
						type: 'card'
					},
					items: [{
						xtype: 'userlistview',
						title: 'User List'
					},{
						xtype: 'userdetailview',
						title: 'User Details'
					}]
				},{
					title: 'User Role',
					layout: {
						type: 'card'
					},
					items: [{
						xtype: 'userrolelistview',
						title: 'Role List'
					},{
						xtype: 'userroledetailview',
						title: 'Role Details'
					}]
				},{
					title: 'User App',
					layout: {
						type: 'card'
					},
					items: [{
						xtype: 'userapplistview',
						title: 'App List'
					}]
				},{
					title: 'User Menu',
					layout: {
						type: 'card'
					},
					items: [{
						xtype: 'usermenulistview',
						title: 'Menu List'
					}]
				},{
					title: 'General',
					hidden: true,
					layout: {
						type: 'card'
					},
					items: [{
						xtype: 'generalview',
						title: 'Forms for general'
					}]
				},{
					title: 'Organization',
					hidden: true,
					layout: {
						type: 'card'
					},
					items: [{
						xtype: 'organizationlistview',
						title: 'Organization List'
					},{
						xtype: 'organizationdetailview',
						title: 'Organization Details'
					}]
				}]
			}],
			renderTo: Ext.getBody()
		});
	}
});



