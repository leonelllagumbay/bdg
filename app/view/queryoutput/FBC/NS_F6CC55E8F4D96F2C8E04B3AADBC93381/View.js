Ext.define('Form.view.queryoutput.FBC.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_F6CC55E8F4D96F2C8E04B3AADBC93381',
	loadMask: true,
	multiSelect: true,
	title: 'List of Key Result Areas',
	width: 600,
	height: 500,
	padding: 7,
	closable: true,
	collapsible: true,

	store    : 'queryoutput.FBC.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'cellediting',	clicksToEdit: 2,
			actionend: ''	},{	ptype: 'rowexpander',	expandOnDblClick: false,
				selectRowOnExpand: true,
			rowBodyTpl : [
	'<p><b>KRA Code:</b>  {eglkpmskeyresultarea-KEYRESULTAREACODE}</p>',
    '<p><b>Key Result Area:</b>  {eglkpmskeyresultarea-KEYRESULTAREAS}</p>',
	'<p><b>Objective:</b>  {eglkpmskeyresultarea-OBJECTIVE}</p>',
	'<p><b>Key Result Indicator:</b>  {eglkpmskeyresultarea-KEYRESULTINDICATOR}</p>',
],actionend: ''	}],
    columns: [{
		text: 'Key Result Area Code',
		dataIndex: 'eglkpmskeyresultarea-KEYRESULTAREACODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '142BE6D8B5645D4DE9963C0BE9640E47'
	},{
		text: 'Key Result Area',
		dataIndex: 'eglkpmskeyresultarea-KEYRESULTAREAS',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: 'F5FDBD3774FB1BBC2E624D227F9D60C9'
	},{
		text: 'Objective',
		dataIndex: 'eglkpmskeyresultarea-OBJECTIVE',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: '0266D173FCB824A5759C564FC24FE9EC'
	},{
		text: 'Key Result Indicator',
		dataIndex: 'eglkpmskeyresultarea-KEYRESULTINDICATOR',
		filterable: true,
		sortable: true,
		flex: 1,
		width: 150,
		editor: 'textfield',
		action: 'CECE6D6B7AF95BF28629BB9CA2BBFC72'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});