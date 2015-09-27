Ext.define('Form.view.queryoutput.FBC.NS_2EB5A34BE531D4AFDF7658BE397C60CA.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2EB5A34BE531D4AFDF7658BE397C60CA',
	loadMask: true,
	multiSelect: true,
	title: 'Evaluations',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2EB5A34BE531D4AFDF7658BE397C60CA.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Intel Rating',
		dataIndex: 'cin21evaluations-INTELLRATING',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: '9D750E78C6EF2BB7098EA487189B7E07'
	},{
		text: 'Intel Remarks',
		dataIndex: 'cin21evaluations-INTELREMARKS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '55DB6CBF3F336EE098DE8929C2A92E7C'
	},{
		text: 'Overall Rating',
		dataIndex: 'cin21evaluations-OVERALLRATING',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: '21E3D7DE20872382802410C32F1DA330'
	},{
		text: 'Overall Remarks',
		dataIndex: 'cin21evaluations-OVERALLREMARKS',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'FC708567977D03253B41D6FEC9A20F9A'
	},{
		text: 'Personality Rating',
		dataIndex: 'cin21evaluations-PERSONALITYRATING',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: '89DF613069E6EDA1D5C64BDB002D6D28'
	},{
		text: 'Personality Remarks',
		dataIndex: 'cin21evaluations-PERSONALITYREMARKS',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'FA6CDC78B3ECB93B2695314435EB3216'
	},{
		text: 'Recommendation',
		dataIndex: 'cin21evaluations-RECOMMENDATION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '12E9E20C4885E79323602C6E3A64D704'
	},{
		text: 'Vision Rating',
		dataIndex: 'cin21evaluations-VISIONRATING',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: '9D3726CF61467E6B910E80923802386B'
	},{
		text: 'Vision Remarks',
		dataIndex: 'cin21evaluations-VISIONREMARKS',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'C73A64A17B1B9C5501A95FE1DA4A8AB8'
	},{
		text: 'Work Experience Rating',
		dataIndex: 'cin21evaluations-WORKEXPRATING',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: '7A8B3951E93F85D381870A72558256FD'
	},{
		text: 'Work Experience Remarks',
		dataIndex: 'cin21evaluations-WORKEXPREMARKS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '726EF0D631BF5383C1CF6F120FD3C1CE'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2EB5A34BE531D4AFDF7658BE397C60CA.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});