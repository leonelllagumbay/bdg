Ext.define('Form.view.queryoutput.FBC.NS_2CA402E29A563C0A77A4E384F62AA72B.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2CA402E29A563C0A77A4E384F62AA72B',
	loadMask: true,
	multiSelect: true,
	title: 'Character Reference',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2CA402E29A563C0A77A4E384F62AA72B.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Name',
		dataIndex: 'cin21chareference-NAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '6D0E99B21446B53A5DC3C7B63334EBFE'
	},{
		text: 'Company',
		dataIndex: 'cin21chareference-COMPANY',
		filterable: true,
		sortable: true,
		width: 150,
		action: '915FD1FD1C866C09148A4FB8BFDF67A2'
	},{
		text: 'Occupation',
		dataIndex: 'cin21chareference-OCCUPATION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'ABEFA37DF4DAA603A46FEE5AC5F823FD'
	},{
		text: 'Address',
		dataIndex: 'cin21chareference-ADDRESS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '421CF1CDFD0D89D4D576D3A699B82192'
	},{
		text: 'Mobile Number',
		dataIndex: 'cin21chareference-CELLULARPHONE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'DD61CEB6C8ED859E2AC470D6EBCE7ABC'
	},{
		text: 'Telephone Number',
		dataIndex: 'cin21chareference-TELEPHONENUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: '785C0EA50008FFCF9DF84D8BD470953D'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2CA402E29A563C0A77A4E384F62AA72B.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});