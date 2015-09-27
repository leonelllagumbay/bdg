Ext.define('Form.view.queryoutput.FBC.NS_2EDB6F3AD5A2279C9E6B8690031891A8.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2EDB6F3AD5A2279C9E6B8690031891A8',
	loadMask: true,
	multiSelect: true,
	title: 'Trainings',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2EDB6F3AD5A2279C9E6B8690031891A8.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Topic',
		dataIndex: 'cin21training-TOPIC',
		filterable: true,
		sortable: true,
		width: 150,
		action: '7CCDC708EA70891B9B0538EBD72A7BF8'
	},{
		text: 'Venue',
		dataIndex: 'cin21training-VENUE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '735D5BB1F1E167DBB1FFC1FF8DBBD918'
	},{
		text: 'Inclusive Date',
		dataIndex: 'cin21training-INCLUSIVEDATE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '710FAAF86CBE72FF722466FCE07880E2'
	},{
		text: 'Remarks',
		dataIndex: 'cin21training-REMARKS',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'E64023CFC31DD1E685AF15BD8E4A5C34'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2EDB6F3AD5A2279C9E6B8690031891A8.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});