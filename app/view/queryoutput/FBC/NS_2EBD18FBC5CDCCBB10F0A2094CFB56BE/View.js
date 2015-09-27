Ext.define('Form.view.queryoutput.FBC.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE',
	loadMask: true,
	multiSelect: true,
	title: 'Medical History',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Allergies',
		dataIndex: 'cin21medhistory-ALLERGIES',
		filterable: true,
		sortable: true,
		width: 150,
		action: '7782E9D72B8FBCCE3BF5CBCCE7000E30'
	},{
		text: 'Blood Type',
		dataIndex: 'cin21medhistory-BLOODTYPE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '3474277977993A74CB32359C5C4912A3'
	},{
		text: 'Class Code',
		dataIndex: 'cin21medhistory-CLASSCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'EAC4EB2277604CD92EA85A645FD3E31A'
	},{
		text: 'Classification',
		dataIndex: 'cin21medhistory-CLASSIFICATION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'D76F25397B8CD1E80AF57FD08BE5E79C'
	},{
		text: 'Date Consulted',
		dataIndex: 'cin21medhistory-DATECONSULT',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: '37E7E1332F4587A33F65F715DFA887C5'
	},{
		text: 'Dependent Name',
		dataIndex: 'cin21medhistory-DEPENDENTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'F5C418401FDEFBE52D273E6BFA7752E6'
	},{
		text: 'Doctors Name',
		dataIndex: 'cin21medhistory-DOCTORSNAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '8FF0960A234C88AFCF02E6B6AA54AF33'
	},{
		text: 'Findings',
		dataIndex: 'cin21medhistory-FINDINGS',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'D764AEEC235CCFD7E2161F8ADF163AF7'
	},{
		text: 'Hospital',
		dataIndex: 'cin21medhistory-HOSPITAL',
		filterable: true,
		sortable: true,
		width: 150,
		action: '2DF287BBD4C03BDEBDA1DB7AC0B9B5C1'
	},{
		text: 'Left Contact Grade',
		dataIndex: 'cin21medhistory-LEFTCONTACTGRADE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'BF3BE74865E00B2634DA72A6427EC40F'
	},{
		text: 'Left Eye Grade',
		dataIndex: 'cin21medhistory-LEFTEYEGRADE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '3C690F633DFB6D65D5CC9A0408174B98'
	},{
		text: 'Physical Spec',
		dataIndex: 'cin21medhistory-PHYSICALSPEC',
		filterable: true,
		sortable: true,
		width: 150,
		action: '36C2D971ADE2337D670E6F27DCF6504B'
	},{
		text: 'Major Diseases',
		dataIndex: 'cin21medhistory-MAJORDISEASES',
		filterable: true,
		sortable: true,
		width: 150,
		action: '1C667DD09A2C8EFA6284FC85938AE142'
	},{
		text: 'Recommendations',
		dataIndex: 'cin21medhistory-RECOMMENDATIONS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '731C79BE017178F3B11A6D1113AA4913'
	},{
		text: 'Remarks',
		dataIndex: 'cin21medhistory-REMARKS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '1ED74CD36A774EECABACE4A9C6BF204A'
	},{
		text: 'Right Contact Grade',
		dataIndex: 'cin21medhistory-RIGHTCONTACTGRADE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '1F56266028E1891FAA25CF822132041D'
	},{
		text: 'Right Eye Grade',
		dataIndex: 'cin21medhistory-RIGHTEYEGRADE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '39FA7F8FC2A78EEC1741D305D29D1AFE'
	},{
		text: 'Vision',
		dataIndex: 'cin21medhistory-VISSION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '184DDFA110BD8A78A034A051A57593CD'
	},{
		text: 'Wear Contact Lenses',
		dataIndex: 'cin21medhistory-WEARCONTACTLENSES',
		filterable: true,
		sortable: true,
		width: 150,
		action: '55A7FA794FE604DAB445A314E141C836'
	},{
		text: 'Wear Eye Glasses',
		dataIndex: 'cin21medhistory-WEAREYEGLASSES',
		filterable: true,
		sortable: true,
		width: 150,
		action: '34B05CF21B4D6837E0CABF70F647EA45'
	},{
		text: 'X Ray Result',
		dataIndex: 'cin21medhistory-XRAYRESULT',
		filterable: true,
		sortable: true,
		width: 150,
		action: '7F9FEF03CB363CF6CB22AD619B46B187'
	},{
		text: 'Major Ill Surgeries',
		dataIndex: 'cin21medhistory-MAJORILLSURGERIES',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'D42494B28A9B2CD4F5E803AD1E80FA00'
	},{
		text: 'Med Case Number',
		dataIndex: 'cin21medhistory-MEDCASENUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: '9B9AE0B709E3800020084FB9526AFF9C'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});