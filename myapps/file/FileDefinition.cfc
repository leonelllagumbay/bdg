/**
 * FileDefinition
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component  output=false persistent=false ExtDirect=true
{
	public struct function Read(required string page,
								required string start,
								required string limit,
								required any sort,
								required any filter,
								required string folderid)
	ExtDirect=true
	{
		theargs = StructNew();
		theargs["page"] = page;
	    theargs["start"] = start;
	    theargs["limit"] = limit;
	    theargs["sort"] = sort;
	    theargs["filter"] = filter;

	    bcObj = Createobject("component","IBOSE.application.GridQuery");
	    dresult = bcObj.buildCondition(argumentCollection="#theargs#");
		WHERE = dresult['where'];
		if (trim(folderid) neq "SHAREDFILES") {
			if (trim(WHERE) eq "") {
				WHERE = "WHERE FOLDERIDFK='#trim(folderid)#'";
			} else {
				WHERE = "#WHERE# AND FOLDERIDFK='#trim(folderid)#'";
			}
		} else {
			var fo = CreateObject("component","File");
			var fileList = fo.getSharedFileId(session.userid);
			if (trim(WHERE) eq "") {
				WHERE = "WHERE FILEID IN (#fileList#)";
			} else {
				WHERE = "#WHERE# AND FILEID IN (#fileList#)";
			}
		}
	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("FROM EGRGFILE #PreserveSingleQuotes(WHERE)#
			                           ORDER BY #ORDERBY#", false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(i=1; i<=ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['FILEID'] = dsource[i].getFILEID();
				tmpresult['FILENAME'] 	= dsource[i].getFILENAME();
				tmpresult['FILEEXTENSION'] = dsource[i].getFILEEXTENSION();
				tmpresult['FILECAPTION'] 	= dsource[i].getFILECAPTION();
				tmpresult['SORTORDER'] 	= dsource[i].getSORTORDER();
				tmpresult['OBJECTIDFK'] 	= dsource[i].getOBJECTIDFK();
				tmpresult['FOLDERIDFK'] 	= dsource[i].getFOLDERIDFK();
				tmpresult['RECCREATEDBY'] 	= dsource[i].getRECCREATEDBY();
				tmpresult['RECDATECREATED'] 	= dsource[i].getRECDATECREATED();
				tmpresult['DATELASTUPDATE'] 	= dsource[i].getDATELASTUPDATE();
				tmpresult['DATEACTIONWASDONE'] 	= dsource[i].getDATEACTIONWASDONE();
				tmpresult['PERSONNELIDNO'] 	= dsource[i].getPERSONNELIDNO();
				tmpresult['APPROVED'] 	= dsource[i].getAPPROVED();
				tmpresult['ACTIONBY'] 	= dsource[i].getACTIONBY();
				tmpresult['EFORMID'] 	= dsource[i].getEFORMID();
				tmpresult['PROCESSID'] 	= dsource[i].getPROCESSID();

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGFILE #PreserveSingleQuotes(WHERE)#",true);
			rootstuct['totalCount'] = dsourceCount;
			rootstuct['topics'] = resultArr;
			return rootstuct;
        }
        catch(Any e)
        {
        	retStruct =StructNew();
			retStruct['err'] = e;
			return retStruct;
        }
	}


	public struct function ReadMySharedTo(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter,
										required string fileid)
	ExtDirect=true
	{
		theargs = StructNew();
		theargs["page"] = page;
	    theargs["start"] = start;
	    theargs["limit"] = limit;
	    theargs["sort"] = sort;
	    theargs["filter"] = filter;

	    bcObj = Createobject("component","IBOSE.application.GridQuery");
	    dresult = bcObj.buildCondition(argumentCollection="#theargs#");
		WHERE = dresult['where'];

		if (trim(WHERE) eq "") {
			WHERE = "WHERE B.SHARETOUID IS NOT NULL AND B.OWNERUID='#session.userid#' AND A.FILEID = '#fileid#'";

		} else {
			WHERE = "#WHERE# AND B.SHARETOUID IS NOT NULL AND B.OWNERUID='#session.userid#' AND A.FILEID = '#fileid#'";
		}


	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);

			dsource = ORMExecuteQuery("SELECT A.FILEID,
											  A.FILENAME,
											  B.SHARETOUID,
											  B.DATESHARED
										 FROM EGRGFILE AS A LEFT JOIN A.EGRTSHAREDFILE AS B
										 #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#",
										 false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(var i = 1; i <= ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['A_FILEID'] = dsource[i][1];
				tmpresult['A_FILENAME'] 	= dsource[i][2];

				var o = EntityLoad("GMFPEOPLE", dsource[i][3], true);
				if (IsDefined("o")) {
					var uid_name = o.getFIRSTNAME();
					var uid_lname = o.getLASTNAME();
					tmpresult['D_DESCRIPTION'] = uid_name & " " & uid_lname;
				} else {
					tmpresult['D_DESCRIPTION'] = uid_name & " " & uid_lname;
				}
				tmpresult['B_SHARETOUID'] = dsource[i][3];
				tmpresult['B_DATESHARED'] 	= dsource[i][4];

				ArrayAppend(resultArr,tmpresult);
			}

			dsourceCount = ORMExecuteQuery("SELECT COUNT(A.FILEID) AS TOTALREC
										     FROM EGRGFILE AS A LEFT JOIN A.EGRTSHAREDFILE AS B
										     #PreserveSingleQuotes(WHERE)#",true);
			rootstuct['totalCount'] = dsourceCount;

			rootstuct['topics'] = resultArr;
			return rootstuct;
        }
        catch(Any e)
        {
        	retStruct =StructNew();
			retStruct['err'] = e;
			return retStruct;
        }
	}


	public struct function ReadMySharedToUR(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter,
										required string fileid)
	ExtDirect=true
	{
		theargs = StructNew();
		theargs["page"] = page;
	    theargs["start"] = start;
	    theargs["limit"] = limit;
	    theargs["sort"] = sort;
	    theargs["filter"] = filter;

	    bcObj = Createobject("component","IBOSE.application.GridQuery");
	    dresult = bcObj.buildCondition(argumentCollection="#theargs#");
		WHERE = dresult['where'];

		if (trim(WHERE) eq "") {
			WHERE = "WHERE C.USERGRPID IS NOT NULL AND C.OWNERUID='#session.userid#' AND A.FILEID = '#fileid#'";
		} else {
			WHERE = "#WHERE# AND C.USERGRPID IS NOT NULL AND C.OWNERUID='#session.userid#' AND A.FILEID = '#fileid#'";
		}

	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);

			dsource = ORMExecuteQuery("SELECT A.FILEID,
											  A.FILENAME,
											  C.USERGRPID,
											  C.DATESHARED
										 FROM EGRGFILE A LEFT JOIN A.EGRTGROUPSHAREDFILE AS C
										  #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#",
										 false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(var i = 1; i <= ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['A_FILEID'] = dsource[i][1];
				tmpresult['A_FILENAME'] 	= dsource[i][2];
				var o = EntityLoad("EGRGUSERGROUPS", dsource[i][3], true);
				if (IsDefined("o")) {
					tmpresult['D_DESCRIPTION'] = o.getDESCRIPTION();
				} else {
					tmpresult['D_DESCRIPTION'] = dsource[i][3];
				}
				tmpresult['C_USERGRPID'] = dsource[i][3];
				tmpresult['C_DATESHARED'] 	= dsource[i][4];

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC
										     FROM EGRGFILE AS A LEFT JOIN A.EGRTGROUPSHAREDFILE AS C
										     #PreserveSingleQuotes(WHERE)#",true);
			rootstuct['totalCount'] = dsourceCount;

			rootstuct['topics'] = resultArr;
			return rootstuct;
        }
        catch(Any e)
        {
        	retStruct =StructNew();
			retStruct['err'] = e;
			return retStruct;
        }
	}


	public struct function shareUserFile(required array ddata, required string userpid, required string dtype)
		ExtDirect="true"
	{
		if (trim(dtype) == "user") {
			for (var a = 1; a <= ArrayLen(ddata); a++) {
				var wo = EntityNew("EGRTSHAREDFILE");
				wo.setOWNERUID(session.userid);
				wo.setSHARETOUID(trim(userpid));
				wo.setFILEID(ddata[a]);
				wo.setDATESHARED(CreateODBCDateTime(now()));
				EntitySave(wo);
			}
		} else { // dtype = "userrole"
			for (var a = 1; a <= ArrayLen(ddata); a++) {
				var wo = EntityNew("EGRTGROUPSHAREDFILE");
				wo.setOWNERUID(session.userid);
				wo.setUSERGRPID(trim(userpid));
				wo.setFILEID(ddata[a]);
				wo.setDATESHARED(CreateODBCDateTime(now()));
				EntitySave(wo);
			}
		}

		OrmFlush();
		var rs = StructNew();
		rs["success"] = true;
		rs["message"] = ddata;
		return rs;
	}

	public struct function copyUserFile()
		ExtDirect="true" ExtFormHandler="true"
	{
		var o = EntityLoad("EGRGFILE", trim(form.FILEID), true);
		if (! IsDefined("o")) {
			var rs = StructNew();
			rs["success"] = true;
			rs["message"] = "File ID is not defined!";
			return rs;
		}


		var fid = trim(form.FILEID);
		var fidx = ListGetAt(fid, 2, "_");
		var origfilecode = ListGetAt(fidx, 1, ".");
		var uid = right(createUuid(), 7);
		var newfileid = replace(fid, origfilecode, uid);

		var p = EntityNew("EGRGFILE");
		p.setFILEID(newfileid);
		p.setFILENAME(trim(form.FILENAME));
		p.setFILEEXTENSION(o.getFILEEXTENSION());
		p.setFILECAPTION(o.getFILECAPTION());
		p.setOBJECTIDFK(o.getOBJECTIDFK());
		p.setFOLDERIDFK(o.getFOLDERIDFK());
		p.setRECDATECREATED(createODBCDateTime(now()));
		p.setDATELASTUPDATE(createODBCDateTime(now()));
		p.setPERSONNELIDNO(session.chapa);
		p.setAPPROVED("N");
		p.setRECCREATEDBY(session.chapa);
		p.setEFORMID("F613ECA3-94F7-9410-B04B06819E8C3394");
		p.setPROCESSID(createUuid());
		EntitySave(p);

		OrmFlush();

		var dpath = "../../unDB/document/#ucase(session.companycode)#/#ucase(session.userid)#/";

		try {
			Filecopy(ExpandPath("#dpath##fid#"), ExpandPath("#dpath##newfileid#"));
		} catch (Any e) {
			var o = EntityLoad("EGRGFILE", trim(form.FILEID), true);
			if (isDefined("o")) EntityDelete(o);
			OrmFlush();
			var rs = StructNew();
			rs["success"] = false;
			rs["message"] = e.Message & " - " & e.Detail;
			return rs;
		}


		var rs = StructNew();
		rs["success"] = true;
		rs["message"] = form.FILENAME;
		return rs;
	}


	public struct function uploadUserFile()
		ExtDirect="true" ExtFormHandler="true"
	{
		var retStruct = StructNew();
		var writerObj = CreateObject("component", "IBOSE.application.Util");
		form.dpath = "../../unDB/document/#ucase(session.companycode)#/#ucase(session.userid)#/";
		var resArr = ArrayNew(1);
		resArr = writerObj.uploadFileMultiple();
		if (ArrayLen(resArr) gt 0) {
			// write file names to database
			// check user folder max drive size if still ok to upload the file(s)
			var fo = CreateObject("component", "File");
			var pos = fo.checkMyDriveSize();
			if (pos) {
				for (var a = 1; a <= ArrayLen(resArr); a++) {
					try {
						var filenamepart = ListGetAt(resArr[a], 1, "_");
						var fileextpart = ListGetAt(resArr[a], 2, "_");
						var fileidpart = ListGetAt(fileextpart, 1, ".");
						fileextpart = ListGetAt(fileextpart, 2, ".");
						fileidpart = createUuid() & fileidpart;

						newFileWriter = EntityNew("EGRGFILE");
						newFileWriter.setFILEID(resArr[a]);
						newFileWriter.setFILENAME(filenamepart);
						newFileWriter.setFILEEXTENSION(fileextpart);
						newFileWriter.setFILECAPTION(filenamepart);
						newFileWriter.setOBJECTIDFK("FILE");
						newFileWriter.setFOLDERIDFK(trim(form.FOLDERID));
						newFileWriter.setRECDATECREATED(createODBCDateTime(now()));
						newFileWriter.setDATELASTUPDATE(createODBCDateTime(now()));
						newFileWriter.setPERSONNELIDNO(session.chapa);
						newFileWriter.setAPPROVED("N");
						newFileWriter.setRECCREATEDBY(session.chapa);
						newFileWriter.setEFORMID("F613ECA3-94F7-9410-B04B06819E8C3394");
						newFileWriter.setPROCESSID(createUuid());
						EntitySave(newFileWriter);
					} catch(Any e) {
						// delete this file coz it wasn't save to the database
						try {
							FileDelete(ExpandPath("#form.dpath##resArr[a]#"));
						} catch (Any e) {
							//Do nothing here. Cannot delete file for an unknown reason.
						}
					}
				}
			} else {
				for (var a = 1; a <= ArrayLen(resArr); a++) {
					// delete this file coz it wasn't save to the database
					try {
						FileDelete(ExpandPath("#form.dpath##resArr[a]#"));
					} catch (Any e) {
						//Do nothing here. Cannot delete file for an unknown reason.
					}
				}
				retStruct["success"] = false;
				retStruct["message"] = "Cannot save files to database. Maximum drive size was reached. You may contact your administrator for file size extension.";
				return retStruct;
			}


			OrmFlush();
		}
		retStruct["success"] = true;
		retStruct["message"] = resArr;
		return retStruct;
	}


	public struct function Update(required any args)
	ExtDirect=true
	{
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			var fileWriter = EntityLoad("EGRGFILE", trim(args[b].FILEID), true);
			fileWriter.setFILENAME(trim(args[b].FILENAME));
			fileWriter.setFILECAPTION(trim(args[b].FILECAPTION));
			fileWriter.setDATELASTUPDATE(createOdbcDateTime(now()));
			EntitySave(fileWriter);
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}


	public struct function Destroy(required any args)
	ExtDirect=true
	{
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		var dpath = "../../unDB/document/#ucase(session.companycode)#/#ucase(session.userid)#/";

		for (b = 1; b <= ArrayLen(args); b++) {
			try {
				var otd = EntityLoad("EGRGFILE", trim(args[b].FILEID), true);
				EntityDelete(otd);
				FileDelete(ExpandPath("#dpath##args[b].FILEID#"));
			} catch (Any e) {
				//Do nothing here. Cannot delete file for an unknown reason.
			}
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}


	public struct function DestroyMySharedTo(required any args)
	ExtDirect=true
	{
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			try {
				var otd = EntityLoad("EGRTSHAREDFILE", {OWNERUID=#session.userid#, SHARETOUID=#trim(args[b].B_SHARETOUID)#, FILEID=#trim(args[b].A_FILEID)#}, true);
				EntityDelete(otd);
			} catch (Any e) {
				//Do nothing here. Cannot delete file for an unknown reason.
			}
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}

	public struct function DestroyMySharedToUr(required any args)
	ExtDirect=true
	{
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			try {
				var otd = EntityLoad("EGRTGROUPSHAREDFILE", {OWNERUID=#session.userid#, USERGRPID=#trim(args[b].C_USERGRPID)#, FILEID=#trim(args[b].A_FILEID)#}, true);
				EntityDelete(otd);
			} catch (Any e) {
				//Do nothing here. Cannot delete file for an unknown reason.
			}
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}




	public struct function moveFile() {
		var fileids = StructNew();
		fileids = DeserializeJSON(trim(form.FILEID));
		var dfolderid = trim(form.FOLDERID);
		var newfolderid = trim(form.FOLDERDESTINATION);
		for (var c = 0; c < Structcount(fileids); c++) {
			var fileWriter = EntityLoad("EGRGFILE", trim(fileids[c]), true);
			fileWriter.setFOLDERIDFK(trim(newfolderid));
			EntitySave(fileWriter);
			OrmFlush();
		}


		var s = StructNew();
		s["success"] = true;
		s["message"] = "hi";
		return s;
	}

}