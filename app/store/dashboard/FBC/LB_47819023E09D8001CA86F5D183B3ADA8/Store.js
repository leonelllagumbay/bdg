Ext.define('Form.store.dashboard.FBC.LB_47819023E09D8001CA86F5D183B3ADA8.Store', {
			extend: 'Ext.data.Store',
			model: 'Form.model.dashboard.FBC.LB_47819023E09D8001CA86F5D183B3ADA8.Model',
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