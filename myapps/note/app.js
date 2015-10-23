Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../../../scripts/ext-4.2.2/examples/ux');

Ext.application({
	requires: [
		'Ext.container.Viewport',
		'Ext.direct.*',
	    'Ext.data.*',
		'Ext.panel.*',
		'Ext.layout.container.Card',
		'Ext.ux.grid.FiltersFeature',
		'Ext.toolbar.Paging',
		'Ext.ux.ajax.JsonSimlet',
	    'Ext.ux.ajax.SimManager',
		'Ext.util.*',
		'Ext.grid.*'
	],
	name: 'Form',
	controllers: [
		'note.noteController'
	],
	
	appFolder: '../../app',
	
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.note.APIDesc);	
	},
	
	launch: function() {
		
	console.log('note');
	
	_myAppGlobal = this;	
		Ext.create('Ext.container.Viewport', { 
			layout: {
				type: 'border'
			},
			items: [{
		        title: 'eNotes',
		        region:'west',
		        resizable: true,
		        xtype: 'tabpanel',
		        margins: '5 5 5 5',
		        width: 300,
		        collapsible: true,
		        id: 'west-region-note-title',
		        layout: 'fit',
		        items: [{
		        	xtype: 'noteview'
		        },{
		        	xtype: 'noteshareview'
		        }]
		    },{
		        title: '...',
		        titleAlign: 'center',
		        region: 'center',
		        xtype: 'panel',
		        layout: 'fit',
		        margins: '5 0 5 0',
		        id: 'center-region-note-content',
		        items: [{
		        	id: 'notecontent',
		        	html: '<b></b>',
		        	padding: 8
		        }]
		    }],
			renderTo: Ext.getBody()
		});
	}
});



