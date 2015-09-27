Ext.define('Form.view.queryoutput.FBC.NS_7FBD7325DA0172D1104151C954EF979D.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7FBD7325DA0172D1104151C954EF979D',
	loadMask: true,
	multiSelect: true,
	title: 'Overall Performance Rating',
	width: 1000,
	height: 500,
	padding: 7,

	store    : 'queryoutput.FBC.NS_7FBD7325DA0172D1104151C954EF979D.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	},{	ftype: 'rowbody',getAdditionalData: function(record, rowIndex, rowValues) {
    var headerCt = this.view.headerCt,
        colspan = headerCt.getColumnCount();
    var ro = {
        	rowBody : '<table ><tr><td border="1" colspan="4" bgcolor="yellow">1st Data</td></tr><tr><td border="1" colspan="1">2nd Data</td><td border="1" colspan="1">3rd Data</td><td border="1" colspan="1">4th Data</td><td border="1" colspan="1">5th Data</td></tr><tr><td border="1" colspan="1">6th Data</td><td border="1" colspan="3">7th Data</td></tr></table>',
        	rowBodyCls : (rowIndex % 2) ? 'bg-snow' : this.rowBodyCls,
        	rowBodyColspan : colspan
        };
    return ro;
},actionend: ''	}],
    plugins: [{	ptype: 'cellediting',actionend: ''	}],
    columns: [{
		text: 'Overall Performance Rating Code',
		dataIndex: 'eginpmsempopr-OPRCODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '633412566C4464B1ECC925DE7D2CD8CC'
	},{
		text: 'KRA Code Fk',
		dataIndex: 'eginpmsempopr-KRACODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '16D6FDF90304E6DC4129B907EEB1BFA2'
	},{
		text: 'Name and Signature of Employee',
		dataIndex: 'eginpmsempopr-NAMEANDSIGOFEMPLOYEE',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'textfield',
		action: '9B2404C67BB824DA3228BCFBA38BE946'
	},{
		text: 'Date',
		dataIndex: 'eginpmsempopr-NAMEANDSIGDATE',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'datefield',
		xtype: 'datecolumn',
		action: '5151D3EDD3B42D742B5253CA9D62AD39'
	},{
		text: 'Received By',
		dataIndex: 'eginpmsempopr-HRADRECEIVEDBY',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 200,
		editor: 'textfield',
		action: '173B0D1CBB62FE4C32D665BC3E5148DC'
	},{
		text: 'Received By Date',
		dataIndex: 'eginpmsempopr-HRADRECEIVEDBYDATE',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 200,
		editor: 'datefield',
		xtype: 'datecolumn',
		action: '8F91B5D9EF05A4243027BCDD68D8F7BF'
	},{
		text: 'Rated By',
		dataIndex: 'eginpmsempopr-RATEDBY',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'textfield',
		action: '67CF06CE01E2AA7AE9972BD4B9182830'
	},{
		text: 'Date Rated',
		dataIndex: 'eginpmsempopr-RATEDBYDATE',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 200,
		editor: 'datefield',
		xtype: 'datecolumn',
		action: '918C172BBB0C219BFC7AFD9E7435B6C3'
	},{
		text: 'Reviewed By',
		dataIndex: 'eginpmsempopr-REVIEWEDBY',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'textfield',
		action: '45D94D5F5CCA49BC200983EB371AA48C'
	},{
		text: 'Date Reviewed',
		dataIndex: 'eginpmsempopr-REVIEWEDBYDATE',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 200,
		editor: 'datefield',
		xtype: 'datecolumn',
		action: 'BA069725E612FB548ED359B6CE8DBBF0'
	},{
		text: 'Approved By',
		dataIndex: 'eginpmsempopr-APPROVEDBY',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'textfield',
		action: '484CDEFFD4AE0658BD1CBAEC231698CE'
	},{
		text: 'Date Approved',
		dataIndex: 'eginpmsempopr-APPROVEDBYDATE',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'datefield',
		xtype: 'datecolumn',
		action: '7068D681BA160615137796346D87F54D'
	},{
		text: 'Remarks',
		dataIndex: 'eginpmsempopr-REMARKS',
		filterable: true,
		sortable: true,
		width: 400,
		editor: 'textfield',
		action: '989454E30F8E60C5CA1F8EF35DF241D5'
	},{
		text: 'Comments of Immediate Supervisor',
		dataIndex: 'eginpmsempopr-COMMENTSOFIMMEDSUP',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'textfield',
		action: '23BD53981A581D5CABBA71BFD7CE3B09'
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
		        store: 'queryoutput.FBC.NS_7FBD7325DA0172D1104151C954EF979D.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});