Ext.define('Form.controller.dashboard.FBC.LB_835691A8CDD1D64D9D5D0C9610E59C21.Controller', {
		   	extend: 'Ext.app.Controller',
		   	views: ['dashboard.FBC.LB_835691A8CDD1D64D9D5D0C9610E59C21.View'],
		   	models: ['dashboard.FBC.LB_835691A8CDD1D64D9D5D0C9610E59C21.Model'],
		   	stores: ['dashboard.FBC.LB_835691A8CDD1D64D9D5D0C9610E59C21.Store'],
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