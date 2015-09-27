Ext.define('Form.store.queryoutput.FBC.NS_387B5E33B26001E52294FBB5C3F16A19.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_387B5E33B26001E52294FBB5C3F16A19.Model',
	autoLoad: true,
	constructor : function(config) {
		Ext.applyIf(config, {
			proxy  : {
				type: 'ajax',
				reader: { type: 'xml', record: 'item' },
				
				url: 'http://localhost:8500/data/xml/rss.cfm?rssurl=http://www.gmanetwork.com/news/rss/news',
				idParam: 'ID'
			}
		});
	this.callParent([config]);
	}
});