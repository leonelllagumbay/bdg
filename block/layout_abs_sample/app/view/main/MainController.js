Ext.define('layout_abs_sample.view.main.MainController', {
	extend: 'Ext.app.ViewController',
	alias: 'controller.main',
	onItemSelected: function(sender, record) {
		//Ext.Msg.confirm('Confirm', 'Are you sure?', 'onConfirm', this);
	},
	onConfirm: function(choice) {
		
	}
});