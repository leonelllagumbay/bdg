Ext.define('Form.store.dashboard.FBC.LB_47DF26239039470AA25CD1E875045718.Store', {
			extend: 'Ext.data.Store',
			model: 'Form.model.dashboard.FBC.LB_47DF26239039470AA25CD1E875045718.Model',
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