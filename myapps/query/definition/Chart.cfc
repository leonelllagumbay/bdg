/**
 * Preview
 *
 * @author LEONELL
 * @date 3/31/15
 **/
component accessors=true output=false persistent=false ExtDirect=true {

	public struct function getChartDefinition(required string querycode, required any qrygrid) ExtDirect=true {
		var ret = structNew();
		querygrid = qrygrid;

		querychart = EntityLoad("EGRGQRYCHART",{EQRYCODE="#trim(querycode)#"},true);
		querychartaxis = EntityLoad("EGRGQRYCHARTAXIS",{EQRYCODEFK="#trim(querycode)#"},false);
		querychartseries = EntityLoad("EGRGQRYCHARTSERIES",{EQRYCODEFK="#trim(querycode)#"},false);

		try {
			querycode = trim(querycode);

			tablecolumnArr = OrmExecuteQuery("SELECT EVIEWFIELDCODE, TABLENAME, FIELDNAME, FIELDALIAS FROM EGRGEVIEWFIELDS WHERE EQRYCODEFK = '#querycode#'",false);

			querycodeAsNameSpace = "NS_" & rereplace(querycode, "\W", "", "all");
			setModel(querycode);
			setStore(querycode);
			setView(querycode);
			setController(querycode);
			var jsfile = setRequiredFiles();
			setApp(querycode, jsfile, querycodeAsNameSpace);
			setData(querycode,querycodeAsNameSpace);

			ret["success"] = true;
			ret["message"] = "Successful operation!";
		} catch(Any e) {
			ret["success"] = false;
			ret["message"] = e.message & " - " & e.detail;
		}
		return ret;
	}

	private void function setModel(querycode) {
		var sm = CreateObject("component", "Grid");
		sm.setModel(querycode, tablecolumnArr, querycodeAsNameSpace,querygrid);
	}

	private void function setStore() {
		var timeout = querygrid.getSTORETIMEOUT();
		if(Isdefined("timeout")) {
			if(trim(timeout) eq "") timeout = 300000;
		} else {
			timeout = 300000;
		}

		var sautoload = querygrid.getSTOREAUTOLOAD();
		if(Isdefined("sautoload")) {
			if(trim(sautoload) eq "") sautoload = "true";
		} else {
			sautoload = "true";
		}

		// Store Extra --------------------------------
		var storeextradefault = "autoLoad: #sautoload#,";
		var storeextra = querygrid.getSTOREEXTRA();
		if(Isdefined("storeextra")) {
			if(trim(storeextra) eq "") {
				storeextra = storeextradefault;
			} else {
				storeextra = "#storeextra#,";
			}
		} else {
			storeextra = storeextradefault;
		}
		// End Store Extra

		// Proxy Type -------------
		var proxytypedefault = "direct";
		var proxytype = querygrid.getPROXYTYPE();
		if(Isdefined("proxytype")) {
			if(trim(proxytype) eq "") {
				proxytype = proxytypedefault;
			}
		} else {
			proxytype = proxytypedefault;
		}
		// End Proxy Type ---------

		// Proxy Reader -------------
		var proxyreaderdefault = "{
					root: 'topics',
					totalProperty: 'totalCount'
				}";
		var proxyreader = querygrid.getPROXYREADER();
		if(Isdefined("proxyreader")) {
			if(trim(proxyreader) eq "") {
				proxyreader = proxyreaderdefault;
			}
		} else {
			proxyreader = proxyreaderdefault;
		}
		// End Proxy Reader ---------

		// Proxy Writer -------------
		var proxywriterdefault = "";
		var proxywriter = querygrid.getPROXYWRITER();
		if(Isdefined("proxywriter")) {
			if(trim(proxywriter) eq "") {
				proxywriter = proxywriterdefault;
			} else {
				proxywriter = "writer: #proxywriter#,";
			}
		} else {
			proxywriter = proxywriterdefault;
		}
		// End Proxy Writer ---------

		// Proxy Url -------------
		var proxyurldefault = "";
		var proxyurl = querygrid.getPROXYURL();
		if(Isdefined("proxyurl")) {
			if(trim(proxyurl) eq "") {
				proxyurl = proxyurldefault;
			} else {
				proxyurl = "url: '#proxyurl#',";
			}
		} else {
			proxyurl = proxyurldefault;
		}
		// End Proxy Url ---------

		// Proxy Extra ----------------------------------------------------------------------------------------
		var storeproxyextradefault = "extraParams: {
				chartparams: {}
			},
			timeout: #timeout#,
			paramOrder: ['page','start','limit','chartparams'],
			api: {
				read:    Ext.#ucase(querycodeAsNameSpace)#.Data.Read
		    }";
		var storeproxyextra = querygrid.getSTOREPROXYEXTRA();
		if(Isdefined("storeproxyextra")) {
			if(trim(storeproxyextra) eq "") {
				storeproxyextra = storeproxyextradefault;
			}
		} else {
			storeproxyextra = storeproxyextradefault;
		}
		// End Proxy Extra --------------------------------------------------------------------------

	SaveContent variable="store" {
	WriteOutput("Ext.define('Form.store.queryoutput.#ucase(session.companycode)#.#ucase(querycodeAsNameSpace)#.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.#ucase(session.companycode)#.#ucase(querycodeAsNameSpace)#.Model',
	#storeextra#
	constructor : function(config) {
		Ext.applyIf(config, {
			proxy  : {
				type: '#proxytype#',
				reader: #proxyreader#,
				#proxywriter#
				#proxyurl#
			#storeproxyextra#
			}
	    });
	this.callParent([config]);
	}
});");

	} // End save content

		var dpath = ExpandPath("../../../app/store/queryoutput/#trim(ucase(session.companycode))#/#ucase(querycodeAsNameSpace)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "Store.js", store, "utf-8");
	}

	private void function setView() {
		var ch = CreateObject("component", "ChartHelper");
		var dgrid = CreateObject("component", "GridHelper");
		var ca = ch.prepareChartColumnArray();

		//prepare chart Chart
		var chartchart = ch.prepareChartPanel(ca, querygrid, dgrid);

		// prepare chart label
		var chartmask = ch.prepareChartMask(querychart, dgrid);

		// prepare chart legend
		var chartlegend = ch.prepareChartLegend(querychart, dgrid, querygrid);

		// prepare chart axes
		var chartaxis = ch.prepareChartAxis(querychartaxis, dgrid);

		// prepare chart series
		var chartseries = ch.prepareChartSeries(querychartseries, dgrid);


		SaveContent variable="view" {
			WriteOutput("Ext.define('Form.view.queryoutput.#ucase(session.companycode)#.#ucase(querycodeAsNameSpace)#.View', {
	extend: 'Ext.ux.chart.TitleChart',
	alias: 'widget.#ucase(querycodeAsNameSpace)#',
	store: 'queryoutput.#ucase(session.companycode)#.#ucase(querycodeAsNameSpace)#.Store',
	#chartchart#
	#chartmask#
	#chartlegend#
	axes: #chartaxis#,
	series: #chartseries#
");

			WriteOutput("});");
		}

		var dpath = ExpandPath("../../../app/view/queryoutput/#trim(ucase(session.companycode))#/#ucase(querycodeAsNameSpace)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "View.js", view, "utf-8");
	}

	private void function setController() {
		Savecontent variable="controller" {
		WriteOutput("Ext.define('Form.controller.queryoutput.#ucase(session.companycode)#.#ucase(querycodeAsNameSpace)#.Controller', {
   	extend: 'Ext.app.Controller',
   	views: ['queryoutput.#ucase(session.companycode)#.#ucase(querycodeAsNameSpace)#.View'],
   	models: ['queryoutput.#ucase(session.companycode)#.#ucase(querycodeAsNameSpace)#.Model'],
   	stores: ['queryoutput.#ucase(session.companycode)#.#ucase(querycodeAsNameSpace)#.Store'],
   		init: function() {
   			this.control({
   				'chart': {
   					render: this.initChart
   				}
   			})
   		},
   		initChart: function(b) {
   			console.log('init chart');
   		}
});");
		}

		var dpath = ExpandPath("../../../app/controller/queryoutput/#trim(ucase(session.companycode))#/#ucase(querycodeAsNameSpace)#/");
		var utilO = CreateObject("component", "IBOSE.application.Util");
		utilO.createDirectoryIfDoesNotExist(dpath);
		FileWrite(dpath & "Controller.js", controller, "utf-8");
	}

	private string function setRequiredFiles() {
		SaveContent variable="jsfiles" {
			WriteOutput("[
				'Ext.container.Viewport',
				'Ext.direct.*',
			    'Ext.data.*',
				'Ext.panel.*',
				'Ext.layout.container.Card',
				'Ext.util.*',
				'Ext.chart.*',
				'Ext.draw.*',
				'Ext.ux.chart.Chart'
			]");
		}
		return jsfiles;
	}

	private void function setApp(required string querycode, required string jsfiles, required string querycodeAsNameSpace) {
		var dg = CreateObject("component", "Grid");
		dg.setApp(querycode, jsfiles, querycodeAsNameSpace);
	}

	public struct function ReadChartAxis(required string page,
								required string start,
								required string limit,
								required any sort,
								required any filter,
								required string querycode) ExtDirect=true {

		var qryObj = Createobject("component", "IBOSE.application.GridQuery");
		var dresult = qryObj.buildConditionDash(page, start, limit, sort, filter);

		var WHERE = dresult['where'];
		var ORDERBY = dresult['orderby'];

		if (trim(WHERE) neq "") WHERE = "#WHERE# AND EQRYCODEFK = '#querycode#'";
		else WHERE = "WHERE EQRYCODEFK = '#querycode#'";

		var processData = ORMExecuteQuery("FROM EGRGQRYCHARTAXIS #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#", false, {offset=#start#, maxResults=#limit#, timeout=150} );

		var ctotal = ORMExecuteQuery("SELECT COUNT(*) AS ctotal FROM EGRGQRYCHARTAXIS #PreserveSingleQuotes(WHERE)#", true);

		var resultArr = ArrayNew(1);
		var rootstuct = StructNew();

		for (var a = 1; a <= ArrayLen(processData); a++) {
			tmpresult = StructNew(); /*Creates new structure in every loop to be added to the array*/
		    tmpresult['CHARTAXISCODE'] = processData[a].getCHARTAXISCODE();
		    tmpresult['EQRYCODEFK'] = processData[a].getEQRYCODEFK();
		    tmpresult['AXISTYPE'] = processData[a].getAXISTYPE();
		    tmpresult['ADJUSTEND'] = processData[a].getADJUSTEND();
		    tmpresult['DASHSIZE'] = processData[a].getDASHSIZE();
		    tmpresult['FIELDS'] = processData[a].getFIELDS();
		    tmpresult['GRID'] = processData[a].getGRID();
		    tmpresult['HIDDEN'] = processData[a].getHIDDEN();
		    tmpresult['LABEL'] = processData[a].getLABEL();
		    tmpresult['LENGTH'] = processData[a].getLENGTH();
		    tmpresult['MAJORTICKSTEPS'] = processData[a].getMAJORTICKSTEPS();
		    tmpresult['MINORTICKSTEPS'] = processData[a].getMINORTICKSTEPS();
		    tmpresult['POSITION'] = processData[a].getPOSITION();
		    tmpresult['TITLE'] = processData[a].getTITLE();
		    tmpresult['WIDTH'] = processData[a].getWIDTH();
		    tmpresult['CALCULATECATEGORYCOUNT'] = processData[a].getCALCULATECATEGORYCOUNT();
		    tmpresult['CATEGORYNAMES'] = processData[a].getCATEGORYNAMES();
		    tmpresult['MARGIN'] = processData[a].getMARGIN();
		    tmpresult['MAXIMUM'] = processData[a].getMAXIMUM();
		    tmpresult['MINIMUM'] = processData[a].getMINIMUM();
		    tmpresult['STEPS'] = processData[a].getSTEPS();
		    tmpresult['ADJUSTMAXIMUMBYMAJORUNIT'] = processData[a].getADJUSTMAXIMUMBYMAJORUNIT();
		    tmpresult['ADJUSTMINIMUMBYMAJORUNIT'] = processData[a].getADJUSTMINIMUMBYMAJORUNIT();
		    tmpresult['CONSTRAIN'] = processData[a].getCONSTRAIN();
		    tmpresult['DECIMALS'] = processData[a].getDECIMALS();
		    tmpresult['FROMDATE'] = processData[a].getFROMDATE();
		    tmpresult['TODATE'] = processData[a].getTODATE();
		    tmpresult['DATEFORMAT'] = processData[a].getDATEFORMAT();
		    tmpresult['AXISEXTRA'] = processData[a].getAXISEXTRA();
		    ArrayAppend(resultArr, tmpresult);
		}

		if (Not IsDefined("ctotal")) ctotal = 0;
		rootstuct['totalCount'] = ctotal;
		rootstuct['topics'] = resultArr;
		return rootstuct;

	}

	public struct function ReadChartSeries(required string page,
								required string start,
								required string limit,
								required any sort,
								required any filter,
								required string querycode) ExtDirect=true {

		var qryObj = Createobject("component", "IBOSE.application.GridQuery");
		var dresult = qryObj.buildConditionDash(page, start, limit, sort, filter);

		var WHERE = dresult['where'];
		var ORDERBY = dresult['orderby'];

		if (trim(WHERE) neq "") WHERE = "#WHERE# AND EQRYCODEFK = '#querycode#'";
		else WHERE = "WHERE EQRYCODEFK = '#querycode#'";

		var processData = ORMExecuteQuery("FROM EGRGQRYCHARTSERIES #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#", false, {offset=#start#, maxResults=#limit#, timeout=150} );

		var ctotal = ORMExecuteQuery("SELECT COUNT(*) AS ctotal FROM EGRGQRYCHARTSERIES #PreserveSingleQuotes(WHERE)#", true);

		var resultArr = ArrayNew(1);
		var rootstuct = StructNew();

		for (var a = 1; a <= ArrayLen(processData); a++) {
			tmpresult = StructNew(); /*Creates new structure in every loop to be added to the array*/
		    tmpresult['CHARTSERIESCODE'] = processData[a].getCHARTSERIESCODE();
		    tmpresult['EQRYCODEFK'] = processData[a].getEQRYCODEFK();
		    tmpresult['HIGHLIGHT'] = processData[a].getHIGHLIGHT();
		    tmpresult['LABEL'] = processData[a].getLABEL();
		    tmpresult['LISTENERS'] = processData[a].getLISTENERS();
		    tmpresult['RENDERER'] = processData[a].getRENDERER();
		    tmpresult['SHADOWATTRIBUTES'] = processData[a].getSHADOWATTRIBUTES();
		    tmpresult['SHOWINLEGEND'] = processData[a].getSHOWINLEGEND();
		    tmpresult['TIPS'] = processData[a].getTIPS();
		    tmpresult['TITLE'] = processData[a].getTITLE();
		    tmpresult['TYPE'] = processData[a].getTYPE();
		    tmpresult['AXIS'] = processData[a].getAXIS();
		    tmpresult['XFIELD'] = processData[a].getXFIELD();
		    tmpresult['YFIELD'] = processData[a].getYFIELD();
		    tmpresult['COLUMN'] = processData[a].getCOLUMN();
		    tmpresult['GROUPGUTTER'] = processData[a].getGROUPGUTTER();
		    tmpresult['GUTTER'] = processData[a].getGUTTER();
		    tmpresult['STACKED'] = processData[a].getSTACKED();
		    tmpresult['STYLE'] = processData[a].getSTYLE();
		    tmpresult['XPADDING'] = processData[a].getXPADDING();
		    tmpresult['YPADDING'] = processData[a].getYPADDING();
		    tmpresult['ANGLEFIELD'] = processData[a].getANGLEFIELD();
		    tmpresult['DONUT'] = processData[a].getDONUT();
		    tmpresult['NEEDLE'] = processData[a].getNEEDLE();
		    tmpresult['FILL'] = processData[a].getFILL();
		    tmpresult['MARKERCONFIG'] = processData[a].getMARKERCONFIG();
		    tmpresult['SELECTIONTOLERANCE'] = processData[a].getSELECTIONTOLERANCE();
		    tmpresult['SHOWMARKERS'] = processData[a].getSHOWMARKERS();
		    tmpresult['SMOOTH'] = processData[a].getSMOOTH();
		    tmpresult['COLORSET'] = processData[a].getCOLORSET();
		    tmpresult['FIELD'] = processData[a].getFIELD();
		    tmpresult['HIGHLIGHTDURATION'] = processData[a].getHIGHLIGHTDURATION();
		    tmpresult['LENGTHFIELD'] = processData[a].getLENGTHFIELD();
		    tmpresult['SERIESEXTRA'] = processData[a].getSERIESEXTRA();
		    ArrayAppend(resultArr, tmpresult);
		}

		if (Not IsDefined("ctotal")) ctotal = 0;
	    rootstuct['totalCount'] = ctotal;
		rootstuct['topics'] = resultArr;
		return rootstuct;
	}

	public struct function AxisSubmit() ExtDirect=true ExtFormHandler=true {
		if (trim(form.CHARTAXISCODE) eq "") { // Action is add
			var c = EntityNew("EGRGQRYCHARTAXIS");
			c.setCHARTAXISCODE(createUuid());
			c.setEQRYCODEFK(trim(form.EQRYCODEFK));
			c.setAXISTYPE(trim(form.AXISTYPE));
			c.setPOSITION(trim(form.POSITION));
			c.setTITLE(trim(form.TITLE));
			c.setFIELDS(trim(form.FIELDS));
			c.setGRID(trim(form.GRID));
			c.setADJUSTEND(trim(form.ADJUSTEND));

			if(Not IsDefined("form.DASHSIZE") || form.DASHSIZE== "" ) c.setDASHSIZE(javacast("null",""));
			else c.setDASHSIZE(trim(form.DASHSIZE));

			c.setHIDDEN(trim(form.HIDDEN));
			c.setLABEL(trim(form.LABEL));

			if(Not IsDefined("form.LENGTH") || form.LENGTH== "" ) c.setLENGTH(javacast("null",""));
			else c.setLENGTH(trim(form.LENGTH));

			if(Not IsDefined("form.MAJORTICKSTEPS") || form.MAJORTICKSTEPS== "" ) c.setMAJORTICKSTEPS(javacast("null",""));
			else c.setMAJORTICKSTEPS(trim(form.MAJORTICKSTEPS));

			if(Not IsDefined("form.MINORTICKSTEPS") || form.MINORTICKSTEPS== "" ) c.setMINORTICKSTEPS(javacast("null",""));
			else c.setMINORTICKSTEPS(trim(form.MINORTICKSTEPS));

			if(Not IsDefined("form.WIDTH") || form.WIDTH== "" ) c.setWIDTH(javacast("null",""));
			else c.setWIDTH(trim(form.WIDTH));

			c.setCALCULATECATEGORYCOUNT(trim(form.CALCULATECATEGORYCOUNT));
			c.setCATEGORYNAMES(trim(form.CATEGORYNAMES));

			if(Not IsDefined("form.MARGIN") || form.MARGIN== "" ) c.setMARGIN(javacast("null",""));
			else c.setMARGIN(trim(form.MARGIN));

			c.setADJUSTMAXIMUMBYMAJORUNIT(trim(form.ADJUSTMAXIMUMBYMAJORUNIT));
			c.setADJUSTMINIMUMBYMAJORUNIT(trim(form.ADJUSTMINIMUMBYMAJORUNIT));
			c.setCONSTRAIN(trim(form.CONSTRAIN));

			if(Not IsDefined("form.DECIMALS") || form.DECIMALS== "" ) c.setDECIMALS(javacast("null",""));
			else c.setDECIMALS(trim(form.DECIMALS));

			if(Not IsDefined("form.MAXIMUM") || form.MAXIMUM== "" ) c.setMAXIMUM(javacast("null",""));
			else c.setMAXIMUM(trim(form.MAXIMUM));

			if(Not IsDefined("form.MINIMUM") || form.MINIMUM== "" ) c.setMINIMUM(javacast("null",""));
			else c.setMINIMUM(trim(form.MINIMUM));

			c.setDATEFORMAT(trim(form.DATEFORMAT));
			c.setFROMDATE(trim(form.FROMDATE));

			if(Not IsDefined("form.STEPS") || form.STEPS== "" ) c.setSTEPS(javacast("null",""));
			else c.setSTEPS(trim(form.STEPS));

			c.setTODATE(trim(form.TODATE));
			c.setAXISEXTRA(trim(form.AXISEXTRA));
		} else { // Action is update
			var c = EntityLoad("EGRGQRYCHARTAXIS", trim(form.CHARTAXISCODE), true);
			c.setAXISTYPE(trim(form.AXISTYPE));
			c.setPOSITION(trim(form.POSITION));
			c.setTITLE(trim(form.TITLE));
			c.setFIELDS(trim(form.FIELDS));
			c.setGRID(trim(form.GRID));
			c.setADJUSTEND(trim(form.ADJUSTEND));

			if(Not IsDefined("form.DASHSIZE") || form.DASHSIZE== "" ) c.setDASHSIZE(javacast("null",""));
			else c.setDASHSIZE(trim(form.DASHSIZE));

			c.setHIDDEN(trim(form.HIDDEN));
			c.setLABEL(trim(form.LABEL));

			if(Not IsDefined("form.LENGTH") || form.LENGTH== "" ) c.setLENGTH(javacast("null",""));
			else c.setLENGTH(trim(form.LENGTH));

			if(Not IsDefined("form.MAJORTICKSTEPS") || form.MAJORTICKSTEPS== "" ) c.setMAJORTICKSTEPS(javacast("null",""));
			else c.setMAJORTICKSTEPS(trim(form.MAJORTICKSTEPS));

			if(Not IsDefined("form.MINORTICKSTEPS") || form.MINORTICKSTEPS== "" ) c.setMINORTICKSTEPS(javacast("null",""));
			else c.setMINORTICKSTEPS(trim(form.MINORTICKSTEPS));

			if(Not IsDefined("form.WIDTH") || form.WIDTH== "" ) c.setWIDTH(javacast("null",""));
			else c.setWIDTH(trim(form.WIDTH));

			c.setCALCULATECATEGORYCOUNT(trim(form.CALCULATECATEGORYCOUNT));
			c.setCATEGORYNAMES(trim(form.CATEGORYNAMES));

			if(Not IsDefined("form.MARGIN") || form.MARGIN== "" ) c.setMARGIN(javacast("null",""));
			else c.setMARGIN(trim(form.MARGIN));

			c.setADJUSTMAXIMUMBYMAJORUNIT(trim(form.ADJUSTMAXIMUMBYMAJORUNIT));
			c.setADJUSTMINIMUMBYMAJORUNIT(trim(form.ADJUSTMINIMUMBYMAJORUNIT));
			c.setCONSTRAIN(trim(form.CONSTRAIN));

			if(Not IsDefined("form.DECIMALS") || form.DECIMALS== "" ) c.setDECIMALS(javacast("null",""));
			else c.setDECIMALS(trim(form.DECIMALS));

			if(Not IsDefined("form.MAXIMUM") || form.MAXIMUM== "" ) c.setMAXIMUM(javacast("null",""));
			else c.setMAXIMUM(trim(form.MAXIMUM));

			if(Not IsDefined("form.MINIMUM") || form.MINIMUM== "" ) c.setMINIMUM(javacast("null",""));
			else c.setMINIMUM(trim(form.MINIMUM));

			c.setDATEFORMAT(trim(form.DATEFORMAT));
			c.setFROMDATE(trim(form.FROMDATE));

			if(Not IsDefined("form.STEPS") || form.STEPS== "" ) c.setSTEPS(javacast("null",""));
			else c.setSTEPS(trim(form.STEPS));

			c.setTODATE(trim(form.TODATE));
			c.setAXISEXTRA(trim(form.AXISEXTRA));
		}

		EntitySave(c);

		OrmFlush();

		var rs = StructNew();
		rs["success"] = true;
		rs["message"] = "";

		return rs;
	}

	public struct function SeriesSubmit() ExtDirect=true ExtFormHandler=true {
		if (trim(form.CHARTSERIESCODE) eq "") { // Action is add
			var c = EntityNew("EGRGQRYCHARTSERIES");
			c.setCHARTSERIESCODE(createUuid());
			c.setEQRYCODEFK(trim(form.EQRYCODEFK));
			c.setTYPE(trim(form.TYPE));
			c.setAXIS(trim(form.AXIS));
			c.setHIGHLIGHT(trim(form.HIGHLIGHT));
			c.setXFIELD(trim(form.XFIELD));
			c.setYFIELD(trim(form.YFIELD));
			c.setLABEL(trim(form.LABEL));
			c.setLISTENERS(trim(form.LISTENERS));
			c.setRENDERER(trim(form.RENDERER));
			c.setSHADOWATTRIBUTES(trim(form.SHADOWATTRIBUTES));
			c.setSHOWINLEGEND(trim(form.SHOWINLEGEND));
			c.setSTYLE(trim(form.STYLE));
			c.setTIPS(trim(form.TIPS));
			c.setTITLE(trim(form.TITLE));
			c.setCOLUMN(trim(form.COLUMN));

			if(Not IsDefined("form.GROUPGUTTER") || form.GROUPGUTTER== "" ) c.setGROUPGUTTER(javacast("null",""));
			else c.setGROUPGUTTER(trim(form.GROUPGUTTER));

			if(Not IsDefined("form.GUTTER") || form.GUTTER== "" ) c.setGUTTER(javacast("null",""));
			else c.setGUTTER(trim(form.GUTTER));

			c.setSTACKED(trim(form.STACKED));
			c.setXPADDING(trim(form.XPADDING));
			c.setYPADDING(trim(form.YPADDING));
			c.setANGLEFIELD(trim(form.ANGLEFIELD));
			c.setDONUT(trim(form.DONUT));

			if(Not IsDefined("form.HIGHLIGHTDURATION") || form.HIGHLIGHTDURATION== "" ) c.setHIGHLIGHTDURATION(javacast("null",""));
			else c.setHIGHLIGHTDURATION(trim(form.HIGHLIGHTDURATION));

			c.setNEEDLE(trim(form.NEEDLE));
			c.setFILL(trim(form.FILL));
			c.setMARKERCONFIG(trim(form.MARKERCONFIG));

			if(Not IsDefined("form.SELECTIONTOLERANCE") || form.SELECTIONTOLERANCE== "" ) c.setSELECTIONTOLERANCE(javacast("null",""));
			else c.setSELECTIONTOLERANCE(trim(form.SELECTIONTOLERANCE));

			c.setSHOWMARKERS(trim(form.SHOWMARKERS));
			c.setSMOOTH(trim(form.SMOOTH));
			c.setCOLORSET(trim(form.COLORSET));
			c.setFIELD(trim(form.FIELD));
			c.setLENGTHFIELD(trim(form.LENGTHFIELD));
			c.setSERIESEXTRA(trim(form.SERIESEXTRA));

		} else { // Action is update
			var c = EntityLoad("EGRGQRYCHARTSERIES", trim(form.CHARTSERIESCODE), true);
			c.setTYPE(trim(form.TYPE));
			c.setAXIS(trim(form.AXIS));
			c.setHIGHLIGHT(trim(form.HIGHLIGHT));
			c.setXFIELD(trim(form.XFIELD));
			c.setYFIELD(trim(form.YFIELD));
			c.setLABEL(trim(form.LABEL));
			c.setLISTENERS(trim(form.LISTENERS));
			c.setRENDERER(trim(form.RENDERER));
			c.setSHADOWATTRIBUTES(trim(form.SHADOWATTRIBUTES));
			c.setSHOWINLEGEND(trim(form.SHOWINLEGEND));
			c.setSTYLE(trim(form.STYLE));
			c.setTIPS(trim(form.TIPS));
			c.setTITLE(trim(form.TITLE));
			c.setCOLUMN(trim(form.COLUMN));

			if(Not IsDefined("form.GROUPGUTTER") || form.GROUPGUTTER== "" ) c.setGROUPGUTTER(javacast("null",""));
			else c.setGROUPGUTTER(trim(form.GROUPGUTTER));

			if(Not IsDefined("form.GUTTER") || form.GUTTER== "" ) c.setGUTTER(javacast("null",""));
			else c.setGUTTER(trim(form.GUTTER));

			c.setSTACKED(trim(form.STACKED));
			c.setXPADDING(trim(form.XPADDING));
			c.setYPADDING(trim(form.YPADDING));
			c.setANGLEFIELD(trim(form.ANGLEFIELD));
			c.setDONUT(trim(form.DONUT));

			if(Not IsDefined("form.HIGHLIGHTDURATION") || form.HIGHLIGHTDURATION== "" ) c.setHIGHLIGHTDURATION(javacast("null",""));
			else c.setHIGHLIGHTDURATION(trim(form.HIGHLIGHTDURATION));

			c.setNEEDLE(trim(form.NEEDLE));
			c.setFILL(trim(form.FILL));
			c.setMARKERCONFIG(trim(form.MARKERCONFIG));

			if(Not IsDefined("form.SELECTIONTOLERANCE") || form.SELECTIONTOLERANCE== "" ) c.setSELECTIONTOLERANCE(javacast("null",""));
			else c.setSELECTIONTOLERANCE(trim(form.SELECTIONTOLERANCE));

			c.setSHOWMARKERS(trim(form.SHOWMARKERS));
			c.setSMOOTH(trim(form.SMOOTH));
			c.setCOLORSET(trim(form.COLORSET));
			c.setFIELD(trim(form.FIELD));
			c.setLENGTHFIELD(trim(form.LENGTHFIELD));
			c.setSERIESEXTRA(trim(form.SERIESEXTRA));
		}

		EntitySave(c);

		OrmFlush();

		var rs = StructNew();
		rs["success"] = true;
		rs["message"] = "";

		return rs;
	}

	public string function axisSeriesDelete(required string axisseries, required string dcode) ExtDirect=true {
		if (axisseries == "chartaxis") {
			var c = EntityLoad("EGRGQRYCHARTAXIS", trim(dcode), true);
		} else if (axisseries == "chartseries") { // chart series
			var c = EntityLoad("EGRGQRYCHARTSERIES", trim(dcode), true);
		}
		if (IsDefined("c"))
			EntityDelete(c);
		OrmFlush();
		return "success";
	}

	private void function setData(required String querycode, required String querycodeAsNameSpace) {
		SaveContent variable="Data" {
		WriteOutput("
		component  output=false persistent=false ExtDirect=true {
		public struct function Read(required string page,
									required string start,
									required string limit,
									required struct chartparams)
		ExtDirect=true
		{
		");

			// SELECT part > DISPLAY & FIELDALIAS
			selectArr = ArrayNew(1);
			columnStruct = StructNew();
			selectObj = EntityLoad("EGRGEVIEWFIELDS", {EQRYCODEFK = "#querycode#"}, false);
			for (a = 1; a <= ArrayLen(selectObj); a++) {
				if(trim(selectObj[a].getFIELDALIAS()) eq "") {
					ArrayAppend(selectArr, selectObj[a].getDISPLAY());
					columnStruct["#selectObj[a].getFIELDNAME()#"] = "#selectObj[a].getTABLENAME()#-#selectObj[a].getFIELDNAME()#";
				} else {
					ArrayAppend(selectArr, selectObj[a].getDISPLAY() & " AS '" & selectObj[a].getFIELDALIAS() & "'");
					columnStruct["#selectObj[a].getFIELDALIAS()#"] = "#selectObj[a].getTABLENAME()#-#selectObj[a].getFIELDNAME()#";
				}

			}
			selectStr = ArrayToList(selectArr, ", ");

			// FROM part
			dfirsttable = "";
			fromArr = ArrayNew(1);
			fromObj = EntityLoad("EGRGEVIEWJOINEDTABLES", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
			if (ArrayLen(fromObj) > 0) {
				for (a = 1; a <= ArrayLen(fromObj); a++) {
					ArrayAppend(fromArr, fromObj[a].getDISPLAY());
				}
				fromStr = ArrayToList(fromArr, " ");
				dfirsttable = fromObj[1].getTABLENAME();
			} else {
				fromObj = EntityLoad("EGRGEVIEWTABLES", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
				for (a = 1; a <= ArrayLen(fromObj); a++) {
					ArrayAppend(fromArr, fromObj[a].getTEMPTABLE() & " " & fromObj[a].getTABLEALIAS());
				}
				fromStr = ArrayToList(fromArr, ", ");
				dfirsttable = fromObj[1].getTEMPTABLE();
			}


			// WHERE part
			whereArr = ArrayNew(1);
			whereObj = EntityLoad("EGRGEVIEWCONDITION", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
			for (a = 1; a <= ArrayLen(whereObj); a++) {
				ArrayAppend(whereArr, whereObj[a].getCONJUNCTIVEOPERATOR() & " " & whereObj[a].getONCOLUMN() & " " & whereObj[a].getCONDITIONOPERATOR() & " " & whereObj[a].getCOLUMNVALUE());
			}
			whereStr = ArrayToList(whereArr, " ");

			// GROUP BY part
			groupbyArr = ArrayNew(1);
			groupbyObj = EntityLoad("EGRGEVIEWGROUPBY", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
			for (a = 1; a <= ArrayLen(groupbyObj); a++) {
				ArrayAppend(groupbyArr, groupbyObj[a].getGROUPBYCOLUMN());
			}
			groupbyStr = ArrayToList(groupbyArr, ", ");

			// HAVING part
			havingArr = ArrayNew(1);
			havingObj = EntityLoad("EGRGEVIEWHAVING", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
			for (a = 1; a <= ArrayLen(havingObj); a++) {
				ArrayAppend(havingArr, havingObj[a].getDISPLAY());
			}
			havingStr = ArrayToList(havingArr, " ");

			// ORDER BY part
			orderbyArr = ArrayNew(1);
			orderbyObj = EntityLoad("EGRGEVIEWORDERBY", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
			for (a = 1; a <= ArrayLen(orderbyObj); a++) {
				ArrayAppend(orderbyArr, orderbyObj[a].getDISPLAY() & " " & orderbyObj[a].getASCORDESC());
			}
			orderbyStr = ArrayToList(orderbyArr, ", ");

			if(trim(selectStr) eq "") {
				selectStr = "SELECT * ";
			} else {
				selectStr = "SELECT " & selectStr;
			}

			if(trim(fromStr) eq "") {
				throw(message="Table not specified", detail="Table not specified");
			} else {
				fromStr = "FROM " & fromStr;
			}

			if(trim(whereStr) eq "") {
				whereStr = "";
				wStr = "";
			} else {
				whereStr = "WHERE " & whereStr;
				wStr = " AND " & whereStr;
			}

			if(trim(groupbyStr) eq "") {
				groupbyStr = "";
			} else {
				groupbyStr = "GROUP BY " & groupbyStr;
			}

			if(trim(havingStr) eq "") {
				havingStr = "";
			} else {
				havingStr = "HAVING " & havingStr;
			}


			if(trim(orderbyStr) eq "") {
				orderbyStr = "";
				oStr = "";
			} else {
				orderbyStr = "ORDER BY " & orderbyStr;
				oStr = "," & orderbyStr;
			}

		WriteOutput("
		    var whereStr = '#whereStr#';
			/* Dynamically processes extra parameters */
			if (!StructIsEmpty(chartparams)) {
				var extraparamKeys = StructKeyArray(chartparams);
				var extraCondArr = ArrayNew(1);
				for (var b=1; b <= ArrayLen(extraparamKeys); b++) {
					var excond = ""##replace(extraparamKeys[b],'_','.')## = '"" & chartparams[""##extraparamKeys[b]##""] & ""'"";
					ArrayAppend(extraCondArr, excond);
				}
				var excondition = ArrayToList(extraCondArr, "" AND "");
				if (whereStr == """") {
					whereStr = ""WHERE "" & excondition;
				} else {
					whereStr = whereStr & "" AND "" & excondition;
				}
			}
		");

			// replace {PERSONNELIDNO}, {USERID}, {GUID}, {COMPANYCODE} to their corresponding values
			Dsql = "#selectStr#
					 #fromStr#
					 #whereStr#
					 #groupbyStr#
					 #havingStr#
					 #orderbyStr#";

			var dg = CreateObject("component", "Grid");
			selectStr = dg.replaceUserParam(selectStr);
			fromStr = dg.replaceUserParam(fromStr);
			whereStr = dg.replaceUserParam(whereStr);
			groupbyStr = dg.replaceUserParam(groupbyStr);
			havingStr = dg.replaceUserParam(havingStr);
			orderbyStr = dg.replaceUserParam(orderbyStr);
			Dsql = dg.replaceUserParam(Dsql);

		WriteOutput("

			Usql = ""#selectStr#
					 #fromStr#
					 ##whereStr##
					 #groupbyStr#
					 #havingStr#
					 #orderbyStr#"";

			queryService = new query();
			queryService.setDatasource(""##session.global_dsn##"");
		  	queryService.setName(""dqueryname"");
			queryService.setSQL(Usql);
			theResultSet = queryService.execute();
			dquery = theResultSet.getResult();

			resultArr = ArrayNew(1);
			rootstuct = StructNew();
		    rootstuct[""totalCount""] = dquery.recordCount;

			if (dquery.recordCount < limit) {
		    	limit = dquery.recordCount;
		    }
		    /*Creates an array of structure to be converted to JSON using serializeJSON*/
			for (var b = start+1; b <= start+limit; b++) {
		    	tmpresult = StructNew();
		 ");

			Usql = "#Dsql#";

			queryService = new query();
			queryService.setDatasource(session.global_dsn);
		  	queryService.setName("dqueryname");
			queryService.setSQL(Usql);
			theResultSet = queryService.execute();
			dquery = theResultSet.getResult();
			collistArr = dquery.getColumnList();
		    		for (c = 1; c <= ArrayLen(collistArr); c++) {
		    			gridDataIndex = columnStruct["#collistArr[c]#"];
		   			WriteOutput("
		    			tmpresult[""#gridDataIndex#""] = dquery[""#collistArr[c]#""][b];");
		    		}

		WriteOutput("
				ArrayAppend(resultArr, tmpresult);
		    }
		    rootstuct[""topics""] = resultArr;
			return rootstuct;
		}


	}");



	} // end SaveContent

	var dpath = ExpandPath("../../../myapps/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "Data.cfc", Data, "utf-8");

	} // end setData


}