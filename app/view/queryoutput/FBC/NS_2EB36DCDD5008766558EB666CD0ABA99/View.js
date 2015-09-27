Ext.define('Form.view.queryoutput.FBC.NS_2EB36DCDD5008766558EB666CD0ABA99.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2EB36DCDD5008766558EB666CD0ABA99',
	loadMask: true,
	multiSelect: true,
	title: 'Exam Passed',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2EB36DCDD5008766558EB666CD0ABA99.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Type of Exam',
		dataIndex: 'cin21exampass-TYPEOFEXAM',
		filterable: true,
		sortable: true,
		width: 150,
		action: '78F4C29CE6DBB18FBB0439EA11783761'
	},{
		text: 'Date Taken',
		dataIndex: 'cin21exampass-DATETAKENPASSED',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: '25C2151DD0A7A4FA52400E8E5E3C4804'
	},{
		text: 'Rating',
		dataIndex: 'cin21exampass-RATING',
		filterable: true,
		sortable: true,
		width: 150,
		action: '27D8E8745B2E9E7F57DF2AE7B209CAB5'
	},{
		text: 'License Number',
		dataIndex: 'cin21exampass-LICENSENUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: '67F17C80DF0E737AA3E421A46ACE9CDD'
	},{
		text: 'Passed',
		dataIndex: 'cin21exampass-PASSED',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'D3F6208F6C23A00ED73BB87E363CA790'
	},{
		text: 'Remarks',
		dataIndex: 'cin21exampass-REMARKS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '71D9099DA6B19FAA3F0A983D4F6E6D36'
	},{
		text: 'Expiration',
		dataIndex: 'cin21exampass-EXPIRATIONDATE',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: '1FFE3FF7729CFAB86D4C0D6AC4AB0174'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2EB36DCDD5008766558EB666CD0ABA99.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});