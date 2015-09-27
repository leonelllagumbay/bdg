Ext.define('Form.view.queryoutput.FBC.NS_48BE94A2DD9ECDA5486A247307F50D14.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_48BE94A2DD9ECDA5486A247307F50D14',
	multiSelect: true,
	title: 'Renderer - grid',
	width: 300,
	height: 300,
	padding: 10,

	store    : 'queryoutput.FBC.NS_48BE94A2DD9ECDA5486A247307F50D14.Store',
	
    features: [],
    plugins: [],
    columns  : [{
					text: 'A Float',
					dataIndex: 'egintestquery~AFLOAT',
					width: 150,
					renderer: function(value, metaData, record) { metaData.style = 'color: #00AA00;'; return 'P ' + value; },
					xtype: 'numbercolumn',
					action: '3D6A33207C1F58016BC03BF0EE09A9CB'
				},{
					text: 'A Number',
					dataIndex: 'egintestquery~ANUMBER',
					width: 150,
					renderer: function(value, metaData, record) { metaData.style = 'color: #EE0000;'; return 'P ' + value;},
					xtype: 'numbercolumn', format: '0',
								action: '483788091A982C69AC0081D3EF602CFD'
				},{
					text: 'A String',
					dataIndex: 'egintestquery~ASTRING',
					width: 150,
					action: '54074CE0D4F9CE8F34CB58D615AC9F07'
				},{
					text: 'A Text',
					dataIndex: 'egintestquery~ATEXT',
					width: 150,
					action: '8FAA26FAEFC75A72B916AE994D23D5E1'
				}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_48BE94A2DD9ECDA5486A247307F50D14.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});