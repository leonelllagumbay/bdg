Ext.define('Form.view.queryoutput.FBC.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714',
	loadMask: true,
	multiSelect: true,
	title: 'PMS Behavioral Competencies',
	width: 600,
	height: 500,
	padding: 7,
	closable: true,
	collapsible: true,

	store    : 'queryoutput.FBC.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'cellediting',	clicksToEdit: 2,
			actionend: ''	},{	ptype: 'rowexpander',	expandOnDblClick: false,
			rowBodyTpl : [
	'<p><b>Behavioral Competency Code:</b>  {eginpmsbehavioralcomp-BEHAVIORALCOMPCODE}</p>',
    '<p><b>Group:</b>  {eginpmsbehavioralcomp-DGROUP}</p>',
	'<p><b>Subgroup:</b>  {eginpmsbehavioralcomp-SUBGROUP}</p>',
	'<p><b>Behavioral Competency:</b>  {eginpmsbehavioralcomp-BEHAVIORALCOMP}</p>',
	'<p><b>Order:</b>  {eginpmsbehavioralcomp-BCORDER}</p>',
],actionend: ''	}],
    columns: [{
		text: 'Behavioral Competencies Code',
		dataIndex: 'eginpmsbehavioralcomp-BEHAVIORALCOMPCODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '7957C2E3C107DE6967ED4F5CA63E9B3B'
	},{
		text: 'Group',
		dataIndex: 'eginpmsbehavioralcomp-DGROUP',
		filterable: true,
		sortable: true,
		width: 130,
		editor: 'textfield',
		action: 'DE03A830CE392F38E7469329FD241C18'
	},{
		text: 'Sub Group',
		dataIndex: 'eginpmsbehavioralcomp-SUBGROUP',
		filterable: true,
		sortable: true,
		width: 130,
		editor: 'textfield',
		action: 'D6E40138CC660CBC76BFC00CE0ABB8F1'
	},{
		text: 'Order',
		dataIndex: 'eginpmsbehavioralcomp-BCORDER',
		filterable: true,
		sortable: true,
		width: 40,
		editor: 'numberfield',
		xtype: 'numbercolumn', format: '0',
		action: '56EF56584C08D0BC4229F90BE28D3BA2'
	},{
		text: 'Behavioral Competency',
		dataIndex: 'eginpmsbehavioralcomp-BEHAVIORALCOMP',
		filterable: true,
		sortable: true,
		width: 300,
		editor: 'textfield',
		action: '14A0503961CEBC9D858E3BAD15E91180'
	},{
		text: 'PMS Code Fk',
		dataIndex: 'eginpmsbehavioralcomp-PMSCODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: 'F160DA457B5F420E11D77C45433FE44E'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});