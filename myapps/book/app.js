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
		'book.bookController'
	],
	
	appFolder: '../../app',
	
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.book.APIDesc);	
	},
	
	launch: function() {
		
	console.log('book');
	
	_myAppGlobal = this;	
		Ext.create('Ext.container.Viewport', { 
			layout: {
				type: 'border'
			},
			items: [{
		        title: 'eBooks',
		        region:'west',
		        resizable: true,
		        xtype: 'panel',
		        margins: '5 5 5 5',
		        width: 300,
		        collapsible: true,
		        id: 'west-region-book-title',
		        layout: 'fit',
		        items: [{
		        	xtype: 'bookview'
		        }]
		    },{
		        title: '...',
		        titleAlign: 'center',
		        region: 'center',
		        xtype: 'panel',
		        layout: 'card',
		        margins: '5 0 5 0',
		        id: 'center-region-book-content',
		        items: [{
		        	
		        }]
		    },{
		        title: 'Article or Section',
		        region:'east',
		        xtype: 'panel',
		        margins: '5 10 5 5',
		        width: 330,
		        collapsed: true,
		        collapsible: true,
		        id: 'east-region-book-section',
		        layout: 'fit',
		        items: [{
		        	xtype: 'booksectionview'
		        }]
		    }],
			renderTo: Ext.getBody()
		});
	}
});



