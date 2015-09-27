Ext.define('Form.view.queryoutput.FBC.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5',
	loadMask: true,
	multiSelect: true,
	title: 'Personal Information',
	width: 400,
	height: 300,
	padding: 10,

	store    : 'queryoutput.FBC.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	},{	ftype: 'rowbody',getAdditionalData: function(record, rowIndex, rowValues) {
    var headerCt = this.view.headerCt,
        colspan = headerCt.getColumnCount();
    try {
    	var myname = GLOBAL_VARS_DIRECT['FIRSTNAME'] + ' ' + GLOBAL_VARS_DIRECT['MIDDLENAME'] + ' ' + GLOBAL_VARS_DIRECT['LASTNAME'];
    } catch (e) {
    	var myname = "_";
    }
    var ro = {
        	rowBody : '<p><b>Name: </b>' + myname + '</p>' + '<p><b>Personnel ID: </b>' + record['cmfpa-PERSONNELIDNO'] + '</p>' + '<p><b>Date Hired: </b>' + Ext.util.Format.date(record['cmfpa-DATEHIRED'], 'F j, Y') + '</p>' + '</p>' + '<p><b>Position: </b>' + record['clkposition-DESCRIPTION'] + '</p>' + '<p><b>Department: </b>' + record['clkdepartment-DESCRIPTION'] + '</p>' + '<p><b>Guid: </b>' + record['cmfpa-GUID'] + '</p>' + '</p>' + '<p><b>Superior: </b>' + record['cmfpa-FIRSTNAME'] + ' ' + record['cmfpa-LASTNAME'] + '</p>',
        	rowBodyCls : (rowIndex % 2) ? 'bg-snow' : this.rowBodyCls,
        	rowBodyColspan : colspan
        };
    return ro;
},actionend: ''	}],
    plugins: [],
    columns: [{
		text: 'Personnel ID',
		dataIndex: 'cmfpa-PERSONNELIDNO',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '97721CC008EBF4447C6A7A0007E9DEAC'
	},{
		text: 'First Name',
		dataIndex: 'cmfpa-FIRSTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '285A3FFD6747BEE5502BAA4872D4DE6C'
	},{
		text: 'Middle Name',
		dataIndex: 'cmfpa-MIDDLENAME',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '6F5DE70AB42BBBCF196BF2EF795BDE95'
	},{
		text: 'Last Name',
		dataIndex: 'cmfpa-LASTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '5B0ACA42BB84B24C7FBD6F53C319E7FA'
	},{
		text: 'Date Hired',
		dataIndex: 'cmfpa-DATEHIRED',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		xtype: 'datecolumn',
		action: '3218DC0935A17EC8060CE4F1A27F6FFD'
	},{
		text: 'Immediate Superior',
		dataIndex: 'cmfpa-SUPERIORCODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: 'D4D9C373371D04913487E1B4F64C0437'
	},{
		text: 'Guid',
		dataIndex: 'cmfpa-GUID',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '68A128789A87DDD8F0CDA269CD053A60'
	},{
		text: 'Position',
		dataIndex: 'clkposition-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 300,
		hidden: false,
		action: '7AE15043C2D33429EE5CA0DB516C91E9'
	},{
		text: 'Department',
		dataIndex: 'clkdepartment-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: 'C374BFF3F291AA12D7C1587D11401357'
	},{
		text: 'Superior First Name',
		dataIndex: 'cmfpa-FIRSTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '285A3FFD6747BEE5502BAA4872D4DE6C'
	},{
		text: 'Superior Last Name',
		dataIndex: 'cmfpa-LASTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '5B0ACA42BB84B24C7FBD6F53C319E7FA'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});