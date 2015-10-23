/**
 * Database
 *
 * @author LEONELL
 * @date 7/1/15
 **/
component accessors=true output=false persistent=false {

	public void function setAppMenu(required string liveboardcode, required string liveboardcodeNS,
									required any lbsource, required array lbitemsource) {

		var dmenuid = "MENU" & liveboardcode;
		// delete menu only, menu rights can be revoked using the menu user manager
		var dm = EntityLoad("EGRGMENU", dmenuid, true);
		if (IsDefined("dm")) {
			EntityDelete(dm);
			OrmFlush();
		}

		var dmenuname = lbsource.getLBTITLE();
		var dtabidfk = "ACTAB221FEE3B-C36A-CDDE-E414D4E5800AB5D9";
		var dhierarchylevel = 2;
		var dmenuorder = 1;
		var dparentmenuid = "MENU201506291406889"; //iBOS/e Liveboard
		var dsourcelink = "?bdg=#liveboardcode#";
		var dobjectidfk = "MENU";
		var dpersonnelidno = session.chapa;
		var dapproved = "N";
		var deformid = "4F48F4AD-0457-9CC5-8737A32631F64FF6";
		var dprocessid = CreateUuid();


		var nmenu = EntityNew("EGRGMENU");
		nmenu.setMENUID(dmenuid);
		nmenu.setMENUNAME(dmenuname);
		if (trim(lbsource.getLIVEBOARDDESC() != "")) nmenu.setMENUHINT(lbsource.getLIVEBOARDDESC());
		nmenu.setTABIDFK(dtabidfk);
		nmenu.setHIERARCHYLEVEL(dhierarchylevel);
		nmenu.setMENUORDER(dmenuorder);
		nmenu.setPARENTMENUID(dparentmenuid);
		nmenu.setSOURCELINK(dsourcelink);
		nmenu.setOBJECTIDFK(dobjectidfk);
		nmenu.setPERSONNELIDNO(dpersonnelidno);
		nmenu.setAPPROVED(dapproved);
		nmenu.setEFORMID(deformid);
		nmenu.setPROCESSID(dprocessid);
		nmenu.setDATELASTUPDATE(CreateODBCDateTime(now()));
		nmenu.setRECDATECREATED(CreateODBCDateTime(now()));



		var dmr = EntityLoad("EGRTMENU", {MENUID = #dmenuid#, USERID = #session.userid#}, true);
		if (IsDefined("dmr")) {
			EntityDelete(dmr);
			OrmFlush();
		}

		var nmenuright = EntityNew("EGRTMENU");
		nmenuright.setMENUID(dmenuid);
		nmenuright.setUSERID(session.userid);

		EntitySave(nmenu);
		EntitySave(nmenuright);

		OrmFlush();
	}

	public array function getQueryNamespace(required array lbitemsource) {
		var qrynamespaceArr = ArrayNew(1);
		for (var b = 1; b <= ArrayLen(lbitemsource); b++) {
			if (trim(lbitemsource[b].getXTYPE()) != "")  {
				var r = EntityLoad("EGRGQUERY", lbitemsource[b].getXTYPE(), true);
				if (IsDefined("r")) {
					var querycodeNS = "NS_" & rereplace(lbitemsource[b].getXTYPE(), "\W", "", "all");
					// Do not insert duplicate namespace
					if (!ArrayContains(qrynamespaceArr, querycodeNS)) {
						ArrayAppend(qrynamespaceArr, querycodeNS);
					}
				}
			}
		}

		return qrynamespaceArr;
	}

	public void function setUserApp(required string liveboardcode, required string liveboardcodeNS,
									required any lbsource, required array lbitemsource) {


		var nsArr = ArrayNew(1);
		var scriptreq = ArrayNew(1);
		ArrayAppend(scriptreq, "Ext.container.Viewport");
		ArrayAppend(scriptreq, "Ext.direct.*");
		ArrayAppend(scriptreq, "Ext.data.*");
		ArrayAppend(scriptreq, "Ext.util.*");
		ArrayAppend(scriptreq, "Ext.panel.*");
		ArrayAppend(scriptreq, "Ext.layout.*");
		ArrayAppend(scriptreq, "Ext.toolbar.*");
		ArrayAppend(scriptreq, "Ext.ux.grid.FiltersFeature");
		ArrayAppend(scriptreq, "Ext.grid.plugin.*");
		ArrayAppend(scriptreq, "Ext.ux.ajax.JsonSimlet");
		ArrayAppend(scriptreq, "Ext.ux.ajax.SimManager");
		ArrayAppend(scriptreq, "Ext.button.*");
		ArrayAppend(scriptreq, "Ext.ux.grid.Printer");

		nsArr = getQueryNamespace(lbitemsource);
		for (var a = 1; a <= ArrayLen(nsArr); a++) {
			s = FileRead(ExpandPath("../../myapps/queryoutput/#trim(ucase(session.companycode))#/#trim(nsArr[a])#/app.js"), "utf-8");

			if (FindNoCase("Ext.grid", s) != 0) {
				// no duplicate script please
				if (!ArrayContains(scriptreq,"Ext.grid.*")) ArrayAppend(scriptreq, "Ext.grid.*");
			}
			if (FindNoCase("Ext.form", s) != 0) {
				if (!ArrayContains(scriptreq,"Ext.form.*")) ArrayAppend(scriptreq, "Ext.form.*");
			}
			if (FindNoCase("Ext.chart", s) != 0) {
				if (!ArrayContains(scriptreq,"Ext.chart.*")) ArrayAppend(scriptreq, "Ext.chart.*");
			}
			if (FindNoCase("Ext.dd", s) != 0) {
				if (!ArrayContains(scriptreq,"Ext.dd.*")) ArrayAppend(scriptreq, "Ext.dd.*");
			}
			if (FindNoCase("Ext.picker", s) != 0) {
				if (!ArrayContains(scriptreq,"Ext.picker.*")) ArrayAppend(scriptreq, "Ext.picker.*");
			}
			if (FindNoCase("Ext.resizer", s) != 0) {
				if (!ArrayContains(scriptreq,"Ext.resizer.*")) ArrayAppend(scriptreq, "Ext.resizer.*");
			}
			if (FindNoCase("Ext.menu", s) != 0) {
				if (!ArrayContains(scriptreq,"Ext.menu.*")) ArrayAppend(scriptreq, "Ext.menu.*");
			}
			if (FindNoCase("Ext.state", s) != 0) {
				if (!ArrayContains(scriptreq,"Ext.state.*")) ArrayAppend(scriptreq, "Ext.state.*");
			}
			if (FindNoCase("Ext.tree", s) != 0) {
				if (!ArrayContains(scriptreq,"Ext.tree.*")) ArrayAppend(scriptreq, "Ext.tree.*");
			}
		}

		var scriptrequired = "['" & ArrayToList(scriptreq, "', '") & "']";
		dappid = liveboardcode;
		var dfolderidfk = "A";
		var dtabidfk = "A";
		var dojbectidfk = "APPLICATION";
		var dscriptrequires = scriptrequired;

		var dnameortitle = "iBOS/e LiveBoard";
		var dapporder = 1;
		var nextnamespaceArr = ArrayNew(1);
		ArrayAppend(nextnamespaceArr, "header");
		ArrayAppend(nextnamespaceArr, "nav");
		ArrayAppend(nextnamespaceArr, liveboardcodeNS);

		var extcontrollerArr = ArrayNew(1);
		ArrayAppend(extcontrollerArr, "main");
		ArrayAppend(extcontrollerArr, "main.login");
		ArrayAppend(extcontrollerArr, "navigator.navigatorController");
		ArrayAppend(extcontrollerArr, "header.headerController");
		ArrayAppend(extcontrollerArr, "dashboard.#trim(ucase(session.companycode))#.#trim(liveboardcodeNS)#.Controller");

		var apisourceArr = ArrayNew(1);
		ArrayAppend(apisourceArr, "myapps/header/Api.cfm");
		ArrayAppend(apisourceArr, "myapps/navigator/Api.cfm");
		ArrayAppend(apisourceArr, "myapps/dashboard/#trim(ucase(session.companycode))#/#trim(liveboardcodeNS)#/Api.cfm");

		for (a = 1; a <= ArrayLen(nsArr); a++) {
			ArrayAppend(nextnamespaceArr, nsArr[a]);
			ArrayAppend(extcontrollerArr, "queryoutput.#trim(ucase(session.companycode))#.#trim(nsArr[a])#.Controller");
			ArrayAppend(apisourceArr, "myapps/queryoutput/#trim(ucase(session.companycode))#/#trim(nsArr[a])#/Api.cfm");
		}
		var dextnamespace = ArrayToList(nextnamespaceArr, ",");
		var dextcontrollers = "['" & ArrayToList(extcontrollerArr, "','") & "']";
		var dapiscriptsource = ArrayToList(apisourceArr, ",");

		var appicon = "diginfologo.ico";
		var extacss = ".icon-add {
							background-image:url(./resource/image/tab/Test.png);
					    }

						.icon-HR {
							background-image:url(./resource/image/tab/calendar.png);
						}

						.eformmanager {
						background-image:url(./resource/image/tab/app.png);
						}

						.whatsnew{
						background-image:url(./resource/image/menu/whatsnew.png);
						}
						.eviews{
						background-image:url(./resource/image/menu/eviews.png);
						}
						.ereports{
						background-image:url(./resource/image/menu/ereports.png);
						}
						.egraphs{
						background-image:url(./resource/image/menu/egraphs.png);
						}
						.equeries{
						background-image:url(./resource/image/menu/equeries.png);
						}
						.ereminders{
						background-image:url(./resource/image/menu/ereminders.png);
						}
						.webshell{
						background-color: rgb(146,197,0);
						}
						.knowledgeware{
						background-color: rgb(255,208,96);
						}
						.peopleware{
						background-color: rgb(255,95,95);
						}
						.businessware{
						background-color: rgb(80,192,233);
						}
						.campusware{
						background-color: rgb(197,139,226);
						}
						.customware{
						background-color: rgb(255,175,175);
						}
						.otherware{
						background-color: rgb(138,213,240);
						}
						.adminware{
						background-color: rgb(207,159,231);
						}
						.eforms {
						background-image:url(./resource/image/menu/eforms.png);
						}
						.eforums {
						background-image:url(./resource/image/menu/eforums.png);
						}
						.erooms {
						background-image:url(./resource/image/menu/erooms.png);
						}
						.etunes {
						background-image:url(./resource/image/menu/etunes.png);
						}
						.egallery {
						background-image:url(./resource/image/menu/egallery.png);
						}
						.enotes {
						background-image:url(./resource/image/menu/enotes.png);
						}
						.ebooks {
						background-image:url(./resource/image/menu/ebooks.png);
						}
						.efiles {
						background-image:url(./resource/image/menu/efiles.png);
						}
						.print-icon {
							background-image:url(./resource/image/appicon/print-icon.png);
							background-size: 15px 15px;
						}
						.view-icon {
							background-image:url(./resource/image/appicon/view-icon.png);
							background-size: 15px 15px;
						}
						.add-icon {
							background-image:url(./resource/image/appicon/add-icon.png);
							background-size: 15px 15px;
						}
						.edit-icon {
							background-image:url(./resource/image/appicon/edit-icon.png);
							background-size: 15px 15px;
						}
						.copy-icon {
							background-image:url(./resource/image/appicon/copy-icon.png);
							background-size: 15px 15px;
						}
						.delete-icon {
							background-image:url(./resource/image/appicon/delete-icon.png);
							background-size: 15px 15px;
						}
						.export-icon {
							background-image:url(./resource/image/appicon/export-icon.png);
							background-size: 15px 15px;
						}
						.email-icon {
							background-image:url(./resource/image/appicon/email-icon.png);
							background-size: 15px 15px;
						}";

		var dpersonnelidno = session.chapa;
		var dapproved = "N";
		var deformid = "1A5D373D-DC49-6E14-728E50055FDDDE93";
		var dprocessid = CreateUuid();

		var dapp = EntityLoad("EGRGUSERAPP", dappid, true);
		if (IsDefined("dapp")) {
			EntityDelete(dapp);
			OrmFlush();
		}

		var napp = EntityNew("EGRGUSERAPP");
		napp.setAPPID(dappid);
		napp.setFOLDERIDFK(dfolderidfk);
		napp.setTABIDFK(dtabidfk);
		napp.setOBJECTIDFK(dojbectidfk);
		napp.setSCRIPTREQUIRES(dscriptrequires);
		napp.setNAMEORTITLE(dnameortitle);
		napp.setAPPORDER(dapporder);
		napp.setEXTNAMESPACE(dextnamespace);
		napp.setEXTCONTROLLERS(dextcontrollers);
		napp.setAPISCRIPTSOURCE(dapiscriptsource);
		napp.setAPPICON(appicon);
		napp.setEXTRACSS(extacss);
		napp.setPERSONNELIDNO(dpersonnelidno);
		napp.setAPPROVED(dapproved);
		napp.setEFORMID(deformid);
		napp.setPROCESSID(dprocessid);
		napp.setDATELASTUPDATE(CreateODBCDateTime(now()));
		napp.setRECDATECREATED(CreateODBCDateTime(now()));

		// The region part

		setAppRegion(dappid, liveboardcode, liveboardcodeNS, lbsource, lbitemsource);
		setAppRegionAdminUser(dappid);

		EntitySave(napp);
		OrmFlush();

	}

	public void function setAppRegion(required string dappid, required string liveboardcode,
									required string liveboardcodeNS, required any lbsource, required array lbitemsource) {

		// start from the SOUTH
		var appsouth = EntityNew("EGRGAPPREGION");
		appsouth.setREGIONID("SOUTH#right(dappid, 7)#");
		appsouth.setAPPIDFK(dappid);
		appsouth.setREGIONNAME("south");
		appsouth.setHIDDEN("true");
		appsouth.setPERSONNELIDNO(session.chapa);
		appsouth.setAPPROVED("N");
		appsouth.setEFORMID("1B45E26B-F39C-0DCF-FCBE7EA758A244A6");
		appsouth.setPROCESSID(CreateUuid());
		appsouth.setDATELASTUPDATE(CreateODBCDateTime(now()));
		appsouth.setRECDATECREATED(CreateODBCDateTime(now()));

		EntitySave(appsouth);
		OrmFlush();

		//  WEST
		var appwest = EntityNew("EGRGAPPREGION");
		appwest.setREGIONID("WEST#right(dappid, 7)#");
		appwest.setAPPIDFK(dappid);
		appwest.setREGIONNAME("west");
		appwest.setHIDDEN("");
		appwest.setHEIGHT("");
		appwest.setWIDTH(277);
		appwest.setSPLIT("");
		appwest.setTITLE("My iBOS/e");
		appwest.setMARGINS("");
		appwest.setPADDING("5 5 0 0");
		appwest.setCOLLAPSIBLE("true");
		appwest.setAUTOSCROLL("true");
		appwest.setLAYOUT("type: 'vbox',align: 'center'");
		appwest.setITEMSWIDGETNAMES("[{ xtype: 'accordionview' }], autoScroll: true,");
		appwest.setPERSONNELIDNO(session.chapa);
		appwest.setAPPROVED("N");
		appwest.setEFORMID("1B45E26B-F39C-0DCF-FCBE7EA758A244A6");
		appwest.setPROCESSID(CreateUuid());
		appwest.setDATELASTUPDATE(CreateODBCDateTime(now()));
		appwest.setRECDATECREATED(CreateODBCDateTime(now()));

		EntitySave(appwest);
		OrmFlush();

		//  NORTH
		var appnorth = EntityNew("EGRGAPPREGION");
		appnorth.setREGIONID("NORTH#right(dappid, 7)#");
		appnorth.setAPPIDFK(dappid);
		appnorth.setREGIONNAME("north");
		appnorth.setHIDDEN("");
		appnorth.setHEIGHT(50);
		appnorth.setWIDTH("");
		appnorth.setSPLIT("");
		appnorth.setTITLE("");
		appnorth.setMARGINS("");
		appnorth.setPADDING("0 0 0 0");
		appnorth.setCOLLAPSIBLE("");
		appnorth.setAUTOSCROLL("");
		appnorth.setLAYOUT("");
		appnorth.setITEMSWIDGETNAMES("[{ xtype: 'headerview' }]");
		appnorth.setPERSONNELIDNO(session.chapa);
		appnorth.setAPPROVED("N");
		appnorth.setEFORMID("1B45E26B-F39C-0DCF-FCBE7EA758A244A6");
		appnorth.setPROCESSID(CreateUuid());
		appnorth.setDATELASTUPDATE(CreateODBCDateTime(now()));
		appnorth.setRECDATECREATED(CreateODBCDateTime(now()));

		EntitySave(appnorth);
		OrmFlush();

		//  EAST
		var appeast = EntityNew("EGRGAPPREGION");
		appeast.setREGIONID("EAST#right(dappid, 7)#");
		appeast.setAPPIDFK(dappid);
		appeast.setREGIONNAME("east");
		appeast.setHIDDEN("true");
		appeast.setPERSONNELIDNO(session.chapa);
		appeast.setAPPROVED("N");
		appeast.setEFORMID("1B45E26B-F39C-0DCF-FCBE7EA758A244A6");
		appeast.setPROCESSID(CreateUuid());
		appeast.setDATELASTUPDATE(CreateODBCDateTime(now()));
		appeast.setRECDATECREATED(CreateODBCDateTime(now()));

		EntitySave(appeast);
		OrmFlush();

		var ho = CreateObject("component", "Helper");
		var rs = StructNew();
		rs = ho.setAppJSParams(liveboardcode, liveboardcodeNS, lbsource, lbitemsource);

		var dlayout = "type: 'table',
					   columns: #rs.tcolumns##rs.ditemclass##rs.dtableattr##rs.dtdattr##rs.dtrattr##rs.dLextra#";
		var dwidgets = "#rs.ditems#";

		// CENTER
		var appcenter = EntityNew("EGRGAPPREGION");
		appcenter.setREGIONID("CENTER#right(dappid, 7)#");
		appcenter.setAPPIDFK(dappid);
		appcenter.setREGIONNAME("center");
		appcenter.setHIDDEN("");
		appcenter.setHEIGHT(rs.pheight);
		appcenter.setWIDTH(rs.pwidth);
		appcenter.setSPLIT("");
		appcenter.setTITLE(lbsource.getLBTITLE());
		appcenter.setMARGINS("");
		appcenter.setPADDING("0 0 0 5");
		appcenter.setCOLLAPSIBLE("");
		appcenter.setAUTOSCROLL("true");
		appcenter.setPANELEXTRA(rs.pextra);
		appcenter.setLAYOUT(dlayout);
		appcenter.setITEMSWIDGETNAMES(dwidgets);
		appcenter.setPERSONNELIDNO(session.chapa);
		appcenter.setAPPROVED("N");
		appcenter.setEFORMID("1B45E26B-F39C-0DCF-FCBE7EA758A244A6");
		appcenter.setPROCESSID(CreateUuid());
		appcenter.setDATELASTUPDATE(CreateODBCDateTime(now()));
		appcenter.setRECDATECREATED(CreateODBCDateTime(now()));

		EntitySave(appcenter);
		OrmFlush();

	}

	public void function setAppRegionAdminUser(required string dappid) {
		var rtapp = EntityLoad("EGRTUSERAPP", {APPID = #dappid#, USERID = #session.userid#}, true);
		if (IsDefined("rtapp")) {
			EntityDelete(rtapp);
			OrmFlush();
		}

		var appright = EntityNew("EGRTUSERAPP");
		appright.setAPPID(dappid);
		appright.setUSERID(session.userid);

		EntitySave(appright);

		OrmFlush();
	}

	public void function removeLiveboardData(required string liveboardcode) {

		var dmenuid = "MENU" & liveboardcode;
		var dm = EntityLoad("EGRGMENU", dmenuid, true);
		if (IsDefined("dm")) {
			EntityDelete(dm);
			OrmFlush();
		}

		var dmr = EntityLoad("EGRTMENU", {MENUID = #dmenuid#, USERID = #session.userid#}, true);
		if (IsDefined("dmr")) {
			EntityDelete(dmr);
			OrmFlush();
		}

		var dappid = liveboardcode;
		var dapp = EntityLoad("EGRGUSERAPP", dappid, true);
		if (IsDefined("dapp")) {
			EntityDelete(dapp);
			OrmFlush();
		}

		var rtapp = EntityLoad("EGRTUSERAPP", {APPID = #dappid#, USERID = #session.userid#}, true);
		if (IsDefined("rtapp")) {
			EntityDelete(rtapp);
			OrmFlush();
		}

   }

}