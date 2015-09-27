Ext.define('Form.view.queryoutput.FBC.NS_48CE9210F7788560FFBD7697C62E54F8.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_48CE9210F7788560FFBD7697C62E54F8',
	multiSelect: true,
	title: 'Row Body and Expander',
	width: 300,
	height: 300,
	padding: 10,

	store    : 'queryoutput.FBC.NS_48CE9210F7788560FFBD7697C62E54F8.Store',
	
    features: [],
    plugins: [{	ptype: 'rowexpander',	expandOnDblClick: true,
			rowBodyTpl : new Ext.XTemplate(
            '<p><b>Company:</b> {egintestquery~ASTRING}</p>',
            '<p><b>Change:</b> {egintestquery~ANUMBER:this.formatChange}</p><br>',
            '<p><b>Summary:</b> {egintestquery~AFLOAT}</p>',
        {
            formatChange: function(v){
                var color = v >= 0 ? 'green' : 'red';
                return '<span style="color: ' + color + ';">' + Ext.util.Format.usMoney(v) + '</span>';
            }
        }),actionend: ''	}],
    columns  : [{
					text: 'A Date Time',
					dataIndex: 'egintestquery~ADATETIME',
					width: 150,
					xtype: 'datecolumn',
					action: '13DA0DEFB43D3B82861C87FF8D7F3B68'
				},{
					text: 'A Float',
					dataIndex: 'egintestquery~AFLOAT',
					width: 150,
					xtype: 'numbercolumn',
					action: '3D6A33207C1F58016BC03BF0EE09A9CB'
				},{
					text: 'A Number',
					dataIndex: 'egintestquery~ANUMBER',
					width: 150,
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
				},{
					text: 'A Time',
					dataIndex: 'egintestquery~ATIME',
					width: 150,
					action: 'CA3BC9ED6787E0BF940BCB937BAF2B40'
				},{
					text: 'egintestqueryTESTID',
					dataIndex: 'egintestquery~TESTID',
					width: 150,
					xtype: 'numbercolumn', format: '0',
								action: 'E3C7C73E4038C9196E0C0E82B18D8B0D'
				}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_48CE9210F7788560FFBD7697C62E54F8.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});