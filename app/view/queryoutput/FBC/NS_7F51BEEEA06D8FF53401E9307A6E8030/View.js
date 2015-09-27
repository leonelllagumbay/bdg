Ext.define('Form.view.queryoutput.FBC.NS_7F51BEEEA06D8FF53401E9307A6E8030.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7F51BEEEA06D8FF53401E9307A6E8030',
	loadMask: true,
	multiSelect: true,
	title: 'Key Result Areas and Key Performance Indicators',
	width: 1000,
	height: 500,
	padding: 7,

	store    : 'queryoutput.FBC.NS_7F51BEEEA06D8FF53401E9307A6E8030.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	},{	ftype: 'summary',actionend: ''	}],
    plugins: [{	ptype: 'cellediting',	clicksToEdit: 2,
			actionend: ''	},{	ptype: 'rowexpander',	expandOnDblClick: false,
			rowBodyTpl : [
	'<p><b>Key Result Area:</b>  {eglkpmskeyresultarea-KEYRESULTAREAS}</p>',
	'<p><b>Objective:</b>  {eglkpmskeyresultarea-OBJECTIVE}</p>',
	'<p><b>Key Result Indicator:</b>  {eglkpmskeyresultarea-KEYRESULTINDICATOR}</p>',
],actionend: ''	}],
    columns: [{
		text: 'No.',
		dataIndex: 'eginpmsempkraitems-KRAITEMCODE',
		filterable: true,
		sortable: true,
		width: 40,
		disabled: true,
		xtype: 'numbercolumn', format: '0',
		action: '2020549FCE005DA5A97E7A03B37444F2'
	},{
		text: 'Key Result Areas (KRA)',
		dataIndex: 'eglkpmskeyresultarea-KEYRESULTAREAS',
		filterable: true,
		sortable: true,
		width: 200,
		action: 'F5FDBD3774FB1BBC2E624D227F9D60C9'
	},{
		text: 'Objective',
		dataIndex: 'eglkpmskeyresultarea-OBJECTIVE',
		filterable: true,
		sortable: true,
		width: 250,
		action: '0266D173FCB824A5759C564FC24FE9EC'
	},{
		text: 'Key Performance Indicator or Standard',
		dataIndex: 'eglkpmskeyresultarea-KEYRESULTINDICATOR',
		filterable: true,
		sortable: true,
		width: 300,
		action: 'CECE6D6B7AF95BF28629BB9CA2BBFC72'
	},{
		text: 'Weight',
		dataIndex: 'eginpmsempkraitems-WEIGHT',
		filterable: true,
		sortable: true,
		width: 70,
		editor: 'numberfield',
		summaryType: 'sum',
		summaryRenderer: function(value, summaryData, dataIndex) {
    return Ext.String.format('<b>{0}</b>', value); 
},
		xtype: 'numbercolumn',
		action: 'C405508920C07BAE2CCC66C57CB27F1A'
	},{
		text: 'Accomplishments',
		dataIndex: 'eginpmsempkraitems-ACCOMPLISHMENTS',
		filterable: true,
		sortable: true,
		width: 200,
		editor: 'textfield',
		action: '7EDB5A090EA211C3F7AD934FBFA03AC1'
	},{
		text: 'Rating',
		dataIndex: 'eginpmsempkraitems-RATING',
		filterable: true,
		sortable: true,
		width: 100,
		editor: 'combobox',
		action: '1091E90BF9C454800F1FDE56CD6ADF2A'
	},{
		text: 'Weighted Rating',
		dataIndex: 'eginpmsempkraitems-WEIGHTEDRATING',
		filterable: true,
		sortable: true,
		width: 100,
		editor: 'numberfield',
		summaryType: 'sum',
		summaryRenderer: function(value, summaryData, dataIndex) {
    return Ext.String.format('<b>{0}</b>', value); 
},
		xtype: 'numbercolumn',
		action: '2867CAA301517D7F3FAD8CFD8C42FBA1'
	},{
		text: 'Comments',
		dataIndex: 'eginpmsempkraitems-COMMENTS',
		filterable: true,
		sortable: true,
		width: 300,
		editor: 'textfield',
		action: 'E0928E850DBEC328802D1F3E76A1149A'
	},{
		text: 'KRA Code Fk',
		dataIndex: 'eginpmsempkraitems-KRACODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '083FE9E0D4E9B6F1B9E602B0E6AE1E12'
	},{
		text: 'Key Result Area Code Fk',
		dataIndex: 'eginpmsempkraitems-KEYRESULTAREACODEFK',
		filterable: true,
		sortable: true,
		width: 50,
		editor: 'textfield',
		action: '950E23D641963887E8B77FC419785C9A'
	},{
		text: 'Key Result Area Code',
		dataIndex: 'eglkpmskeyresultarea-KEYRESULTAREACODE',
		filterable: true,
		sortable: true,
		width: 50,
		disabled: true,
		hidden: true,
		action: '142BE6D8B5645D4DE9963C0BE9640E47'
	},{
		text: 'Assessment Period From',
		dataIndex: 'eginpmsempkra-ASSESSMENTPERIODFROM',
		filterable: true,
		sortable: true,
		width: 150,
		disabled: true,
		hidden: true,
		xtype: 'datecolumn',
		action: '44A4123431A958AA2BA06619E020BC2E'
	},{
		text: 'Assessment Period To',
		dataIndex: 'eginpmsempkra-ASSESSMENTPERIODTO',
		filterable: true,
		sortable: true,
		width: 150,
		disabled: true,
		hidden: true,
		xtype: 'datecolumn',
		action: '75A0115F9CC10C3E927EC8C90796A667'
	},{
		text: 'PMS Emp Code Fk',
		dataIndex: 'eginpmsempkra-PMSEMPCODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		disabled: true,
		hidden: true,
		action: '915E4CADC7B406F8CE9A84F88484A805'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_7F51BEEEA06D8FF53401E9307A6E8030.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});