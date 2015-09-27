Ext.define('Form.view.queryoutput.FBC.NS_2EDD7067BEAD092F217F5D4E0CE400B4.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2EDD7067BEAD092F217F5D4E0CE400B4',
	loadMask: true,
	multiSelect: true,
	title: 'Work History',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Company Name',
		dataIndex: 'cin21workhistory-ENTITYCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '30321CDB286A24EE8330D353475291E1'
	},{
		text: 'Company Address',
		dataIndex: 'cin21workhistory-MAINDUTIES',
		filterable: true,
		sortable: true,
		width: 150,
		action: '568CF790026B2E22DF9B97E19CE513AA'
	},{
		text: 'Contact Information',
		dataIndex: 'cin21workhistory-COMPANYCONTACT',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'B9290F4C07D8D5AEFFAC25F49DCE75B3'
	},{
		text: 'Last Position Held',
		dataIndex: 'cin21workhistory-LASTPOSITIONHELD',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'C109CCF4D448B421D0CC1679FB5E54EA'
	},{
		text: 'Major Accomplishments',
		dataIndex: 'cin21workhistory-ACCOMPLISHMENT',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'F7709A8F2D5C73C77A4E4A3FF6E086DB'
	},{
		text: 'Reasons for Leaving',
		dataIndex: 'cin21workhistory-REASONFORLEAVING',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'B50EAEBEE8E09E9E8F4E01C52307BC8C'
	},{
		text: 'Date Employed',
		dataIndex: 'cin21workhistory-DATEHIRED',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: '2508C7372B8AD44F8C60DE7EF109EBA3'
	},{
		text: 'Date Separated',
		dataIndex: 'cin21workhistory-SEPARATIONDATE',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: '3F04DFB30A5ED543E29968CE9045CB96'
	},{
		text: 'Starting Salary',
		dataIndex: 'cin21workhistory-WORKSTARTINGSALARY',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: '54BA1366F890FAE10247DAFD6073FB6A'
	},{
		text: 'Last Salary',
		dataIndex: 'cin21workhistory-WORKENDINGSALARY',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: 'EE7C2CA1A6286CD7E1F9C8820751B0AB'
	},{
		text: 'Department',
		dataIndex: 'cin21workhistory-DEPARTMENT',
		filterable: true,
		sortable: true,
		width: 150,
		action: '66E6821BD22178E1ED626E6424D309CC'
	},{
		text: 'Immediate Superior',
		dataIndex: 'cin21workhistory-SUPERIOR',
		filterable: true,
		sortable: true,
		width: 150,
		action: '4B861B3E525246DE6EF0B37646B826B5'
	},{
		text: 'Position of Superior',
		dataIndex: 'cin21workhistory-SUPERIORPOSITION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '0734857E1204163CAA01C74C44F831CF'
	},{
		text: 'Contact No of Superior',
		dataIndex: 'cin21workhistory-SUPERIORCONTACT',
		filterable: true,
		sortable: true,
		width: 150,
		action: '083FEA203F17064345EFFB12654F6D71'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});