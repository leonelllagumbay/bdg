Ext.define('Form.model.queryoutput.FBC.NS_48ABB0BFFB9D56789988D6F49F6E3E35.Model', {
	extend: 'Ext.data.Model',
	fields: [{
			name: 'egintestquery-ASTRING',
			mapping: 'dt',
			type: 'string'
		},{
			name: 'egintestquery-ATEXT',
			mapping: 'temp.max',
			type: 'string'
		},{
			name: 'egintestquery-AFLOAT',
			mapping: 'pressure',
			type: 'float'
		},{
			name: 'egintestquery-ANUMBER',
			mapping: 'humidity',
			type: 'int'
		},{
			name: 'egintestquery-ATIME',
			mapping: 'weather[0].description',
			type: 'string'
		},{
			name: 'egintestquery-ADATETIME',
			mapping: 'speed',
			type: 'float'
		},{
			name: 'egintestquery-TESTID',
			mapping: 'deg',
			type: 'int'
		}]
});