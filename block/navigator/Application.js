Ext.application({
	name: 'dummy',
	stores: [
	         // TODO: add global / shared stores here
	],
	views: [
	       'dummy.view.main.Main'
	],
	//controllers: [
	//       'layout_abs_sample.controller.Controller'
	//],
	//profiles: ['Phone', 'Tablet', 'Large', 'ExtraLarge', 'SuperLarge'],
	
	launch: function() {
		console.log('dummy launched');
		Ext.create({
			xtype: 'main'
		});
	}
});