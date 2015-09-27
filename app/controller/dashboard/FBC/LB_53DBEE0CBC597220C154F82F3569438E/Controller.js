Ext.define('Form.controller.dashboard.FBC.LB_53DBEE0CBC597220C154F82F3569438E.Controller', {
		   	extend: 'Ext.app.Controller',
		   	views: ['dashboard.FBC.LB_53DBEE0CBC597220C154F82F3569438E.View'],
		   	models: ['dashboard.FBC.LB_53DBEE0CBC597220C154F82F3569438E.Model'],
		   	stores: ['dashboard.FBC.LB_53DBEE0CBC597220C154F82F3569438E.Store'],
		   		init: function() {
		   			this.control({
		   				'panel': {
		   					render: this.initPanel
		   				}
		   			})
		   		},
		   		initPanel: function(b) {
		   			console.log('init panel');
		   		}
		})