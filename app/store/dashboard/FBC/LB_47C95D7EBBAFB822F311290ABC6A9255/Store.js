Ext.define('Form.store.dashboard.FBC.LB_47C95D7EBBAFB822F311290ABC6A9255.Store', {
			extend: 'Ext.data.Store',
			model: 'Form.model.dashboard.FBC.LB_47C95D7EBBAFB822F311290ABC6A9255.Model',
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