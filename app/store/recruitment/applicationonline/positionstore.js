Ext.define('OnlineApplication.store.recruitment.applicationonline.positionstore', {
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
			var fcompanycode = Ext.ComponentQuery.query("employmentinfoview combobox[name=COMPANYFIRSTPRIORITY]")[0].getValue();
			b.proxy.extraParams.companycode = fcompanycode;
			console.log(fcompanycode);
			return true;
			
		}
	}
});
