
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
			controllers: ['dashboard.FBC.LB_53DBEE0CBC597220C154F82F3569438E.Controller','queryoutput.FBC.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.Controller','queryoutput.FBC.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Controller','queryoutput.FBC.NS_387B5E33B26001E52294FBB5C3F16A19.Controller','queryoutput.FBC.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Controller','queryoutput.FBC.NS_2EB8F2A7017BC0D64BA10AE094487052.Controller','queryoutput.FBC.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.Controller','queryoutput.FBC.NS_2C00DDDEC1818E01004206E638E9EEDF.Controller','queryoutput.FBC.NS_2E5DF68DD8C9C22E35C3BA83917C1016.Controller','queryoutput.FBC.NS_2EB36DCDD5008766558EB666CD0ABA99.Controller','queryoutput.FBC.NS_51C021FCD2BE8380E4E874578E885A28.Controller','queryoutput.FBC.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Controller','queryoutput.FBC.NS_2EDB6F3AD5A2279C9E6B8690031891A8.Controller','queryoutput.FBC.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.Controller','queryoutput.FBC.NS_2ECCDD3A98CCBCB8A067E085619C45D4.Controller','queryoutput.FBC.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.Controller','queryoutput.FBC.NS_2EB5A34BE531D4AFDF7658BE397C60CA.Controller','queryoutput.FBC.NS_2DEB4B28CB7237C3F68289B40A6B42F6.Controller','queryoutput.FBC.NS_2CA402E29A563C0A77A4E384F62AA72B.Controller','queryoutput.FBC.NS_2C5E8A1F92610514C6746E94C9F0D587.Controller'],
			appFolder: '../../../../app',
			init: function(app) {
				Ext.direct.Manager.addProvider(Ext.LB_53DBEE0CBC597220C154F82F3569438E.APIDesc);;
		Ext.direct.Manager.addProvider(Ext.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_48B2EBE0C7002A9E1FF596E5398F02A8.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_387B5E33B26001E52294FBB5C3F16A19.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2EC9C9CC94AD3C605475A65DC0B4814D.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2EB8F2A7017BC0D64BA10AE094487052.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2C00DDDEC1818E01004206E638E9EEDF.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2E5DF68DD8C9C22E35C3BA83917C1016.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2EB36DCDD5008766558EB666CD0ABA99.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_51C021FCD2BE8380E4E874578E885A28.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2EDD7067BEAD092F217F5D4E0CE400B4.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2EDB6F3AD5A2279C9E6B8690031891A8.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2ECCDD3A98CCBCB8A067E085619C45D4.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2EB5A34BE531D4AFDF7658BE397C60CA.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2DEB4B28CB7237C3F68289B40A6B42F6.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2CA402E29A563C0A77A4E384F62AA72B.APIDesc);
		Ext.direct.Manager.addProvider(Ext.NS_2C5E8A1F92610514C6746E94C9F0D587.APIDesc)
			},
			launch: function(){
				console.log('liveboard app launched');
				Ext.create('Ext.panel.Panel', {
				 	title: 'User Liveboard',  
				 	
					layout: {
						type: 'table',
						// The total column count must be specified here
				        columns: 3
					},
					items: [{xtype: 'NS_1B6EC9A20EAEF9391311AAEDBB9B82B5', rowspan: 1, colspan: 1   
		},{xtype: 'NS_48B2EBE0C7002A9E1FF596E5398F02A8', rowspan: 1, colspan: 2   
		},{xtype: 'NS_387B5E33B26001E52294FBB5C3F16A19', rowspan: 1, colspan: 1   
		},{xtype: 'tabpanel', items: [{xtype: 'NS_2EC9C9CC94AD3C605475A65DC0B4814D',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2EC9C9CC94AD3C605475A65DC0B4814D')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2EB8F2A7017BC0D64BA10AE094487052',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2EB8F2A7017BC0D64BA10AE094487052')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2C00DDDEC1818E01004206E638E9EEDF',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2C00DDDEC1818E01004206E638E9EEDF')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2E5DF68DD8C9C22E35C3BA83917C1016',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2E5DF68DD8C9C22E35C3BA83917C1016')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2EB36DCDD5008766558EB666CD0ABA99',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2EB36DCDD5008766558EB666CD0ABA99')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_51C021FCD2BE8380E4E874578E885A28',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_51C021FCD2BE8380E4E874578E885A28')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2EDD7067BEAD092F217F5D4E0CE400B4',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2EDD7067BEAD092F217F5D4E0CE400B4')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2EDB6F3AD5A2279C9E6B8690031891A8',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2EDB6F3AD5A2279C9E6B8690031891A8')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2ED4C4E3EDF50F1325EB61EAD366F0BC',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2ED4C4E3EDF50F1325EB61EAD366F0BC')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2ECCDD3A98CCBCB8A067E085619C45D4',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2ECCDD3A98CCBCB8A067E085619C45D4')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2EB5A34BE531D4AFDF7658BE397C60CA',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2EB5A34BE531D4AFDF7658BE397C60CA')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2DEB4B28CB7237C3F68289B40A6B42F6',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2DEB4B28CB7237C3F68289B40A6B42F6')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2CA402E29A563C0A77A4E384F62AA72B',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2CA402E29A563C0A77A4E384F62AA72B')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}
					},{xtype: 'NS_2C5E8A1F92610514C6746E94C9F0D587',tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('NS_2C5E8A1F92610514C6746E94C9F0D587')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}}], rowspan: 1, colspan: 2   }],
					renderTo: Ext.getBody()
				});
			}
		});