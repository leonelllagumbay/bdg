Ext.define('Form.view.queryoutput.FBC.NS_2EC9C9CC94AD3C605475A65DC0B4814D.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_2EC9C9CC94AD3C605475A65DC0B4814D',
	loadMask: true,
	multiSelect: true,
	title: 'Personal Info',
	width: 600,
	height: 400,

	store    : 'queryoutput.FBC.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [],
    columns: [{
		text: 'Birthday',
		dataIndex: 'cin21personalinfo-BIRTHDAY',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: 'FA216ACDA7EA342A47EF651C9CCAF003'
	},{
		text: 'Age',
		dataIndex: 'cin21personalinfo-AGE',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn', format: '0',
		action: 'A66DE1A5D9421B1EB1EACFA61DEAB07B'
	},{
		text: 'Birthplace',
		dataIndex: 'cin21personalinfo-BIRTHPLACE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '372CD92280DCD69ECCA57D26BD7996A8'
	},{
		text: 'Citizenship',
		dataIndex: 'cin21personalinfo-CITIZENSHIP',
		filterable: true,
		sortable: true,
		width: 150,
		action: '3A431B28F7BB5E4B07EFACA2F2334BBC'
	},{
		text: 'City or Province',
		dataIndex: 'cin21personalinfo-CITYPROVINCE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '20FF0961576FE61306C19EC363663C6C'
	},{
		text: 'Civil Status',
		dataIndex: 'cin21personalinfo-CIVILSTATUS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '73014CE6121DF121E825DC92B16718D5'
	},{
		text: 'Contact Address',
		dataIndex: 'cin21personalinfo-CONTACTADDRESS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '841177EA2FDFB5F0E7051E770D4F1E2D'
	},{
		text: 'Contact Address 2',
		dataIndex: 'cin21personalinfo-CONTACTADDRESS2',
		filterable: true,
		sortable: true,
		width: 150,
		action: '67D85DA6D7216ABB2706DA274F030C43'
	},{
		text: 'Contact Address 3',
		dataIndex: 'cin21personalinfo-CONTACTADDRESS3',
		filterable: true,
		sortable: true,
		width: 150,
		action: '87501B27A40BA74C044F83A74AEFE021'
	},{
		text: 'Gender',
		dataIndex: 'cin21personalinfo-SEX',
		filterable: true,
		sortable: true,
		width: 150,
		action: '8C3D569484124E22034CA36575714B99'
	},{
		text: 'ACR Number',
		dataIndex: 'cin21personalinfo-ACRNUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'C31E71F43C558F1FE653C5CE3B4D9F36'
	},{
		text: 'ACR Date Issued',
		dataIndex: 'cin21personalinfo-ACRDATEISSUED',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: 'C3E0833F264047B669966DE4C027450D'
	},{
		text: 'ACR Expiration Date',
		dataIndex: 'cin21personalinfo-ACREXPIRATIONDATE',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: '87ED0E968174C34036D6DFFE269CACCD'
	},{
		text: 'Mobile Number',
		dataIndex: 'cin21personalinfo-CONTACTCELLNUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'B3DFF06F43F657073AFFF7F8896FB900'
	},{
		text: 'Contact Pager No',
		dataIndex: 'cin21personalinfo-CONTACTPAGERNO',
		filterable: true,
		sortable: true,
		width: 150,
		action: '77DB4D00C3B26FE7A5385C353007A0A1'
	},{
		text: 'Telephone Number',
		dataIndex: 'cin21personalinfo-CONTACTTELNO',
		filterable: true,
		sortable: true,
		width: 150,
		action: '8E31035542313CED5EA094805F2929AC'
	},{
		text: 'Email Address',
		dataIndex: 'cin21personalinfo-EMAILADDRESS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '9DBD77470F0235B8C5056D73BAF5CCED'
	},{
		text: 'Height',
		dataIndex: 'cin21personalinfo-HEIGHT',
		filterable: true,
		sortable: true,
		width: 150,
		action: '936A5976EADD21A57EECB99A4737AA1B'
	},{
		text: 'Weight',
		dataIndex: 'cin21personalinfo-WEIGHT',
		filterable: true,
		sortable: true,
		width: 150,
		action: '1C11B1F71C798FA21D626275217563C6'
	},{
		text: 'Language Read',
		dataIndex: 'cin21personalinfo-LANGUAGEREAD',
		filterable: true,
		sortable: true,
		width: 150,
		action: '43F578C90F1F79F8393FFA1831ED5E46'
	},{
		text: 'Language Spoken',
		dataIndex: 'cin21personalinfo-LANGUAGESPOKEN',
		filterable: true,
		sortable: true,
		width: 150,
		action: '512C4DFA9CEBEEFB76DA660C70E9DF40'
	},{
		text: 'Language Written',
		dataIndex: 'cin21personalinfo-LANGUAGEWRITTEN',
		filterable: true,
		sortable: true,
		width: 150,
		action: '21E90FA352FC4242F3034D058D1FE09D'
	},{
		text: 'Maiden Name',
		dataIndex: 'cin21personalinfo-MAIDENNAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'BC8688D0EACB96C413D7EAB12896810E'
	},{
		text: 'Nationality',
		dataIndex: 'cin21personalinfo-NATIONALITY',
		filterable: true,
		sortable: true,
		width: 150,
		action: '8EB6027602F56C66015704E0A1AEE583'
	},{
		text: 'Number of Children',
		dataIndex: 'cin21personalinfo-NUMBEROFCHILDREN',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'numbercolumn',
		action: '9490DC20ACD8050CC2CA7EE065CDC2C0'
	},{
		text: 'Occupation or Company',
		dataIndex: 'cin21personalinfo-OCCUPATIONCOMPANY',
		filterable: true,
		sortable: true,
		width: 150,
		action: '4F0E92F871FB901CE337030E50F61F6F'
	},{
		text: 'Passport Number',
		dataIndex: 'cin21personalinfo-PASSPORTNUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'DB0DFEFB8D3999234704A7D218E304D5'
	},{
		text: 'Passport Date Issued',
		dataIndex: 'cin21personalinfo-PASSPORTDATEISSUED',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: 'AE2290DACDF523237C3ABD020BE28C3A'
	},{
		text: 'Per Cell Number',
		dataIndex: 'cin21personalinfo-PERCELLNUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: '049624A2A6B35E9934AC0AE3000BD9A5'
	},{
		text: 'Period of Residence',
		dataIndex: 'cin21personalinfo-PERIODOFRESIDENCE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'FF753267900EE4AF210E84944D601885'
	},{
		text: 'Per Pager No',
		dataIndex: 'cin21personalinfo-PERPAGERNUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: '2D9E61A081D3BD6CC5D9A1018646FDF3'
	},{
		text: 'Personnel ID No',
		dataIndex: 'cin21personalinfo-PERSONNELIDNO',
		filterable: true,
		sortable: true,
		width: 150,
		action: '2316887EC9CF1E9E809CE924F8544AD5'
	},{
		text: 'Person to Contact',
		dataIndex: 'cin21personalinfo-PERSONTOCONTACT',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'A213802F40F081537430D7A8E58D09F2'
	},{
		text: 'Place of Issuance',
		dataIndex: 'cin21personalinfo-PLACEOFISSUANCE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '60C61A7463A1D13C2D8A13A786D459D0'
	},{
		text: 'Province Period of Residence',
		dataIndex: 'cin21personalinfo-PROVPERIODOFRES',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'C2F4B0D073E6B5B8BBBEBF66ADE30344'
	},{
		text: 'Provincial Tel No',
		dataIndex: 'cin21personalinfo-PROVTELNUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: '0C47B05CFEFC0D561792F37F17922314'
	},{
		text: 'Prov Zip Code',
		dataIndex: 'cin21personalinfo-PROVZIPCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '83554A6BC742BF0D1DE0CF2D6722461A'
	},{
		text: 'Relationship',
		dataIndex: 'cin21personalinfo-RELATIONSHIP',
		filterable: true,
		sortable: true,
		width: 150,
		action: '5089B5A2CA08B4E48840ECDEB70074AB'
	},{
		text: 'Religion Code',
		dataIndex: 'cin21personalinfo-RELIGIONCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '6404396916ECD23928222B11C1F8E0E5'
	},{
		text: 'Spouse Name',
		dataIndex: 'cin21personalinfo-SPOUSENAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '33C6A80FE492ACEBC392A7D171BF9147'
	},{
		text: 'Street or Barrio',
		dataIndex: 'cin21personalinfo-STREETBARRIO',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'AF123C46D12446D9158C21554E0DFAD4'
	},{
		text: 'Street or Barrio 2',
		dataIndex: 'cin21personalinfo-STREETBARRIO2',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'DACAFFA7AAC06212964EC5F79D6B86B5'
	},{
		text: 'Street or Barrio 3',
		dataIndex: 'cin21personalinfo-STREETBARRIO3',
		filterable: true,
		sortable: true,
		width: 150,
		action: '46280CDADD240D509B2C88626AB29D20'
	},{
		text: 'Tel Number 1',
		dataIndex: 'cin21personalinfo-TELEPHONENUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'F2BA0849F8ACE81ED71A62C712EECAD3'
	},{
		text: 'Tel Number 2',
		dataIndex: 'cin21personalinfo-TELEPHONENUMBER2',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'CDA28244F073017BC83D51E50712D6A3'
	},{
		text: 'Tel Number 3',
		dataIndex: 'cin21personalinfo-TELEPHONENUMBER3',
		filterable: true,
		sortable: true,
		width: 150,
		action: '2CC7B638826090FA38339BCC6C85077B'
	},{
		text: 'Town Locality',
		dataIndex: 'cin21personalinfo-TOWNLOCALITY',
		filterable: true,
		sortable: true,
		width: 150,
		action: '98612784DEF12EDD6F178CABEC861FB3'
	},{
		text: 'Zip Code',
		dataIndex: 'cin21personalinfo-ZIPCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: '2DE739A322831B05E94E000F7050310B'
	},{
		text: 'Previous Address',
		dataIndex: 'cin21personalinfo-PREVIOUSADDRESS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '36A7E11BBE052E031AAD93012FFE83EA'
	},{
		text: 'Previous Tel No',
		dataIndex: 'cin21personalinfo-PREVIOUSTELNUMBER',
		filterable: true,
		sortable: true,
		width: 150,
		action: '4A775E174C138E534BF2108DBCFCEEBD'
	},{
		text: 'Previous Zip Code',
		dataIndex: 'cin21personalinfo-PREVIOUSZIPCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'BFE260914BADD79DAF420FAA1E3F9BAA'
	},{
		text: 'Provincial Address',
		dataIndex: 'cin21personalinfo-PROVINCIALADDRESS',
		filterable: true,
		sortable: true,
		width: 150,
		action: '52CFE6302180213DA1BB3DF661174AA6'
	},{
		text: 'Alternative Email',
		dataIndex: 'cin21personalinfo-EMAILADDRESS2',
		filterable: true,
		sortable: true,
		width: 150,
		action: '5AFF649D4DD9DC2D214BF9B0238F6AFB'
	},{
		text: 'Expiration Date',
		dataIndex: 'cin21personalinfo-EXPIRATIONDATE',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: '2B528443D1960DAF826ECCDD561A0A09'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});