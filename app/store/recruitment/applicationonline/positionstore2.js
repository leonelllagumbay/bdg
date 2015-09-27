Ext.define('OnlineApplication.store.recruitment.applicationonline.positionstore2', {
	extend: 'Ext.data.Store',
	model: 'OnlineApplication.model.recruitment.applicationonline.positionmodel',
	autoLoad: true,
	proxy: {
			type: 'direct',
			extraParams: {
				companycode: ''
			},
			directFn: 'Ext.ss.lookup.getPosition',
			reader: {
	            root: 'topics',
	            totalProperty: 'totalCount'
	        }
	},
	listeners: {
		beforeload: function(b) {
			var fcompanycode = Ext.ComponentQuery.query("employmentinfoview combobox[name=COMPANYSECONDPRIORITY]")[0].getValue();
			b.proxy.extraParams.companycode = fcompanycode;
			return true;
			
		}
	}
});
