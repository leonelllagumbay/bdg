Ext.define('Form.store.queryoutput.FBC.NS_81885B92D0CDC40CB36CDABAA240841E.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_81885B92D0CDC40CB36CDABAA240841E.Model',
	autoLoad: true,
	constructor : function(config) {
		Ext.applyIf(config, {
			proxy  : {
				type: 'ajax',
				reader: { type: 'xml', record: 'item' },
				
				url: 'http://localhost:8500/data/xml/rss.cfm?rssurl=https://news.google.com/?output=rss',
				idParam: 'ID'
			}
		});
	this.callParent([config]);
	}
});