Ext.define('Form.view.queryoutput.FBC.NS_7EEFCEADE9112062D7B36FD6A5D72D51.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7EEFCEADE9112062D7B36FD6A5D72D51',
	loadMask: true,
	multiSelect: true,
	title: 'Rater',
	width: 300,
	height: 500,
	padding: '7 25 7 7',
	listeners: {
   select: function(ds,rec) {
      /*get rater grid*/
	  var emptoberated = Ext.ComponentQuery.query('NS_7EFF35F8A5AD502E1796C19F3BD0C458')[0];
	  if (emptoberated) {
	      var dparamStruct = {
				eginpmsemp_RATERCODEFK: rec.data['eginpmsrater-RATERCODE'],
				cmfpa_SUPERIORCODE: rec.data['eginpmsrater-RATERPID']
		  };
		  var empstore = emptoberated.getStore();
		  empstore.load({
			params: {
				extraparams: dparamStruct
			}
		  });  
		  empstore.proxy.extraParams.extraparams = dparamStruct;
	  }
   }
},

	store    : 'queryoutput.FBC.NS_7EEFCEADE9112062D7B36FD6A5D72D51.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',actionend: ''	}],
    columns: [{
		text: 'Rater Code',
		dataIndex: 'eginpmsrater-RATERCODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '9F2E00829BC4FDE2EA0BDC4B4E905036'
	},{
		text: 'PMS Code Fk',
		dataIndex: 'eginpmsrater-PMSCODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: 'D5BD9785531C9CAA3332D6BC79E749F5'
	},{
		text: 'Rater PID',
		dataIndex: 'eginpmsrater-RATERPID',
		filterable: true,
		sortable: true,
		width: 40,
		editor: 'textfield',
		action: 'C3644CB6742795A19432770EE9953D5F'
	},{
		text: 'My Personnel ID',
		dataIndex: 'egrgmyibose-PERSONNELIDNO',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '49329D2DEA79A1D6B60EB90AF941DCE1'
	},{
		text: 'My User ID',
		dataIndex: 'egrgmyibose-USERID',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '5DF60E2439172709AC223FF9A1B16326'
	},{
		text: 'First Name',
		dataIndex: 'gmfpeople-FIRSTNAME',
		filterable: true,
		sortable: true,
		flex: 1,
		width: 150,
		action: '4A0FF8286C7BE849BBA89CB9A252B0C5'
	},{
		text: 'Last Name',
		dataIndex: 'gmfpeople-LASTNAME',
		filterable: true,
		sortable: true,
		flex: 1,
		width: 150,
		action: '0F7F0A7898D20CD0E6177318FF1FCB7B'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_7EEFCEADE9112062D7B36FD6A5D72D51.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});