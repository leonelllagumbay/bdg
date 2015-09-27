Ext.define('Form.store.dashboard.FBC.LB_47DA4C60E21E2EC6D1E8FC3FE8DABBE1.Store', {
			extend: 'Ext.data.Store',
			model: 'Form.model.dashboard.FBC.LB_47DA4C60E21E2EC6D1E8FC3FE8DABBE1.Model',
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