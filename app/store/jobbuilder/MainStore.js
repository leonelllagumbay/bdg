Ext.define('Form.store.jobbuilder.MainStore', {
			extend: 'Ext.data.Store',
			model: 'Form.model.jobbuilder.MainModel',
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