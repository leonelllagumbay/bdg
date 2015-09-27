Ext.define('Form.view.queryoutput.FBC.NS_48D7785FC91A7309FDA64C3B4255E270.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_48D7785FC91A7309FDA64C3B4255E270',
	multiSelect: true,
	title: 'Cell Editing and Checkbox Selection',
	width: 300,
	height: 300,
	padding: 10,
	selType: 'checkboxmodel',

	store    : 'queryoutput.FBC.NS_48D7785FC91A7309FDA64C3B4255E270.Store',
	
    features: [],
    plugins: [{	ptype: 'cellediting',actionend: ''	}],
    columns  : [{
					text: 'egintestqueryTESTID',
					dataIndex: 'egintestquery~TESTID',
					width: 150,
					xtype: 'numbercolumn', format: '0',
								action: 'E3C7C73E4038C9196E0C0E82B18D8B0D'
				},{
					text: 'A Float',
					dataIndex: 'egintestquery~AFLOAT',
					width: 150,
					editor: 'numberfield',
					xtype: 'numbercolumn',
					action: '3D6A33207C1F58016BC03BF0EE09A9CB'
				},{
					text: 'A Number',
					dataIndex: 'egintestquery~ANUMBER',
					width: 150,
					editor: 'numberfield',
					xtype: 'numbercolumn', format: '0',
								action: '483788091A982C69AC0081D3EF602CFD'
				},{
					text: 'A String',
					dataIndex: 'egintestquery~ASTRING',
					width: 150,
					editor: 'textfield',
					action: '54074CE0D4F9CE8F34CB58D615AC9F07'
				},{
					text: 'A Text',
					dataIndex: 'egintestquery~ATEXT',
					width: 150,
					editor: 'textfield',
					action: '8FAA26FAEFC75A72B916AE994D23D5E1'
				},{
					text: 'A Time',
					dataIndex: 'egintestquery~ATIME',
					width: 150,
					editor: 'timefield',
					action: 'CA3BC9ED6787E0BF940BCB937BAF2B40'
				},{
					text: 'A Date Time',
					dataIndex: 'egintestquery~ADATETIME',
					width: 150,
					editor: 'datefield',
					xtype: 'datecolumn',
					action: '13DA0DEFB43D3B82861C87FF8D7F3B68'
				}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_48D7785FC91A7309FDA64C3B4255E270.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});