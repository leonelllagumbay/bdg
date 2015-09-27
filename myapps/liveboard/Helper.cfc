/**
 * Helper
 *
 * @author LEONELL
 * @date 7/1/15
 **/
component accessors=true output=false persistent=false {

	public void function setController(required string liveboardcode, required string liveboardcodeNS, required any lbsource, required array lbitemsource) {

		Savecontent variable="controller" {
		WriteOutput("Ext.define('Form.controller.dashboard.#ucase(session.companycode)#.#ucase(liveboardcodeNS)#.Controller', {
		   	extend: 'Ext.app.Controller',
		   	views: ['dashboard.#ucase(session.companycode)#.#ucase(liveboardcodeNS)#.View'],
		   	models: ['dashboard.#ucase(session.companycode)#.#ucase(liveboardcodeNS)#.Model'],
		   	stores: ['dashboard.#ucase(session.companycode)#.#ucase(liveboardcodeNS)#.Store'],
		   		init: function() {
		   			this.control({
		   				'panel': {
		   					render: this.initPanel
		   				}
		   			})
		   		},
		   		initPanel: function(b) {
		   			console.log('init panel');
		   		}
		})");
		}

		var dpath = ExpandPath("../../app/controller/dashboard/#trim(ucase(session.companycode))#/#ucase(liveboardcodeNS)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "Controller.js", controller, "utf-8");
	}

	public void function setModel(required string liveboardcode, required string liveboardcodeNS,  required any lbsource, required array lbitemsource) {
		SaveContent variable="model" {
		WriteOutput("Ext.define('Form.model.dashboard.#ucase(session.companycode)#.#ucase(liveboardcodeNS)#.Model', {
			extend: 'Ext.data.Model',
			fields: []
		});");
		}

		var dpath = ExpandPath("../../app/model/dashboard/#trim(ucase(session.companycode))#/#ucase(liveboardcodeNS)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "Model.js", model, "utf-8");
	}

	public void function setStore(required string liveboardcode, required string liveboardcodeNS,  required any lbsource, required array lbitemsource) {
		SaveContent variable="store" {
		WriteOutput("Ext.define('Form.store.dashboard.#ucase(session.companycode)#.#ucase(liveboardcodeNS)#.Store', {
			extend: 'Ext.data.Store',
			model: 'Form.model.dashboard.#ucase(session.companycode)#.#ucase(liveboardcodeNS)#.Model',
			constructor : function(config) {
				Ext.applyIf(config, {
					proxy  : {
					type: 'direct',
					paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams']
				}
			});
			this.callParent([config]);
			}
		});");
		} // End save content

		var dpath = ExpandPath("../../app/store/dashboard/#trim(ucase(session.companycode))#/#ucase(liveboardcodeNS)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "Store.js", store, "utf-8");
	}

	public void function setView(required string liveboardcode, required string liveboardcodeNS,  required any lbsource, required array lbitemsource) {
		SaveContent variable="view" {
		WriteOutput("Ext.define('Form.view.dashboard.#ucase(session.companycode)#.#ucase(liveboardcodeNS)#.View', {
			extend: 'Ext.panel.Panel',
			alias: 'widget.#ucase(liveboardcodeNS)#',
			height: 400,
			width: 400,
			initComponent: function() {
				this.title = '#ucase(liveboardcodeNS)#';
				this.callParent(arguments);
			}
		});");
		}
		var dpath = ExpandPath("../../app/view/dashboard/#trim(ucase(session.companycode))#/#ucase(liveboardcodeNS)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "View.js", view, "utf-8");
	}

	public void function setApi(required string liveboardcode, required string liveboardcodeNS,  required any lbsource, required array lbitemsource) {
		SaveContent variable="Api" {
		WriteOutput("
		<!--- Configure API Namespace and Description variable names --->
		<cfset args = StructNew() />
		<cfset args['ns'] = 'Ext.#ucase(liveboardcodeNS)#' />
		<cfset args['desc'] = 'APIDesc' />
		<cfinvoke component='Direct' method='getAPIScript' argumentcollection='##args##' returnVariable='apiScript' />
		<cfcontent reset='true' />
		<cfoutput>##apiScript##</cfoutput>

		<cfsetting showdebugoutput='false' />");
		}

		var dpath = ExpandPath("../../myapps/dashboard/#trim(ucase(session.companycode))#/#ucase(liveboardcodeNS)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "Api.cfm", Api, "utf-8");
	}

	public void function setDirect(required string liveboardcode, required string liveboardcodeNS,  required any lbsource, required array lbitemsource) {
		SaveContent variable="Direct" {
		WriteOutput("
		<cfcomponent name='Direct'>
			<cfif findNoCase(cgi.SERVER_PROTOCOL, 'https') >
				<cfset sProt = 'https://' >
			<cfelse>
				<cfset sProt = 'http://' >
			</cfif>
			<cfset variables.routerUrl = '##sProt####cgi.SERVER_NAME##:##cgi.SERVER_PORT##/myapps/dashboard/#trim(ucase(session.companycode))#/#ucase(liveboardcodeNS)#/Router.cfm' />
			<cfset variables.remotingType = 'remoting' />

			<cffunction name='getPostBody' returnType='string' output='false'>
			   <cfscript>
			      var size=GetPageContext().getRequest().getContentLength();
			      var emptyByteArray = createObject('java', 'java.io.ByteArrayOutputStream').init().toByteArray();
			      var byteClass = createObject('java', 'java.lang.Byte').TYPE;
			      var byteArray = createObject('java','java.lang.reflect.Array').newInstance(byteClass, size);
			      GetPageContext().getRequest().getInputStream().readLine(byteArray, 0, size);
			      createObject('java', 'java.lang.System').out.println('{GetJSONRequest} ByteArray.ToString=' &ToString( byteArray ) );
			      return ToString( byteArray );
			   </cfscript>
			</cffunction>

			<cffunction name='invokeCall'>
				<cfargument name='request' />
				<cfset var idx = 1 />
				<cfset var mthIdx = 1 />
				<cfset var result = '' />
				<cfset var args = StructNew() />

				<!--- find the methods index in the metadata --->
				<cfset newCfComponentMeta = GetComponentMetaData(request.action) />

				<cfloop from='1' to='##arrayLen(newCfComponentMeta.Functions)##' index='idx'>
					<cfif newCfComponentMeta.Functions[idx]['name'] eq request.method>
						<cfset mthIdx = idx />
						<cfbreak />
					</cfif>
				</cfloop>

			    <cfif isdefined('request.data') >

					<cfif NOT IsArray(request.data)>
						<cfset maxParams = 0 />
					<cfelseif ArrayLen(request.data) lt ArrayLen(newCfComponentMeta.Functions[mthIdx].parameters)>
						<cfset maxParams = ArrayLen(request.data) />
					<cfelse>
						<cfset maxParams = ArrayLen(newCfComponentMeta.Functions[mthIdx].parameters) />
					</cfif>
					<!--- marry the parameters in the metadata to params passed in the request. --->
					<cfloop from='0' to='##maxParams - 1##' index='idx'>
						<cfset args[newCfComponentMeta['Functions'][mthIdx].parameters[idx+1].name] = request.data[idx+1] />
					</cfloop>

					<cfinvoke component='##request.Action##' method='##request.method##' argumentcollection='##args##' returnvariable='result'>

				<cfelse>
					<cfinvoke component='##request.Action##' method='##request.method##' returnvariable='result'>
				</cfif>

				<cfreturn result />
			</cffunction>

			<cffunction name='getAPIScript'>
				<cfargument name='ns' />
				<cfargument name='desc' />

				<cfset var totalCFCs = '' />
				<cfset var cfcName = '' />
				<cfset var CFCApi = '' />
				<cfset var fnLen = '' />
				<cfset var Fn = '' />
				<cfset var currFn = '' />
				<cfset var newCfComponentMeta = '' />
				<cfset var script = '' />
				<cfset var jsonPacket = StructNew() />
				<cfset jsonPacket['url'] = variables.routerUrl />
				<cfset jsonPacket['type'] = variables.remotingType />
				<cfset jsonPacket['namespace'] = 'Ext.#ucase(liveboardcodeNS)#' />
				<cfset jsonPacket['actions'] = StructNew() />
				<cfset jsonPacket['timeout'] = 300000 />

				<cfdirectory action='list' directory='##expandPath('.')##' name='totalCFCs' filter='*.cfc' recurse='false' />

				<cfloop	query='totalCFCs'>
					<cfset cfcName = ListFirst(totalCFCs.name, '.') />
					<cfset newCfComponentMeta = GetComponentMetaData(cfcName) />
					<cfif StructKeyExists(newCfComponentMeta, 'ExtDirect')>
						<cfset CFCApi = ArrayNew(1) />

						<cfset fnLen = ArrayLen(newCFComponentMeta.Functions) />
						<cfloop from='1' to='##fnLen##' index='i'>
							<cfset currFn = newCfComponentMeta.Functions[i] />
							<cfif StructKeyExists(currFn, 'ExtDirect')>
								<cfset Fn = StructNew() />
								<cfset Fn['name'] = currFn.Name/>
								<cfset Fn['len'] = ArrayLen(currFn.Parameters) />
								<cfif StructKeyExists(currFn, 'ExtFormHandler')>
									<cfset Fn['formHandler'] = true />
								</cfif>
								<cfset ArrayAppend(CFCApi, Fn) />
							</cfif>
						</cfloop>
						<cfset jsonPacket['actions'][cfcName] = CFCApi />
					</cfif>
				</cfloop>

				<cfoutput><cfsavecontent variable='script'>Ext.ns('##arguments.ns##');##arguments.ns##.##desc## = ##SerializeJson(jsonPacket)##;</cfsavecontent></cfoutput>
				<cfreturn script />
			</cffunction>
		</cfcomponent>
		");
		}

		var dpath = ExpandPath("../../myapps/dashboard/#trim(ucase(session.companycode))#/#ucase(liveboardcodeNS)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "Direct.cfc", Direct, "utf-8");
	}

	public void function setRouter(required string liveboardcode, required string liveboardcodeNS,  required any lbsource, required array lbitemsource) {
		SaveContent variable="Router" {
		WriteOutput("
		<!--- Determine if this is a field post. --->
		<cfif NOT StructIsEmpty(form)>
			<cfset jsonPacket = StructNew() />
			<cfset jsonPacket['tid'] = form.extTID />
			<cfset jsonPacket['action'] = form.extAction />
			<cfset jsonPacket['method'] = form.extMethod />
			<cfset jsonPacket['type'] = 'rpc' />

			<cftry>
		            <cfinvoke component='##form.extAction##' method='##form.extMethod##' argumentcollection='##form##' returnVariable='result' />
		            <cfcatch type='any'>
		                <cfset jsonPacket['type'] = 'exception' />
		                <cfset jsonPacket['message'] = cfcatch.Message & ' ' & cfcatch.Detail />
		               <!--- <cfset jsonPacket['where'] = cfcatch.TagContext.Line/> --->
		                <cfcontent reset='true' /><cfoutput>##SerializeJson(jsonPacket)##</cfoutput><cfabort/>
		            </cfcatch>
		        </cftry>
			<cfset jsonPacket['result'] = result />

			<cfset json = SerializeJson(jsonPacket) />
			<cfif form.extUpload eq 'true'>
				<cfoutput>
				<cfsavecontent variable='output'><html><body><textarea>##json##</textarea></body></html></cfsavecontent>
				</cfoutput>
			<cfelse>
				<cfset output = json />
			</cfif>
			<cfcontent reset='true' /><cfoutput>##output##</cfoutput>
		<!--- must have been JSON posted in form body --->
		<cfelse>
			<cfset direct = CreateObject('component', 'Direct') />
			<cfset postBody = direct.getPostBody() />
			<cfset requests = DeserializeJSON(postBody) />
			<cfif NOT IsArray(requests)>
				<cfset tmp = requests />
				<cfset requests = ArrayNew(1) />
				<cfset requests[1] = tmp />
			</cfif>
			<cfset requestLn = ArrayLen(requests) />
			<cfloop from='1' to='##requestLn##' index='i'>
				<cfset curReq = requests[i] />
		                <cftry>
		                    <cfset result = direct.invokeCall(curReq) />
		                    <cfcatch type='any'>
		                        <cfset jsonPacket = StructNew() />
		                        <cfset jsonPacket['type'] = 'exception' />
		                        <cfset jsonPacket['tid'] = curReq['tId'] />
		                        <cfset jsonPacket['message'] = cfcatch.Message & ' Details: ' & cfcatch.Detail />
		                       <!--- <cfset jsonPacket['where'] = cfcatch.TagContext.Line/> --->
		                        <cfcontent reset='true' /><cfoutput>##SerializeJson(jsonPacket)##</cfoutput>
								<cfsetting showdebugoutput='false'  />
		                    </cfcatch>
		                </cftry>
				<cfif IsStruct(result) AND StructKeyExists(result, 'name') AND StructKeyExists(result, 'result')>
					<cfset curReq['name'] = result.name />
					<cfset curReq['result'] = result.result />
				<cfelse>
					<cfset curReq['result'] = result />
				</cfif>

				<cfset StructDelete(curReq, 'data') />
			</cfloop>
			<cfcontent reset='true' /><cfoutput>##SerializeJson(requests)##</cfoutput>
		</cfif>

		<cfsetting showdebugoutput='false'  />");
		}

		var dpath = ExpandPath("../../myapps/dashboard/#trim(ucase(session.companycode))#/#ucase(liveboardcodeNS)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "Router.cfm", Router, "utf-8");
	}



	public void function setAppJS(required string liveboardcode,
									required string liveboardcodeNS,
									required any lbsource,
									required array lbitemsource) {
		var rs = StructNew();
		rs = setAppJSParams(liveboardcode, liveboardcodeNS, lbsource, lbitemsource);
		SaveContent variable="app" {
		WriteOutput("
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
			controllers: #rs.dcontrollers#,
			appFolder: '../../../../app',
			init: function(app) {
				#rs.dprovider#
			},
			launch: function(){
				console.log('liveboard app launched');
				Ext.create('Ext.panel.Panel', {
				 	title: '#lbsource.getLBTITLE()#', #rs.dwidth# #rs.dheight#
				 	#rs.dextra#
					layout: {
						type: 'table',
						// The total column count must be specified here
				        columns: #rs.tcolumns##rs.ditemclass##rs.dtableattr##rs.dtdattr##rs.dtrattr##rs.dLextra#
					},
					items: #rs.ditems#,
					renderTo: Ext.getBody()
				});
			}
		});");
		}

		var dpath = ExpandPath("../../myapps/dashboard/#trim(ucase(session.companycode))#/#ucase(liveboardcodeNS)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "app.js", app, "utf-8");
	}

	public boolean function checkForTabItems(lbitemsource,b,querycodeNS) {
		if ((lbitemsource[b].getROWSPAN() == 0 || trim(lbitemsource[b].getROWSPAN()) == '') && (lbitemsource[b].getCOLSPAN() == 0 || trim(lbitemsource[b].getCOLSPAN()) == '')) {
			// This is a sign that this item follow the previous item. Instead of overlapping panels,
			// they will be tabbed.
			if (trim(lbitemsource[b].getXTYPE()) != "") ArrayAppend(tabItemArray, "xtype: '#ucase(querycodeNS)#',#tabconfig#");
			else ArrayAppend(tabItemArray, "html: '#lbitemsource[b].getHTML()#'");

			if (b == ArrayLen(lbitemsource)) {
				if (ArrayLen(tabItemArray) > 1) { // Insert tab items
					var dTabItemStr = "[{" & ArrayToList(tabItemArray, "
					},{") & "}]";

					ArrayAppend(itemArray, "xtype: 'tabpanel', items: #dTabItemStr#, rowspan: #lastItemInfo['rowspan']#, colspan: #lastItemInfo['colspan']# #lastItemInfo['cellclass']# #lastItemInfo['itemextra']# ");
				}
			}
			return true;
		} else {
			if (ArrayLen(tabItemArray) > 1) { // Insert tab items
				var dTabItemStr = "[{" & ArrayToList(tabItemArray, "
				},{") & "}]";

				ArrayAppend(itemArray, "xtype: 'tabpanel', items: #dTabItemStr#, rowspan: #lastItemInfo['rowspan']#, colspan: #lastItemInfo['colspan']# #lastItemInfo['cellclass']# #lastItemInfo['itemextra']# ");

				if (b == ArrayLen(lbitemsource)) {
					ArrayAppend(itemArray, "xtype: '#ucase(querycodeNS)#', rowspan: #lbitemsource[b].getROWSPAN()#, colspan: #lbitemsource[b].getCOLSPAN()# #cellclass# #itemextra# ");
				} else {
					lastItemInfo = StructNew();
					tabItemArray = ArrayNew(1);
					tabItemArray[1] = "xtype: '#ucase(querycodeNS)#',#tabconfig#";
					lastItemInfo["xtype"] = "#ucase(querycodeNS)#";
					lastItemInfo["rowspan"] = "#lbitemsource[b].getROWSPAN()#";
					lastItemInfo["colspan"] = "#lbitemsource[b].getCOLSPAN()#";
					lastItemInfo["cellclass"] = "#cellclass#";
					lastItemInfo["itemextra"] = "#itemextra#";
				}
				return true;
			} else if (b == 1) {
			    tabItemArray[1] = "xtype: '#ucase(querycodeNS)#',#tabconfig#";
				lastItemInfo["xtype"] = "#ucase(querycodeNS)#";
			    lastItemInfo["rowspan"] = "#lbitemsource[b].getROWSPAN()#";
				lastItemInfo["colspan"] = "#lbitemsource[b].getCOLSPAN()#";
				lastItemInfo["cellclass"] = "#cellclass#";
				lastItemInfo["itemextra"] = "#itemextra#";
			    return true;
			}
		}

		if (b == ArrayLen(lbitemsource)) {
			ArrayAppend(itemArray, "xtype: '#ucase(querycodeNS)#', rowspan: #lbitemsource[b].getROWSPAN()#, colspan: #lbitemsource[b].getCOLSPAN()# #cellclass# #itemextra# ");
		}

		return false;
	}

	public struct function setAppJSParams(required string liveboardcode,
										required string liveboardcodeNS,
										required any lbsource,
										required array lbitemsource) {

		var controllerArray = ArrayNew(1); /* Initialize controller array to be converted list of controllers */
		var providerArray = ArrayNew(1); /* Initialize corresponding providers */
		itemArray = ArrayNew(1); /* App items*/
		lastItemInfo = StructNew(); /* Hold the last processed query item */
		tabItemArray = ArrayNew(1); /* Hold the tab items if there are any */

		ArrayAppend(controllerArray, "dashboard.#ucase(session.companycode)#.#ucase(liveboardcodeNS)#.Controller");
		ArrayAppend(providerArray, "Ext.direct.Manager.addProvider(Ext.#ucase(liveboardcodeNS)#.APIDesc);");

		for (var b = 1; b <= ArrayLen(lbitemsource); b++) { // check each query xtype if a valid view widget type by quering EGRGQUERY

			if (trim(lbitemsource[b].getLIVEBOARDITEMEXTRA()) != "") itemextra = "," & trim(lbitemsource[b].getLIVEBOARDITEMEXTRA());
			else itemextra = "";

			if (trim(lbitemsource[b].getCELLCLS()) != "") cellclass = ",cellCls: " & trim(lbitemsource[b].getCELLCLS());
			else cellclass = "";

			if (trim(lbitemsource[b].getXTYPE()) != "")  {
				var r = EntityLoad("EGRGQUERY", lbitemsource[b].getXTYPE(), true);
				if (IsDefined("r")) {
					var querycodeNS = "NS_" & rereplace(lbitemsource[b].getXTYPE(), "\W", "", "all");
					tabconfig =	"tabConfig: {
						listeners: {
			                click: function(dtab) {
			                	var dgrid = Ext.ComponentQuery.query('#ucase(querycodeNS)#')[0];
			                	try {
			                		dgrid.getStore().load();
			                	} catch (e) {
			                		console.log(e);
			                	}
			                	dtab.clearListeners();
			                }
			            }
					}";
					// Do not insert duplicate controller
					if (!ArrayContains(controllerArray, "queryoutput.#ucase(session.companycode)#.#ucase(querycodeNS)#.Controller")) {
						ArrayAppend(controllerArray, "queryoutput.#ucase(session.companycode)#.#ucase(querycodeNS)#.Controller");
					}

					// Do not insert duplicate provider
					if (!ArrayContains(providerArray, "Ext.direct.Manager.addProvider(Ext.#ucase(querycodeNS)#.APIDesc)")) {
						ArrayAppend(providerArray, "Ext.direct.Manager.addProvider(Ext.#ucase(querycodeNS)#.APIDesc)");
					}

					var cont = checkForTabItems(lbitemsource,b,querycodeNS);
					if (cont == true) {
						continue;
					} else {
						// Duplicate item xtype is allowed, just be aware if there are ids specified in the component
						ArrayAppend(itemArray, "xtype: '#lastItemInfo['xtype']#', rowspan: #lastItemInfo['rowspan']#, colspan: #lastItemInfo['colspan']# #lastItemInfo['cellclass']# #lastItemInfo['itemextra']# ");
					}

					lastItemInfo["xtype"] = "#ucase(querycodeNS)#";
					tabItemArray[1] = "xtype: '#ucase(querycodeNS)#',#tabconfig#";
				} else {

					var cont = checkForTabItems(lbitemsource,b,querycodeNS);
					if (cont == true) {
						continue;
					} else {
						// Duplicate item xtype is allowed, just be aware if there are ids specified in the component
						ArrayAppend(itemArray, "xtype: '#lastItemInfo['xtype']#', rowspan: #lastItemInfo['rowspan']#, colspan: #lastItemInfo['colspan']# #lastItemInfo['cellclass']# #lastItemInfo['itemextra']# ");
					}

					lastItemInfo["xtype"] = "#lbitemsource[b].getXTYPE()#";
					tabItemArray[1] = "xtype: '#lbitemsource[b].getXTYPE()#',#tabconfig#";

				}
			} else {

				var cont = checkForTabItems(lbitemsource,b,querycodeNS);
				if (cont == true) {
					continue;
				} else {
					ArrayAppend(itemArray, "html: '#lastItemInfo['html']#', rowspan: #lastItemInfo['rowspan']#, colspan: #lastItemInfo['colspan']# #lastItemInfo['cellclass']# #lastItemInfo['itemextra']# ");
				}

				lastItemInfo["html"] = "#lbitemsource[b].getHTML()#";
				tabItemArray[1] = "html: '#lbitemsource[b].getHTML()#'";

			}

			lastItemInfo["rowspan"] = "#lbitemsource[b].getROWSPAN()#";
			lastItemInfo["colspan"] = "#lbitemsource[b].getCOLSPAN()#";
			lastItemInfo["cellclass"] = "#cellclass#";
			lastItemInfo["itemextra"] = "#itemextra#";
		}

		var dcontrollers = "['" & ArrayToList(controllerArray, "','") & "']";
		var dprovider = ArrayToList(providerArray, ";
		");
		var ditems = "[{" & ArrayToList(itemArray, "
		},{") & "}]";

		var tcolumns = lbsource.getTABLECOLUMNS();
		if (Not IsDefined("tcolumns") || tcolumns == 0) {
		    tcolumns = 1;
		}

		var pwidth = lbsource.getWIDTH();
		if (Not IsDefined("pwidth") || pwidth == 0) {
		    dwidth = "";
		    pwidth = "";
		} else {
			dwidth = "width: #pwidth#,";
		}

		var pheight = lbsource.getHEIGHT();
		if (Not IsDefined("pheight") || pheight == 0) {
		    dheight = "";
		    pheight = "";
		} else {
			dheight = "height: #pheight#,";
		}

		var pextra = lbsource.getLBEXTRA();
		if (Not IsDefined("pextra") || trim(pextra) == "") {
		    dextra = "";
		    pextra = "";
		} else {
			dextra = "#pextra#,";
		}



		var itemclass = lbsource.getTABLEITEMCLS();
		if (Not IsDefined("itemclass") || trim(itemclass) == "") {
		    ditemclass = "";
		} else {
			ditemclass = ", itemCls: '#itemclass#'";
		}

		var tableattr = lbsource.getTABLEATTRS();
		if (Not IsDefined("tableattr") || trim(tableattr) == "") {
		    dtableattr = "";
		} else {
			dtableattr = ", tableAttrs: '#tableattr#'";
		}

		var tdattr = lbsource.getTABLETDATTRS();
		if (Not IsDefined("tdattr") || trim(tdattr) == "") {
		    dtdattr = "";
		} else {
			dtdattr = ", tdAttrs: '#tdattr#'";
		}

		var trattr = lbsource.getTABLETRATTRS();
		if (Not IsDefined("trattr") || trim(trattr) == "") {
		    dtrattr = "";
		} else {
			dtrattr = ", trAttrs: '#trattr#'";
		}

		var Lextra = lbsource.getLBLAYOUTEXTRA();
		if (Not IsDefined("Lextra") || trim(Lextra) == "") {
		    dLextra = "";
		} else {
			dLextra = ", #Lextra#";
		}
		var rs = StructNew();
		rs["dcontrollers"] = dcontrollers;
		rs["dprovider"] = dprovider;
		rs["dwidth"] = dwidth;
		rs["dheight"] = dheight;
		rs["pwidth"] = pwidth;
		rs["pheight"] = pheight;
		rs["dextra"] = dextra;
		rs["pextra"] = pextra;
		rs["tcolumns"] = tcolumns;
		rs["ditemclass"] = ditemclass;
		rs["dtableattr"] = dtableattr;
		rs["dtdattr"] = dtdattr;
		rs["dtrattr"] = dtrattr;
		rs["dLextra"] = dLextra;
		rs["ditems"] = ditems;
		return rs;
	}

	public void function setIndex(required string liveboardcode, required string liveboardcodeNS,  required any lbsource, required array lbitemsource) {

		var scriptArray = ArrayNew(1);
		ArrayAppend(scriptArray, "<script src='Api.cfm'></script>");
		for (var b = 1; b <= ArrayLen(lbitemsource); b++) { // check each query xtype if a valid view widget type by quering EGRGQUERY
			if (trim(lbitemsource[b].getXTYPE()) != "")  {
				var r = EntityLoad("EGRGQUERY", lbitemsource[b].getXTYPE(), true);
				if (IsDefined("r")) {
					var querycodeNS = "NS_" & rereplace(lbitemsource[b].getXTYPE(), "\W", "", "all");
					// Do not insert duplicate script
					if (!ArrayContains(scriptArray, "<script src='../../../queryoutput/#trim(ucase(session.companycode))#/#ucase(querycodeNS)#/Api.cfm'></script>")) {
						ArrayAppend(scriptArray, "<script src='../../../queryoutput/#trim(ucase(session.companycode))#/#ucase(querycodeNS)#/Api.cfm'></script>");
					}
				}
			}

		}

		var dscript = ArrayToList(scriptArray, "
				");



		SaveContent variable="Index" {
			var cmp = "component";
			var cmpname = "myapps.query.definition.GridExtension";
			var gext = CreateObject(cmp, cmpname);
			var dstyle = gext.prepareGridIcons();
		WriteOutput("<html>
			<cfif ucase(GetAuthUser() neq ""ADMIN"") >
				<cfoutput><h2>Authenticated user is not an admin!</h2></cfoutput>
				<cfabort>
			</cfif>
			<head>
			    <title>iBOS/e Liveboard</title>
				<link rel='icon' type='image/ico' href='../../../../resource/image/appicon/diginfologo.ico'>
				<cfoutput><link rel='stylesheet' type='text/css' href='../../../../scripts/ext-4.2.2/resources/css/##session.companycsstheme##.css'></cfoutput>
			    <script type='text/javascript' src='../../../../scripts/ext-4.2.2/ext-all.js'></script>
				#dscript#
			    <script type='text/javascript' src='app.js'>
			    </script>
			    #dstyle#
			</head>
		<body>
		</body>
		</html>
		<cfsetting showdebugoutput='false'>");
		}

		var dpath = ExpandPath("../../myapps/dashboard/#trim(ucase(session.companycode))#/#ucase(liveboardcodeNS)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "index.cfm", Index, "utf-8");
	}

	public void function removeLiveboardCode(required string liveboardcode,
								  	required string liveboardcodeNS, required string backpath, required string dfolder) {

		// myapps part
	 	try {
			if (FileExists(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Api.cfm")));
			FileDelete(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Api.cfm"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/app.js")));
			FileDelete(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/app.js"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Direct.cfc")));
			FileDelete(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Direct.cfc"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.cfm")));
			FileDelete(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.cfm"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.html")));
			FileDelete(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.html"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Router.cfm")));
			FileDelete(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Router.cfm"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Data.cfc")));
			FileDelete(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Data.cfc"));
		} catch (any e) {

		}

		try {
			if (DirectoryExists(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#")));
			DirectoryDelete(ExpandPath("#backpath#myapps/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#"), true);
		} catch (any e) {

		}


		//controller
		try {
			if (FileExists(ExpandPath("#backpath#app/controller/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Controller.js")));
			FileDelete(ExpandPath("#backpath#app/controller/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Controller.js"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#app/controller/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.cfm")));
			FileDelete(ExpandPath("#backpath#app/controller/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.cfm"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#app/controller/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.html")));
			FileDelete(ExpandPath("#backpath#app/controller/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.html"));
		} catch (any e) {

		}

		try {
			if (DirectoryExists(ExpandPath("#backpath#app/controller/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#")));
			DirectoryDelete(ExpandPath("#backpath#app/controller/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#"), true);
		} catch (any e) {

		}


		//model
		try {
			if (FileExists(ExpandPath("#backpath#app/model/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Model.js")));
			FileDelete(ExpandPath("#backpath#app/model/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Model.js"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#app/model/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.cfm")));
			FileDelete(ExpandPath("#backpath#app/model/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.cfm"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#app/model/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.html")));
			FileDelete(ExpandPath("#backpath#app/model/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.html"));
		} catch (any e) {

		}

		try {
			if (DirectoryExists(ExpandPath("#backpath#app/model/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#")));
			DirectoryDelete(ExpandPath("#backpath#app/model/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#"), true);
		} catch (any e) {

		}

		//store
		try {
			if (FileExists(ExpandPath("#backpath#app/store/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Store.js")));
			FileDelete(ExpandPath("#backpath#app/store/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/Store.js"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#app/store/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.cfm")));
			FileDelete(ExpandPath("#backpath#app/store/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.cfm"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#app/store/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.html")));
			FileDelete(ExpandPath("#backpath#app/store/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.html"));
		} catch (any e) {

		}

		try {
			if (DirectoryExists(ExpandPath("#backpath#app/store/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#")));
			DirectoryDelete(ExpandPath("#backpath#app/store/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#"), true);
		} catch (any e) {

		}


		//view
		try {
			if (FileExists(ExpandPath("#backpath#app/view/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/View.js")));
			FileDelete(ExpandPath("#backpath#app/view/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/View.js"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#app/view/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.cfm")));
			FileDelete(ExpandPath("#backpath#app/view/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.cfm"));
		} catch (any e) {

		}

		try {
			if (FileExists(ExpandPath("#backpath#app/view/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.html")));
			FileDelete(ExpandPath("#backpath#app/view/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#/index.html"));
		} catch (any e) {

		}

		try {
			if (DirectoryExists(ExpandPath("#backpath#app/view/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#")));
			DirectoryDelete(ExpandPath("#backpath#app/view/#dfolder#/#ucase(trim(session.companycode))#/#ucase(trim(liveboardcodeNS))#"), true);
		} catch (any e) {

		}

   }


}