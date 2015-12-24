Ext.application({
	name: 'Ibose',
	stores: [
	         // TODO: add global / shared stores here
	       'Ibose.store.main.MainStore',
	],
	views: [
	       'Ibose.view.main.Main',
	       'Ibose.view.navigator.Navigator',
	       'Ibose.view.content.Content',
	       'Ibose.view.quickview.Quickview'
	],
	//controllers: [
	//       'layout_abs_sample.controller.Controller'
	//],
	//profiles: ['Phone', 'Tablet', 'Large', 'ExtraLarge', 'SuperLarge'],
	
	launch: function() {
		console.log('Ibose launched');
		Ext.create({
			xtype: 'main'
		});
	}
});