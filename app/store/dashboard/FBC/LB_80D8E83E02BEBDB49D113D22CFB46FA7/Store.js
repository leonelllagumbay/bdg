Ext.define('Form.store.dashboard.FBC.LB_80D8E83E02BEBDB49D113D22CFB46FA7.Store', {
			extend: 'Ext.data.Store',
			model: 'Form.model.dashboard.FBC.LB_80D8E83E02BEBDB49D113D22CFB46FA7.Model',
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