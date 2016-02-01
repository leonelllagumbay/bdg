Ext.define('Ibose.view.content.Content', {
	extend: 'Ext.grid.Panel',
	xtype: 'content',
	
	requires: [
	     'Ibose.view.content.ContentController'
	],
	
	controller: 'nav',
	title: 'Grid Test',
	width: '100%',
    store: 'Ibose.store.main.MainStore',
    columns: [{ 
    	text: 'Name', 
    	flex: 1,
    	dataIndex: 'name' 
    },{ 
    	text: 'Seniority', 
    	flex: 1,
    	dataIndex: 'seniority' 
    }],
    features: [{ftype:'grouping'}]
});