Ext.define('Form.store.dashboard.FBC.LB_53DBEE0CBC597220C154F82F3569438E.Store', {
			extend: 'Ext.data.Store',
			model: 'Form.model.dashboard.FBC.LB_53DBEE0CBC597220C154F82F3569438E.Model',
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