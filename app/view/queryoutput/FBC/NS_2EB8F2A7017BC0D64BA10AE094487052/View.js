Ext.define('Form.view.queryoutput.FBC.NS_2EB8F2A7017BC0D64BA10AE094487052.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2EB8F2A7017BC0D64BA10AE094487052',
	loadMask: true,
	multiSelect: true,
	title: 'Family Background',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2EB8F2A7017BC0D64BA10AE094487052.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Name',
		dataIndex: 'cin21familybkgrnd-NAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '297D7AD12B82F46DBB177B013A736818'
	},{
		text: 'Relationship',
		dataIndex: 'cin21familybkgrnd-RELATIONSHIP',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'ED583958BC60B0866CBA1A948E476C94'
	},{
		text: 'Age',
		dataIndex: 'cin21familybkgrnd-AGE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '42BB641E31FEDA0707EC07A2A066DAF0'
	},{
		text: 'Company',
		dataIndex: 'cin21familybkgrnd-COMPANY',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'E612985E05911490C48C000F731557AA'
	},{
		text: 'Occupation',
		dataIndex: 'cin21familybkgrnd-OCCUPATION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '7BDABCC7352F67F069A0559DF0DD39A2'
	},{
		text: 'Address',
		dataIndex: 'cin21familybkgrnd-ADDRESS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '23DAF2B17F4FDF1D97D084309DB1289A'
	},{
		text: 'Birthday',
		dataIndex: 'cin21familybkgrnd-BIRTHDAY',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: 'F727DB8A562E125E2A1DD74AF2028B79'
	},{
		text: 'Civil Status',
		dataIndex: 'cin21familybkgrnd-CIVILSTATUS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '61EDA885E885676EBC116E89A13F44D3'
	},{
		text: 'Citizenship',
		dataIndex: 'cin21familybkgrnd-CITIZENSHIP',
		filterable: true,
		sortable: true,
		width: 150,
		action: '5A9D560B68AA52DC9AAC0C2AA19DD419'
	},{
		text: 'Company Address',
		dataIndex: 'cin21familybkgrnd-COMPANYADDRESS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '60BD000655967C2573EFBF932BE1B246'
	},{
		text: 'Deceased',
		dataIndex: 'cin21familybkgrnd-LIVINGORDEAD',
		filterable: true,
		sortable: true,
		width: 150,
		action: '5F596ACEBE3F5FD0BEF509994B0F6335'
	},{
		text: 'Dependent',
		dataIndex: 'cin21familybkgrnd-DEPENDENT',
		filterable: true,
		sortable: true,
		width: 150,
		action: '47758B80EBD62FC82A84F9F08B93095C'
	},{
		text: 'Gender',
		dataIndex: 'cin21familybkgrnd-SEX',
		filterable: true,
		sortable: true,
		width: 150,
		action: '7428B1C2FEC3D5617AFDB95E8358644F'
	},{
		text: 'Telephone Number',
		dataIndex: 'cin21familybkgrnd-TELEPHONENUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'BB7C4B99BBBBBB983A32C09B5F0A984C'
	},{
		text: 'TIN',
		dataIndex: 'cin21familybkgrnd-TIN',
		filterable: true,
		sortable: true,
		width: 150,
		action: '4D663431BDF4DF1768D05E16F7010F90'
	},{
		text: 'Superior',
		dataIndex: 'cin21familybkgrnd-IMMEDIATE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '255EEBBF84155B272094A7ECDD4EC6C9'
	},{
		text: 'No of Children',
		dataIndex: 'cin21familybkgrnd-NOOFCHILDREN',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: 'C9C72268EAF17AB3A617DBE6279B89E0'
	},{
		text: 'No of Sisters',
		dataIndex: 'cin21familybkgrnd-NOOFSISTERS',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: 'A5FB2BDEF0C6ECCA9526496AE434C69C'
	},{
		text: 'No of Brothers',
		dataIndex: 'cin21familybkgrnd-NOOFBROTHERS',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: '05A8869C4F69896A3BA083C7575D5269'
	},{
		text: 'Live With',
		dataIndex: 'cin21familybkgrnd-LIVEWITH',
		filterable: true,
		sortable: true,
		width: 150,
		action: '0CB2B5E61082E927A884A9B7D1C0AC95'
	},{
		text: 'Hobbies',
		dataIndex: 'cin21familybkgrnd-HOBBIES',
		filterable: true,
		sortable: true,
		width: 150,
		action: '1FE26DE759B62C704B9E528570A6F80B'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2EB8F2A7017BC0D64BA10AE094487052.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});