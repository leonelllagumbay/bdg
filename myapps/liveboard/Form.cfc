component name="Form" persistent=false ExtDirect=true hint="3/31/15"
{

	public struct function Submit() ExtDirect=true ExtFormHandler=true {

		if(trim(form.LBTYPE) == "NEW" || trim(form.LBTYPE) == "COPY") {
			var dsource = EntityNew("EGRGLIVEBOARD");

			var lbuuid = CreateUuid();

			dsource.setLIVEBOARDCODE(lbuuid);
			dsource.setLBSTATUS("NOTACTIVE");
			dsource.setRECDATECREATED(CreateODBCDateTime(now()));
			dsource.setRECCREATEDBY(session.chapa);

		} else if(trim(form.LBTYPE) == "EDIT") {
			var dsource = EntityLoad("EGRGLIVEBOARD",{LIVEBOARDCODE="#trim(form.LIVEBOARDCODE)#"}, true);
		} else if(trim(form.LBTYPE) == "DELETE") {
			var dsource = EntityLoad("EGRGLIVEBOARD",{LIVEBOARDCODE="#trim(form.LIVEBOARDCODE)#"}, true);
			if (IsDefined("dsource")) {
				var hc = CreateObject("component", "Helper");
				var liveboardcodeNS = "LB_" & rereplace(trim(form.LIVEBOARDCODE), "\W", "", "all");
				hc.removeLiveboardCode(trim(form.LIVEBOARDCODE), liveboardcodeNS, "./", "dashboard");

				var d = CreateObject("component", "Database");
				d.removeLiveboardData(trim(form.LIVEBOARDCODE));

				deleteRightofThisLiveboard();

				EntityDelete(dsource);
				OrmFlush();

			}
			rootstruct = StructNew();
			rootstruct["success"] = "true";
			return rootstruct;
		} else {
			throw(message="Action unknown!");
		}

		if(Not IsDefined("form.LBTITLE") || form.LBTITLE== "" ) dsource.setLBTITLE(javacast("null",""));
		else dsource.setLBTITLE(trim(form.LBTITLE));

		if(Not IsDefined("form.LIVEBOARDDESC") || form.LIVEBOARDDESC== "" ) dsource.setLIVEBOARDDESC(javacast("null",""));
		else dsource.setLIVEBOARDDESC(trim(form.LIVEBOARDDESC));

		if(Not IsDefined("form.TABLECOLUMNS") || form.TABLECOLUMNS== "" ) dsource.setTABLECOLUMNS(javacast("null",""));
		else dsource.setTABLECOLUMNS(trim(form.TABLECOLUMNS));

		if(Not IsDefined("form.TABLEITEMCLS") || form.TABLEITEMCLS== "" ) dsource.setTABLEITEMCLS(javacast("null",""));
		else dsource.setTABLEITEMCLS(trim(form.TABLEITEMCLS));

		if(Not IsDefined("form.TABLEATTRS") || form.TABLEATTRS== "" ) dsource.setTABLEATTRS(javacast("null",""));
		else dsource.setTABLEATTRS(trim(form.TABLEATTRS));

		if(Not IsDefined("form.TABLETDATTRS") || form.TABLETDATTRS== "" ) dsource.setTABLETDATTRS(javacast("null",""));
		else dsource.setTABLETDATTRS(trim(form.TABLETDATTRS));

		if(Not IsDefined("form.TABLETRATTRS") || form.TABLETRATTRS== "" ) dsource.setTABLETRATTRS(javacast("null",""));
		else dsource.setTABLETRATTRS(trim(form.TABLETRATTRS));

		if(Not IsDefined("form.HEIGHT") || form.HEIGHT== "" ) dsource.setHEIGHT(javacast("null",""));
		else dsource.setHEIGHT(trim(form.HEIGHT));

		if(Not IsDefined("form.WIDTH") || form.WIDTH== "" ) dsource.setWIDTH(javacast("null",""));
		else dsource.setWIDTH(trim(form.WIDTH));

		if(Not IsDefined("form.LBEXTRA") || form.LBEXTRA== "" ) dsource.setLBEXTRA(javacast("null",""));
		else dsource.setLBEXTRA(trim(form.LBEXTRA));

		if(Not IsDefined("form.LBLAYOUTEXTRA") || form.LBLAYOUTEXTRA== "" ) dsource.setLBLAYOUTEXTRA(javacast("null",""));
		else dsource.setLBLAYOUTEXTRA(trim(form.LBLAYOUTEXTRA));

		EntitySave(dsource);
		ormflush();

		rootstruct = StructNew();
		rootstruct["success"] = "true";
		return rootstruct;
	}


	public struct function Load(required string liveboardcode) ExtDirect=true {

		var rootstruct = StructNew();
		var tmpresult = StructNew();
	    tmpresult["LIVEBOARDCODE"] = liveboardcode;
		var dsource = EntityLoad("EGRGLIVEBOARD",{LIVEBOARDCODE="#liveboardcode#"}, false);
		if(IsDefined("dsource")) {
			for(i=1; i<=ArrayLen(dsource); i++) {
				tmpresult["LBTITLE"] = dsource[i].getLBTITLE();
				tmpresult["LIVEBOARDDESC"] = dsource[i].getLIVEBOARDDESC();
				tmpresult["TABLECOLUMNS"] = dsource[i].getTABLECOLUMNS();
				tmpresult["TABLEITEMCLS"] = dsource[i].getTABLEITEMCLS();
				tmpresult["TABLEATTRS"] = dsource[i].getTABLEATTRS();
				tmpresult["TABLETDATTRS"] = dsource[i].getTABLETDATTRS();
				tmpresult["TABLETRATTRS"] = dsource[i].getTABLETRATTRS();
				tmpresult["LBSTATUS"] = dsource[i].getLBSTATUS();
				tmpresult["HEIGHT"] = dsource[i].getHEIGHT();
				tmpresult["WIDTH"] = dsource[i].getWIDTH();
				tmpresult["LBEXTRA"] = dsource[i].getLBEXTRA();
				tmpresult["LBLAYOUTEXTRA"] = dsource[i].getLBLAYOUTEXTRA();
				tmpresult["RECDATECREATED"] = dsource[i].getRECDATECREATED();
				tmpresult["RECCREATEDBY"] = dsource[i].getRECCREATEDBY();

			}
		}

		rootstuct["success"] = "true";
		rootstuct["data"] = tmpresult;
		return rootstuct;
	}


	public struct function SubmitItem() ExtDirect=true ExtFormHandler=true {

		if(trim(form.LBITEMTYPE) == "NEW" || trim(form.LBITEMTYPE) == "COPY") {
			var dsource = EntityNew("EGRGLIVEBOARDITEM");

			var lbuuid = CreateUuid();

			dsource.setLIVEBOARDITEMCODE(lbuuid);

		} else if(trim(form.LBITEMTYPE) == "EDIT") {
			var dsource = EntityLoad("EGRGLIVEBOARDITEM",{LIVEBOARDITEMCODE="#trim(form.LIVEBOARDITEMCODE)#"}, true);
		} else if(trim(form.LBITEMTYPE) == "DELETE") {
			var dsource = EntityLoad("EGRGLIVEBOARDITEM",{LIVEBOARDITEMCODE="#trim(form.LIVEBOARDITEMCODE)#"}, true);
			EntityDelete(dsource);
			OrmFlush();
			rootstruct = StructNew();
			rootstruct["success"] = "true";
			return rootstruct;
		} else {
			throw(message="Item Action unknown!");
		}

		if(Not IsDefined("form.LIVEBOARDCODE") || form.LIVEBOARDCODE == "" ) dsource.setLIVEBOARDCODE(javacast("null",""));
		else dsource.setLIVEBOARDCODE(trim(form.LIVEBOARDCODE));

		if(Not IsDefined("form.BODYSTYLE") || form.BODYSTYLE== "" ) dsource.setBODYSTYLE(javacast("null",""));
		else dsource.setBODYSTYLE(trim(form.BODYSTYLE));

		if(Not IsDefined("form.ROWSPAN") || form.ROWSPAN == "" ) dsource.setROWSPAN(javacast("null",""));
		else dsource.setROWSPAN(trim(form.ROWSPAN));

		if(Not IsDefined("form.COLSPAN") || form.COLSPAN == "" ) dsource.setCOLSPAN(javacast("null",""));
		else dsource.setCOLSPAN(trim(form.COLSPAN));

		if(Not IsDefined("form.CELLCLS") || form.CELLCLS== "" ) dsource.setCELLCLS(javacast("null",""));
		else dsource.setCELLCLS(trim(form.CELLCLS));

		if(Not IsDefined("form.HTML") || form.HTML == "" ) dsource.setHTML(javacast("null",""));
		else dsource.setHTML(trim(form.HTML));

		if(Not IsDefined("form.XTYPE") || form.XTYPE == "" ) dsource.setXTYPE(javacast("null",""));
		else dsource.setXTYPE(trim(form.XTYPE));

		if(Not IsDefined("form.ITEMORDER") || form.ITEMORDER == "" ) dsource.setITEMORDER(javacast("null",""));
		else dsource.setITEMORDER(trim(form.ITEMORDER));

		if(Not IsDefined("form.LIVEBOARDITEMEXTRA") || form.LIVEBOARDITEMEXTRA == "" ) dsource.setLIVEBOARDITEMEXTRA(javacast("null",""));
		else dsource.setLIVEBOARDITEMEXTRA(trim(form.LIVEBOARDITEMEXTRA));

		EntitySave(dsource);
		ormflush();

		rootstruct = StructNew();
		rootstruct["success"] = "true";
		return rootstruct;
	}

	private void function deleteRightofThisLiveboard() {
		var dqry = new query();
		dqry.addParam(name="dappid",value="#trim(form.LIVEBOARDCODE)#",cfsqltype="cf_sql_varchar");
		var dsql = "DELETE FROM EGRTUSERAPP
		            WHERE APPID = :dappid";
		dqry.setDatasource("#session.global_dsn#");
   		dqry.setName("de");
		dqry.execute(sql=dsql);

		var dqryb = new query();
		dqryb.addParam(name="dmenuid",value="MENU#trim(form.LIVEBOARDCODE)#", cfsqltype="cf_sql_varchar");
		var dsqlb = "DELETE FROM EGRTMENU
		            WHERE MENUID = :dmenuid";
		dqryb.setDatasource("#session.global_dsn#");
   		dqryb.setName("de");
		dqryb.execute(sql=dsqlb);
	}


}