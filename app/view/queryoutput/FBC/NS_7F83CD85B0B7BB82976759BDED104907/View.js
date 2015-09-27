Ext.define('Form.view.queryoutput.FBC.NS_7F83CD85B0B7BB82976759BDED104907.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7F83CD85B0B7BB82976759BDED104907',
	loadMask: true,
	multiSelect: true,
	title: 'Behavioral Assessment',
	width: 1000,
	height: 500,
	padding: 7,

	store    : 'queryoutput.FBC.NS_7F83CD85B0B7BB82976759BDED104907.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	},{	ftype: 'summary',	showSummaryRow: true,
			actionend: ''	},{	ftype: 'grouping',	collapsible: false,
				enableGroupingMenu: false,
				enableNoGroups: false,
				hideGroupedHeader: true,
				showSummaryRow: true,
				startCollapsed: false,
			actionend: ''	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'BA Code',
		dataIndex: 'eginpmsempba-BACODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: 'FD2A1EED6AE3119B1AAEBB8135ACFEFB'
	},{
		text: 'KRA Code FK',
		dataIndex: 'eginpmsempba-KRACODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		renderer: function(value,p,record) { 	var kracode = Ext.ComponentQuery.query("NS_7F2DFA1BB35774DAAC0B7E6E560AD435")[0]; /* Performance Appraisal */ 	var krasel = kracode.getSelectionModel().getSelection()[0]; 	record.data["eginpmsempba-KRACODEFK"] = krasel.data['eginpmsempkra-KRACODE']; 	if (krasel) { 		 return krasel.data['eginpmsempkra-KRACODE']; 	}  	return value; },
		action: 'CBDA56581224CCE6C448DAE6E7DCB1C8'
	},{
		text: 'BC Code Fk',
		dataIndex: 'eginpmsempba-BEHAVIORALCOMPCODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '25DCA380C36EF9FFBF8E3D1FED8CADC8'
	},{
		text: 'The Group',
		dataIndex: 'eginpmsbehavioralcomp-DGROUP',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'DE03A830CE392F38E7469329FD241C18'
	},{
		text: 'Subgroup',
		dataIndex: 'eginpmsbehavioralcomp-SUBGROUP',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'D6E40138CC660CBC76BFC00CE0ABB8F1'
	},{
		text: 'BEHAVIORAL COMPETENCIES',
		dataIndex: 'eginpmsbehavioralcomp-BEHAVIORALCOMP',
		filterable: true,
		sortable: true,
		width: 500,
		summaryType: 'count',
		summaryRenderer: function(value, summaryData, dataIndex) {
    return Ext.String.format('<b>{0}</b>','OVERALL RATING for the BEHAVIORAL ASSESSMENT'); 
},
		action: '14A0503961CEBC9D858E3BAD15E91180'
	},{
		text: 'RATING',
		dataIndex: 'eginpmsempba-RATING',
		filterable: true,
		sortable: true,
		width: 130,
		editor: 'combobox',
		summaryType: 'sum',
		summaryRenderer: function(value, summaryData, dataIndex) {
    return Ext.String.format('<b>{0}</b>', value); 
},
		xtype: 'numbercolumn',
		action: '87D460B52A488D3D3E440A1A426F611D'
	},{
		text: 'COMMENTS',
		dataIndex: 'eginpmsempba-COMMENTS',
		filterable: true,
		sortable: true,
		width: 350,
		editor: 'textfield',
		action: '7E64F89A0CC189840CE6D69FB666FA8E'
	},{
		text: 'Behavioral Competency Code',
		dataIndex: 'eginpmsbehavioralcomp-BEHAVIORALCOMPCODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '7957C2E3C107DE6967ED4F5CA63E9B3B'
	},{
		text: 'The Order',
		dataIndex: 'eginpmsbehavioralcomp-BCORDER',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		xtype: 'numbercolumn', format: '0',
		action: '56EF56584C08D0BC4229F90BE28D3BA2'
	},{
		text: 'KRA Code',
		dataIndex: 'eginpmsempkra-KRACODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '3CB8E6912BB913769CE6F39460F4A73C'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_7F83CD85B0B7BB82976759BDED104907.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});