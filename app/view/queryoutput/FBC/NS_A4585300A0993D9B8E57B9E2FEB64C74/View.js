Ext.define('Form.view.queryoutput.FBC.NS_A4585300A0993D9B8E57B9E2FEB64C74.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_A4585300A0993D9B8E57B9E2FEB64C74',
	multiSelect: true,
	titleAlign: 'left',
	title: 'Sample Title',
	animCollapse: true,
	emptyText: 'This is the empty text',
	columnLines: true,
	selModel: Ext.create('Ext.selection.CheckboxModel'),
	viewConfig: {  forceFit: false,trackOver: false,  emptyText: '<h1 style="margin:20px">No matching results</h1>' },

	store    : 'queryoutput.FBC.NS_A4585300A0993D9B8E57B9E2FEB64C74.Store',
	
    features: [{	ftype: 'summary',actionend: ''	}],
    plugins: [],
    columns  : [{
					text: 'cin21educationCOURSECODE',
					dataIndex: 'cin21education~COURSECODE',
					align: 'center',
					flex: 1,
					xtype: 'checkcolumn',
					action: '7DBC697991F452455C08C0D6C70AE847'
				},{
					text: 'a a a',
					dataIndex: 'cin21education~DATEBEGIN',
					flex: 1,
					xtype: 'datecolumn',
					action: 'A9E27C9E22CC32C1ACFDCAE399072AD5'
				},{
					text: 'b bb',
					dataIndex: 'cin21education~DATEFINISHED',
					xtype: 'datecolumn',
					action: 'E5BFF8A40DB36D5E42E1FCD72C78A8D0'
				},{
					text: 'cin21empextraPERSONNELIDNO',
					dataIndex: 'cin21empextra~PERSONNELIDNO',
					xtype: 'numbercolumn',
					action: '626C6FE083144C608487D40676F8F784'
				},{
					text: 'cin21educationPERSONNELIDNO',
					dataIndex: 'cin21education~PERSONNELIDNO',
					action: 'A5279760AFB2EEB60B92DB39AE15E9D8'
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
		        store: 'queryoutput.FBC.NS_A4585300A0993D9B8E57B9E2FEB64C74.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});