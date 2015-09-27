Ext.define('Form.store.dashboard.FBC.LB_835691A8CDD1D64D9D5D0C9610E59C21.Store', {
			extend: 'Ext.data.Store',
			model: 'Form.model.dashboard.FBC.LB_835691A8CDD1D64D9D5D0C9610E59C21.Model',
			constructor : function(config) {
				Ext.applyIf(config, {
					proxy  : {
					type: 'direct',
					paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams']
				}
			});
			this.callParent([config]);
			}
		});