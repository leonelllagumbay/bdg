Ext.define('dummy.view.main.MainController', {
	extend: 'Ext.app.ViewController',
	alias: 'controller.main',
	onItemSelected: function(sender, record) {
		// TODO: 
	},
	onChanged: function(choice) {
		console.log('You changed me');
		// TODO: 
	}
});