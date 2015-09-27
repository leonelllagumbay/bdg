Ext.define('Form.view.queryoutput.FBC.NS_7FE54E13F11CD85369BA5D1AA3D80A43.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7FE54E13F11CD85369BA5D1AA3D80A43',
	loadMask: true,
	multiSelect: true,
	title: 'Global Comments',
	width: 600,
	height: 400,
	padding: 7,

	store    : 'queryoutput.FBC.NS_7FE54E13F11CD85369BA5D1AA3D80A43.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Comment Code',
		dataIndex: 'eginpmscomment-COMMENTCODE',
		filterable: true,
		sortable: true,
		width: 150,
		disabled: true,
		hidden: true,
		xtype: 'numbercolumn', format: '0',
		action: '74DC3DF9FE9B96816D3963DDFCD2270F'
	},{
		text: 'Content',
		dataIndex: 'eginpmscomment-CONTENT',
		filterable: true,
		sortable: true,
		width: 150,
		action: '06E4D99AED7233DD20646A7C2B993A41'
	},{
		text: 'From',
		dataIndex: 'eginpmscomment-FROMUSERID',
		filterable: true,
		sortable: true,
		width: 150,
		action: '132B0D819D95482B10336A75230AB2C8'
	},{
		text: 'To',
		dataIndex: 'eginpmscomment-TOUSERID',
		filterable: true,
		sortable: true,
		width: 150,
		action: '2E9CC2E62C8525E722649BC01A9421DF'
	},{
		text: 'Date',
		dataIndex: 'eginpmscomment-RECDATECREATED',
		filterable: true,
		sortable: true,
		width: 150,
		defaults: {value: ''},
		xtype: 'datecolumn',
		action: '237B895440DAFCA2FF0D78FA7F4646FA'
	},{
		text: 'PMS Code Fk',
		dataIndex: 'eginpmscomment-PMSCODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		disabled: false,
		hidden: true,
		action: '5460B600DCD1E4AA63F9164547647BCA'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_7FE54E13F11CD85369BA5D1AA3D80A43.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});