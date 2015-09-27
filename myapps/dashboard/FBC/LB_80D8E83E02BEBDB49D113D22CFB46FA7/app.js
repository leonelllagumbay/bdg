
		Ext.Loader.setConfig({enabled: true});
		Ext.Loader.setPath('Ext.ux', '../../../../scripts/ext-4.2.2/examples/ux');
		Ext.application({
			requires: [
				'Ext.container.Viewport',
				'Ext.direct.*',
			    'Ext.data.*',
			    'Ext.util.*',
				'Ext.panel.*',
				'Ext.layout.*',
				'Ext.toolbar.*',
				'Ext.ux.grid.FiltersFeature',
				'Ext.grid.plugin.*',
				'Ext.ux.ajax.JsonSimlet',
			    'Ext.ux.ajax.SimManager',
				'Ext.button.*',
				'Ext.grid.*',
				'Ext.form.*',
				'Ext.chart.*',
				'Ext.dd.*',
				'Ext.picker.*',
				'Ext.resizer.*',
				'Ext.menu.*',
				'Ext.state.*',
				'Ext.tree.*',
				'Ext.ux.grid.Printer'
			],
			name: 'Form',
			controllers: ['dashboard.FBC.LB_80D8E83E02BEBDB49D113D22CFB46FA7.Controller','queryoutput.FBC.NS_3F607CFAA23CB277D5B0D2BFD80E8613.Controller','queryoutput.FBC.NS_7EEFCEADE9112062D7B36FD6A5D72D51.Controller','queryoutput.FBC.NS_7EFF35F8A5AD502E1796C19F3BD0C458.Controller','queryoutput.FBC.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.Controller','queryoutput.FBC.NS_7F51BEEEA06D8FF53401E9307A6E8030.Controller','queryoutput.FBC.NS_7F83CD85B0B7BB82976759BDED104907.Controller','queryoutput.FBC.NS_7F90DFD609223C063FAAD035CB569681.Controller','queryoutput.FBC.NS_7FA56882E5332BCA44B0389F085788F5.Controller','queryoutput.FBC.NS_7FBD7325DA0172D1104151C954EF979D.Controller','queryoutput.FBC.NS_7FE54E13F11CD85369BA5D1AA3D80A43.Controller','queryoutput.FBC.NS_80C9F6FC90B74FB7FDF3B78C69508B26.Controller','queryoutput.FBC.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.Controller','queryoutput.FBC.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.Controller'],
			appFolder: '../../../../app',
			init: function(app) {
				Ext.direct.Manager.addProvider(Ext.LB_80D8E83E02BEBDB49D113D22CFB46FA7.APIDesc);;
		Ext.direct.Manager.addProvider(Ext.NS_3F607CFAA23CB277D5B0D2BFD80E8613.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_7EEFCEADE9112062D7B36FD6A5D72D51.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_7EFF35F8A5AD502E1796C19F3BD0C458.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_7F51BEEEA06D8FF53401E9307A6E8030.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_7F83CD85B0B7BB82976759BDED104907.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_7F90DFD609223C063FAAD035CB569681.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_7FA56882E5332BCA44B0389F085788F5.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_7FBD7325DA0172D1104151C954EF979D.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_7FE54E13F11CD85369BA5D1AA3D80A43.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_80C9F6FC90B74FB7FDF3B78C69508B26.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.APIDesc)
			},
			launch: function(){
				console.log('liveboard app launched');
				Ext.create('Ext.panel.Panel', {
				 	title: 'Performance Appraisal',  
				 	
					layout: {
						type: 'table',
						// The total column count must be specified here
				        columns: 4
					},
					items: [{xtype: 'NS_3F607CFAA23CB277D5B0D2BFD80E8613', rowspan: 1, colspan: 1   
		},{xtype: 'NS_7EEFCEADE9112062D7B36FD6A5D72D51', rowspan: 2, colspan: 1   
		},{xtype: 'NS_7EFF35F8A5AD502E1796C19F3BD0C458', rowspan: 2, colspan: 2   
		},{xtype: 'NS_7F2DFA1BB35774DAAC0B7E6E560AD435', rowspan: 1, colspan: 1   
		},{xtype: 'tabpanel', items: [{xtype: 'NS_7F51BEEEA06D8FF53401E9307A6E8030'
				},{xtype: 'NS_7F83CD85B0B7BB82976759BDED104907'
				},{xtype: 'NS_7F90DFD609223C063FAAD035CB569681'
				},{xtype: 'NS_7FA56882E5332BCA44B0389F085788F5'
				},{xtype: 'NS_7FBD7325DA0172D1104151C954EF979D'}], rowspan: 1, colspan: 4  ,padding: 7 
		},{xtype: 'NS_7FE54E13F11CD85369BA5D1AA3D80A43', rowspan: 1, colspan: 2   
		},{xtype: 'NS_80C9F6FC90B74FB7FDF3B78C69508B26', rowspan: 1, colspan: 2   
		},{xtype: 'NS_F6F7A8DDCA320C91EA5C9D59DBEAD714', rowspan: 1, colspan: 2   
		},{xtype: 'NS_F6CC55E8F4D96F2C8E04B3AADBC93381', rowspan: 1, colspan: 2   }],
					renderTo: Ext.getBody()
				});
			}
		});