Ext.application({
	name: 'Ibose',
	stores: [
	         // TODO: add global / shared stores here
	       'Ibose.store.main.MainStore',
	       'Ibose.store.main.NavigatorS',
	       'Ibose.store.main.ToolS',
	       'Ibose.store.main.CalmS',
	       'Ibose.store.main.More'
	],
	views: [
	       'Ibose.view.main.Main',
	       'Ibose.view.navigator.Navigator',
	       'Ibose.view.content.Content',
	       'Ibose.view.quickview.Quickview',
	       'Ibose.view.calm.Calm'
	],
	controllers: [],
	//profiles: ['Phone', 'Tablet', 'Large', 'ExtraLarge', 'SuperLarge'],
	models: ['Ibose.view.main.MainViewModel'],
	launch: function() {
		console.log('Ibose launched');
		Ext.create({
			xtype: 'main'
		});
	}
});