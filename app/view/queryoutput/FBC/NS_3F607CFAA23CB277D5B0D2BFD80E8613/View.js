Ext.define('Form.view.queryoutput.FBC.NS_3F607CFAA23CB277D5B0D2BFD80E8613.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_3F607CFAA23CB277D5B0D2BFD80E8613',
	loadMask: true,
	multiSelect: true,
	title: 'Performance Appraisal',
	width: 300,
	height: 200,
	padding: '7 25 7 7',
	listeners: {
   select: function(ds,rec) {
      /*get rater grid*/
	  var raterg = Ext.ComponentQuery.query('NS_7EEFCEADE9112062D7B36FD6A5D72D51')[0];
	  if (raterg) {
	      var dparamStruct = {
				eginpmsrater_PMSCODEFK: rec.data['eginpms-PMSCODE']
		  };
		  var raterstore = raterg.getStore();
		  raterstore.load({
			params: {
				extraparams: dparamStruct
			}
		  });  
		  raterstore.proxy.extraParams.extraparams = dparamStruct;
	  }
   }
},

	store    : 'queryoutput.FBC.NS_3F607CFAA23CB277D5B0D2BFD80E8613.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'PMS Code',
		dataIndex: 'eginpms-PMSCODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '3E166055155D370FA23DFB05976A58DA'
	},{
		text: 'Name',
		dataIndex: 'eginpms-PMSNAME',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: '95B2DFB9BD43578BD5B2A8B5271DFE9B'
	},{
		text: 'Frequency',
		dataIndex: 'eginpms-FREQUENCY',
		filterable: true,
		sortable: true,
		width: 150,
		editor: 'textfield',
		action: 'D9C2AE10ED05E32AF3E47ACF6AB91AE2'
	},{
		text: 'Created By',
		dataIndex: 'eginpms-RECCREATEDBY',
		filterable: true,
		sortable: true,
		width: 150,
		action: '937F5B32671F351E603CD31085766E13'
	},{
		text: 'Date Record Created',
		dataIndex: 'eginpms-RECDATECREATED',
		filterable: true,
		sortable: true,
		width: 150,
		xtype: 'datecolumn',
		action: '9B86A8551E93035410C93E587289E63A'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_3F607CFAA23CB277D5B0D2BFD80E8613.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});