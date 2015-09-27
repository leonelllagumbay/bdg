Ext.define('Form.view.queryoutput.FBC.NS_7FA56882E5332BCA44B0389F085788F5.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7FA56882E5332BCA44B0389F085788F5',
	loadMask: true,
	multiSelect: true,
	title: 'Career Planning Developmental Plan',
	width: 1000,
	height: 500,
	padding: 7,

	store    : 'queryoutput.FBC.NS_7FA56882E5332BCA44B0389F085788F5.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'CP Developmental Plan Code',
		dataIndex: 'eginpmsempcpitems-CPITEMCODE',
		filterable: true,
		sortable: true,
		width: 150,
		disabled: true,
		hidden: true,
		xtype: 'numbercolumn', format: '0',
		action: '6CE22DEBFAAF96968030ACE3360CD6FC'
	},{
		text: 'KRA Code Fk',
		dataIndex: 'eginpmsempcpitems-KRACODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '9F32CC48A4DD9F96CB6269D497EECB89'
	},{
		text: 'DEVELOPMENTAL AREAS',
		dataIndex: 'eginpmsempcpitems-DEVELOPMENTALAREAS',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'textfield',
		action: '40B8013E000F8924F0789C259E0C9688'
	},{
		text: 'MEASURE OF IMPROVEMENT',
		dataIndex: 'eginpmsempcpitems-MEASUREOFIMPROVEMENT',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'textfield',
		action: '755F625C5169A7A932D06CD9DD0E5357'
	},{
		text: 'DEVELOPMENTAL ACTIVITIES',
		dataIndex: 'eginpmsempcpitems-DEVELOPMENTALACTIVITIES',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 250,
		editor: 'combobox',
		action: 'F67CCCC672E1652AE1D612FBC0A97FFE'
	},{
		text: 'MEASUREMENT DATE',
		dataIndex: 'eginpmsempcpitems-MEASUREMENTDATE',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 200,
		editor: 'datefield',
		xtype: 'datecolumn',
		action: 'B13DC4AA88289B9F665F389B90F9801A'
	},{
		text: 'COMMENTS',
		dataIndex: 'eginpmsempcpitems-COMMENTS',
		filterable: true,
		sortable: true,
		align: 'left',
		width: 400,
		editor: 'textfield',
		action: 'F4DE0AE7ECE51DF4259286811CE0385B'
	},{
		text: 'KRA Code',
		dataIndex: 'eginpmsempkra-KRACODE',
		filterable: true,
		sortable: true,
		width: 150,
		disabled: true,
		hidden: true,
		action: '3CB8E6912BB913769CE6F39460F4A73C'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_7FA56882E5332BCA44B0389F085788F5.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});