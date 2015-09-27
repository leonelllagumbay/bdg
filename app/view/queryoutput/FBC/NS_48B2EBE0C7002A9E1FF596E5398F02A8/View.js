Ext.define('Form.view.queryoutput.FBC.NS_48B2EBE0C7002A9E1FF596E5398F02A8.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_48B2EBE0C7002A9E1FF596E5398F02A8',
	loadMask: true,
	multiSelect: true,
	title: 'Careers',
	width: 600,
	height: 300,
	padding: 10,

	store    : 'queryoutput.FBC.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Requisition Number',
		dataIndex: 'ecrgboard-BOARDCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'F2F9D89B16E5CA527CDD3EBA06021D03'
	},{
		text: 'Position',
		dataIndex: 'ecrgboard-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		renderer: function renderTopic(value, p, record) {     var dcontent = record.data['ecrgboard-CONTENT']; 	dcontent = dcontent.split(','); 	if (typeof GLOBAL_VARS_DIRECT === 'undefined') var dpath = '../../../templates/application/careers/mrfviewer.cfm'; 	else var dpath = GLOBAL_VARS_DIRECT.SITE + 'templates/application/careers/mrfviewer.cfm'; 	return Ext.String.format( 		'<a href="' + dpath + '?reqno=' + record.data['ecrgboard-BOARDCODE'] + '&norevert=NOREVERT' + '&dbms=' + dcontent[0] + '&cd=' + dcontent[1] + '&companycode=' + dcontent[2] + '" target="_blank">{0}</a>',value 	); },
		action: '9279BF94C3A00316654C407EA787C02F'
	},{
		text: 'ecrgboardCONTENT',
		dataIndex: 'ecrgboard-CONTENT',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '373A03309073EE543248428F74E7EB40'
	},{
		text: 'End Date',
		dataIndex: 'ecrgboard-ENDDATE',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: '885006C92D5F1334D7F773E02AF5091C'
	},{
		text: 'ecrgboardDATELASTUPDATE',
		dataIndex: 'ecrgboard-DATELASTUPDATE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		xtype: 'datecolumn',
		action: '3A12330703DD573F082E0BCE2CDF4A21'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});