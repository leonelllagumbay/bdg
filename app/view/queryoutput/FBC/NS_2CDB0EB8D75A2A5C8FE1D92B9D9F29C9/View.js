Ext.define('Form.view.queryoutput.FBC.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9',
	loadMask: true,
	multiSelect: true,
	title: 'Education',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'School Name',
		dataIndex: 'glkschool-SCHOOLNAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'B6A79CCB0E8CB27B608F6F2B2316AF47'
	},{
		text: 'Location',
		dataIndex: 'cin21education-LOCATION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'F7794ED36AF69BC6C53012619AE48EE8'
	},{
		text: 'Course',
		dataIndex: 'glkcourse-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '0693B66385BE2679F17BC040BCD581E8'
	},{
		text: 'Educ Level',
		dataIndex: 'glkeduclevel-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '24AE2825B60EFB1BF98C837FD6D20CD2'
	},{
		text: 'Degree',
		dataIndex: 'glkdegree-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '02C4F84838E0757467494C700AC1C6C2'
	},{
		text: 'Date Begin',
		dataIndex: 'cin21education-DATEBEGIN',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: '8744C22468330E64A308C134804C28EE'
	},{
		text: 'Date Finished',
		dataIndex: 'cin21education-DATEFINISHED',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: 'F82CDBC7269D1FBF4532ECBC52E28CFB'
	},{
		text: 'Is Graduate',
		dataIndex: 'cin21education-GRADUATE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'D94DCEDB0CDE9216A06EEB64BEA5BDDC'
	},{
		text: 'Scholastic Standing',
		dataIndex: 'cin21education-SCHOLASTICSTANDING',
		filterable: true,
		sortable: true,
		width: 150,
		action: '8C0081B08479ACC3662BC114AC1F7CEE'
	},{
		text: 'Honors Received',
		dataIndex: 'cin21education-HONORSRECEIVED',
		filterable: true,
		sortable: true,
		width: 150,
		action: '8B3F31B7EB59CA5DE24EB22145565FC9'
	},{
		text: 'GPA',
		dataIndex: 'cin21education-GPA',
		filterable: true,
		sortable: true,
		width: 150,
		action: '448F974A4C6FC1B3630651AAF6E57E39'
	},{
		text: 'School Code',
		dataIndex: 'cin21education-SCHOOLCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '28D2628BFEEAB7A00B5E17C7C89125BC'
	},{
		text: 'Course Code',
		dataIndex: 'cin21education-COURSECODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '94A6705A0E154DA445183B1833CAA56D'
	},{
		text: 'Level Code',
		dataIndex: 'cin21education-EDUCLEVEL',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'FDD6B3E9407F233B701D048C5525B6F9'
	},{
		text: 'Degree Code',
		dataIndex: 'cin21education-DEGREECODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'AE1AECDC36994B0547B200BDD08EA9B0'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});