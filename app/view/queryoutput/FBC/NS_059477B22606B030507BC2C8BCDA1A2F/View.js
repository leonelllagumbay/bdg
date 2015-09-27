Ext.define('Form.view.queryoutput.FBC.NS_059477B22606B030507BC2C8BCDA1A2F.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_059477B22606B030507BC2C8BCDA1A2F',
	multiSelect: true,
	titleAlign: 'left',
	title: 'Leonell Lagumbay',
	width: 600,
	height: 300,
	padding: 10,

	store    : 'queryoutput.FBC.NS_059477B22606B030507BC2C8BCDA1A2F.Store',
	
    features: [{	ftype: 'summary',	showSummaryRow: true,
				remoteRoot: 'rr',
			actionend: ''	}],
    plugins: [{	ptype: 'rowediting',	clicksToEdit: 2,
				clicksToMoveEditor: 1,
			actionend: ''	}],
    columns  : [{
					text: 'cin21personalinfoACRNUMBER',
					dataIndex: 'cin21personalinfo~ACRNUMBER',
					summaryType: 'average',
					xtype: 'numbercolumn',
					action: 'E2B35F5A10743D21021586783F69ED33'
				},{
					text: 'Age',
					dataIndex: 'cin21personalinfo~AGE',
					summaryType: 'sum',
					xtype: 'numbercolumn',
					action: '4B9B6BDF0CC65DDFFC95FE5BE9E832CA'
				},{
					text: 'Birthday',
					dataIndex: 'cin21personalinfo~BIRTHDAY',
					xtype: 'datecolumn',
					action: '8C82F36889FAE388BA04A608385A3120'
				},{
					text: 'Birthplace',
					dataIndex: 'cin21personalinfo~BIRTHPLACE',
					action: 'D976FD3D377F40856A7A82362CA63760'
				},{
					text: 'Citizenship',
					dataIndex: 'cin21personalinfo~CITIZENSHIP',
					action: '8E17B1C18642C8194BC930B9D2C9FCB3'
				},{
					text: 'Civil Status',
					dataIndex: 'cin21personalinfo~CIVILSTATUS',
					action: '0D35B0D76075B616B1876E532AAB93A3'
				},{
					text: 'Guid',
					dataIndex: 'cin21personalinfo~GUID',
					action: 'B18737222C1443C8E4F73DAE4BEF2E2E'
				}],
    initComponent: function() {
    	this.tbar = [{
    		text: 'Share'
    	},{
    		text: 'Print'
    	},{
    		text: 'Export to excel'
    	},{
    		text: 'Add data'
    	},{
    		text: 'Edit data'
    	},{
    		text: 'Form Grid Combo'
    	},{
    		text: 'Remove selection'
    	},{
    		text: 'Email'
    	},{
    		text: 'Show Summary'
    	}];
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_059477B22606B030507BC2C8BCDA1A2F.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});