Ext.define('Form.view.queryoutput.FBC.NS_7EFF35F8A5AD502E1796C19F3BD0C458.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7EFF35F8A5AD502E1796C19F3BD0C458',
	loadMask: true,
	multiSelect: true,
	title: 'Employee(s) to be Rated',
	width: 600,
	height: 500,
	padding: 7,
	listeners: {
   select: function(ds,rec) {
      /*get rater grid*/
	  var kraothercomments = Ext.ComponentQuery.query('NS_7F2DFA1BB35774DAAC0B7E6E560AD435')[0];
	  if (kraothercomments) {
	      var dparamStruct = {
				eginpmsempkra_PMSEMPCODEFK: rec.data['eginpmsemp-PMSEMPCODE']
		  };
		  var empstore = kraothercomments.getStore();
		  empstore.load({
			params: {
				extraparams: dparamStruct
			}
		  });  
		  empstore.proxy.extraParams.extraparams = dparamStruct;
	  }
   }
},

	store    : 'queryoutput.FBC.NS_7EFF35F8A5AD502E1796C19F3BD0C458.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'PMS Employee Code',
		dataIndex: 'eginpmsemp-PMSEMPCODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '4B8998B5DF3630FA9A79D9A1AB56E50A'
	},{
		text: 'Personnel Id No',
		dataIndex: 'eginpmsemp-PERSONNELIDNO',
		filterable: true,
		sortable: true,
		width: 100,
		editor: 'textfield',
		action: '984EF5C0CCB7CC93E56FDA5C9638A51A'
	},{
		text: 'Rater Code Fk',
		dataIndex: 'eginpmsemp-RATERCODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '6005264111F2C3F05C849F109CDD877F'
	},{
		text: 'Date',
		dataIndex: 'eginpmsemp-RECDATECREATED',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		xtype: 'datecolumn',
		action: '5E55313179B678ADE55C024849DA40CC'
	},{
		text: 'First Name',
		dataIndex: 'cmfpa-FIRSTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '285A3FFD6747BEE5502BAA4872D4DE6C'
	},{
		text: 'Last Name',
		dataIndex: 'cmfpa-LASTNAME',
		filterable: true,
		sortable: true,
		width: 150,
		action: '5B0ACA42BB84B24C7FBD6F53C319E7FA'
	},{
		text: 'Position Code',
		dataIndex: 'clkposition-POSITIONCODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: 'F5A87E351D44C7AB6791D2C0003D8017'
	},{
		text: 'Position',
		dataIndex: 'clkposition-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: '7AE15043C2D33429EE5CA0DB516C91E9'
	},{
		text: 'cmfpa PID',
		dataIndex: 'cmfpa-PERSONNELIDNO',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '97721CC008EBF4447C6A7A0007E9DEAC'
	},{
		text: 'Department',
		dataIndex: 'clkdepartment-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'C374BFF3F291AA12D7C1587D11401357'
	},{
		text: 'Division',
		dataIndex: 'clkdivision-DESCRIPTION',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'EA5D12BD91D69BEBCB6140349C10A43C'
	},{
		text: 'Immediate Superior',
		dataIndex: 'cmfpa-SUPERIORCODE',
		filterable: true,
		sortable: true,
		width: 150,
		action: 'D4D9C373371D04913487E1B4F64C0437'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_7EFF35F8A5AD502E1796C19F3BD0C458.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});