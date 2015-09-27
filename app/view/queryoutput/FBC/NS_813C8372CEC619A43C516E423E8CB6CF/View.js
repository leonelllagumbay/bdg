Ext.define('Form.view.queryoutput.FBC.NS_813C8372CEC619A43C516E423E8CB6CF.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_813C8372CEC619A43C516E423E8CB6CF',
	loadMask: true,
	multiSelect: true,
	title: 'Data Editor - CLKSKILL',
	width: 300,
	height: 300,

	store    : 'queryoutput.FBC.NS_813C8372CEC619A43C516E423E8CB6CF.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Skill Code',
		dataIndex: 'clkskill-SKILLCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '0E40B9D51E9A634F1B835845E3A4EACC'
	},{
		text: 'Description',
		dataIndex: 'clkskill-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: '25CA8E2A596A459F364ACD85E1EB5553'
	},{
		text: 'Remarks',
		dataIndex: 'clkskill-REMARKS',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: '7ACB0067584EE72817609E21B26C68FD'
	},{
		text: 'Required Adeptness',
		dataIndex: 'clkskill-REQUIREDADEPTNESS',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: '18F9F544585C26B404639F9896845F2A'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_813C8372CEC619A43C516E423E8CB6CF.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});