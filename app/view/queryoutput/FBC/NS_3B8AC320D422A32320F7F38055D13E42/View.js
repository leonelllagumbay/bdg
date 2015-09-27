Ext.define('Form.view.queryoutput.FBC.NS_3B8AC320D422A32320F7F38055D13E42.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_3B8AC320D422A32320F7F38055D13E42',
	multiSelect: true,
	title: 'The Query A',
	width: 600,
	height: 300,
	padding: 10,

	store    : 'queryoutput.FBC.NS_3B8AC320D422A32320F7F38055D13E42.Store',
	
    features: [],
    plugins: [],
    columns  : [{
					text: 'cin21achievementsAWARDTITLE',
					dataIndex: 'cin21achievements~AWARDTITLE',
					action: 'DD5B2DA11EC33E00908637062BBEB8AE'
				},{
					text: 'cin21achievementsNATURECATEGORY',
					dataIndex: 'cin21achievements~NATURECATEGORY',
					action: 'F73938BBF28015E5688B745A883D642B'
				},{
					text: 'cin21achievementsPERSONNELIDNO',
					dataIndex: 'cin21achievements~PERSONNELIDNO',
					action: 'EDDBDD72888B3906DB7E3177FFF85247'
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
		        store: 'queryoutput.FBC.NS_3B8AC320D422A32320F7F38055D13E42.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});