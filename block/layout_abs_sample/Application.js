Ext.application({
	name: 'layout_abs_sample',
	stores: [
	         // TODO: add global / shared stores here
	],
	views: [
	       'layout_abs_sample.view.main.Main'
	],
	//controllers: [
	//       'layout_abs_sample.controller.Controller'
	//],
	launch: function() {
		console.log('launched');
		Ext.create({
			xtype: 'main'
		});
	}
});