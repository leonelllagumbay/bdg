Ext.define('Form.view.queryoutput.FBC.NS_81885B92D0CDC40CB36CDABAA240841E.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_81885B92D0CDC40CB36CDABAA240841E',
	loadMask: true,
	multiSelect: true,
	title: 'Google News',
	width: 600,
	height: 600,
	padding: 10,

	store    : 'queryoutput.FBC.NS_81885B92D0CDC40CB36CDABAA240841E.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	},{	ftype: 'rowbody',getAdditionalData: function(record, rowIndex, rowValues) {
    var headerCt = this.view.headerCt,
        colspan = headerCt.getColumnCount();
    var ro = {
        	rowBody : '<p>' + record['egintestquery-S6'] + '</p>',
        	rowBodyCls : (rowIndex % 2) ? 'bg-snow' : this.rowBodyCls,
        	rowBodyColspan : colspan
        };
    return ro;
},actionend: ''	}],
    plugins: [],
    columns: [{
		text: 'Title',
		dataIndex: 'egintestquery-S1',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: 'C7583BA6F73467F3973090FC1596DA5B'
	},{
		text: 'Link',
		dataIndex: 'egintestquery-S2',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '984F09189A894ADF93F796109595B97C'
	},{
		text: 'Guid',
		dataIndex: 'egintestquery-S3',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '07ED4C9F2D00F60896CFF38EF1549697'
	},{
		text: 'Category',
		dataIndex: 'egintestquery-S4',
		filterable: true,
		sortable: true,
		width: 230,
		action: '2B3E834D54FF57CC133298A5387E0A6E'
	},{
		text: 'Pub Date',
		dataIndex: 'egintestquery-S5',
		filterable: true,
		sortable: true,
		width: 200,
		action: '082DDC6C7769DE751C1D6073BC366ADC'
	},{
		text: 'Description',
		dataIndex: 'egintestquery-S6',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '4E55E0E1C0D0337B52C210FA0C4761E2'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_81885B92D0CDC40CB36CDABAA240841E.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});