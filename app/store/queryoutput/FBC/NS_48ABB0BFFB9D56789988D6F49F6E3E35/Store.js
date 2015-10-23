Ext.define('Form.store.queryoutput.FBC.NS_48ABB0BFFB9D56789988D6F49F6E3E35.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48ABB0BFFB9D56789988D6F49F6E3E35.Model',
	autoLoad: true,
	constructor : function(config) {
		Ext.applyIf(config, {
			proxy  : {
				type: 'jsonp',
				reader: { type: 'json', root: 'list', totalProperty: 'cnt' 			},
				
				url: 'http://api.openweathermap.org/data/2.5/forecast/daily?lat=14.582412&lon=121.0582411&cnt=10&mode=json&appid=bd82977b86bf27fb59a04b61b657fb6f',
				idParam: 'ID'
			}
		});
	this.callParent([config]);
	}
});