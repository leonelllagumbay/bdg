Ext.define('Form.view.queryoutput.FBC.NS_7F90DFD609223C063FAAD035CB569681.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7F90DFD609223C063FAAD035CB569681',
	loadMask: true,
	multiSelect: true,
	title: 'Career Planning',
	width: 1000,
	height: 500,
	padding: 7,

	store    : 'queryoutput.FBC.NS_7F90DFD609223C063FAAD035CB569681.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Career Planning Code',
		dataIndex: 'eginpmsempcp-CPCODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '7FD12E8C1C8A7273FB770AC0D86D9DE0'
	},{
		text: 'KRA Code Fk',
		dataIndex: 'eginpmsempcp-KRACODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '0B476803329C7542EA0202D52AC1EDB4'
	},{
		text: 'Strengths',
		dataIndex: 'eginpmsempcp-STRENGTHS',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 500,
		editor: 'textfield',
		action: '81DC583A70036E5D1774448E7C693A56'
	},{
		text: 'Possible Career Path (Short Term)',
		dataIndex: 'eginpmsempcp-CAREERPATHSHORTTERM',
		filterable: true,
		sortable: true,
		width: 200,
		editor: 'combobox',
		action: 'FAA2575D7337F9E18F3EF2931CB6EFB9'
	},{
		text: 'Possible Career Path (Medium Term)',
		dataIndex: 'eginpmsempcp-CAREERPATHMEDIUMTERM',
		filterable: true,
		sortable: true,
		width: 200,
		editor: 'combobox',
		action: '96385884CB7FF30D0DC6E1C5A6ACAB1F'
	},{
		text: 'Possible Career Path (Long Term)',
		dataIndex: 'eginpmsempcp-CAREERPATHLONGTERM',
		filterable: true,
		sortable: true,
		width: 200,
		editor: 'combobox',
		action: '844E58DE0C2630AF5CDDE0A959DEFA77'
	},{
		text: 'Comments',
		dataIndex: 'eginpmsempcp-COMMENTS',
		filterable: true,
		sortable: true,
		width: 400,
		editor: 'textfield',
		action: 'C2F3FCEEA42C9C644FD290ECE3E65E5E'
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
		        store: 'queryoutput.FBC.NS_7F90DFD609223C063FAAD035CB569681.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});