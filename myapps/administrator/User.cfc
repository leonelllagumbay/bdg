/**
 * Preview
 *
 * @author LEONELL
 * @date 3/31/15
 **/
component accessors=true output=false persistent=false ExtDirect="true" {
	public struct function ReadMe(required string page,
								required string start,
								required string limit,
								required any sort,
								required any filter)
	ExtDirect=true
	{
		theargs = StructNew();
		theargs["page"] = page;
	    theargs["start"] = start;
	    theargs["limit"] = limit;
	    theargs["sort"] = sort;
	    theargs["filter"] = filter;

	    bcObj = Createobject("component","IBOSE.application.GridQuery");
	    dresult = bcObj.buildConditionDash(argumentCollection="#theargs#");
		WHERE = dresult['where'];
	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("SELECT A.USERID,
											A.USERTYPE,
											A.PASSWORD,
											A.DATEPASSWORD,
											A.PASSQUESTION,
											A.PASSANSWER,
											A.CHANGEPWDNEXTLOGON,
											A.CANNOTCHANGEPWD,
											A.PWDNEVEREXPIRES,
											A.USERCANRESETUSING,
											A.MAXPASSWORDAGE,
											A.MINPASSWORDAGE,
											A.MINPASSWORDLENGTH,
											A.PWDMUSTMEETCOMPLEXITY,
											A.ACCOUNTLOCKOUTDURATION,
											A.ACCOUNTLOCKOUTTHRESHHOLD,
											A.RESETACCOUNTLOCKOUTCOUNTERAFTER,
											A.PROFILENAME,
											A.DEFAULTAPPID,
											A.LOGINCOUNTER,
											A.OLDPASSWORD,
											A.RESETPASSWORD,
											A.ALTERNATEAPPROVER,
											A.NOOFLOGIN,
											A.DISABLEACCOUNT,
											A.NOOFERRLOGINS,
											A.SETNEWPASSWORD,
											A.ADUSERNAME,
											A.ISLOGGEDIN,
											A.PWDCOUNTFAILEDATTEMPT,
											A.DATELASTFAILEDATTEMPT,
											A.GOOGLEEMAIL,
											A.DATELASTUPDATE,
											A.RECDATECREATED,
											A.GUID,
											A.MAXDRIVESIZE,
											B.SALUTATION,
											B.FIRSTNAME,
											B.MIDDLENAME,
											B.LASTNAME,
											B.NICKNAME,
											B.SUFFIX,
											B.PAGIBIGNUMBER,
											B.SSSNUMBER,
											B.TIN,
											B.RECCREATEDBY,
											B.RECDATECREATED,
											B.DATELASTUPDATE,
											B.HOTLINE,
											B.HOTLINEPHONE,
											B.COMPANYCODE,
											B.SUBCOMPANYCODE,
											B.HOTLINECELLPHONE,
											B.HOTLINEFAX,
											B.HOTLINEEMAIL,
											B.MEMO,
											B.ISACTIVE,
											C.PERSONNELIDNO,
											C.ISVISIBLE,
											C.MYTHEME,
											C.MYMESSAGE,
											C.DEFAULTTHEME,
											C.SIGNATURE,
											C.AVATAR
									   FROM EGRGUSERMASTER AS A LEFT JOIN  A.GMFPEOPLE AS B LEFT JOIN A.EGRGMYIBOSE AS C
									   #PreserveSingleQuotes(WHERE)#
			                           ORDER BY #ORDERBY#", false, {maxResults=#limit#, offset=#start#, timeout=500});

			var columnArr = ArrayNew(1);

			ArrayAppend(columnArr, 'A-USERID');
			ArrayAppend(columnArr, 'A-USERTYPE');
			ArrayAppend(columnArr, 'A-PASSWORD');
			ArrayAppend(columnArr, 'A-DATEPASSWORD');
			ArrayAppend(columnArr, 'A-PASSQUESTION');
			ArrayAppend(columnArr, 'A-PASSANSWER');
			ArrayAppend(columnArr, 'A-CHANGEPWDNEXTLOGON');
			ArrayAppend(columnArr, 'A-CANNOTCHANGEPWD');
			ArrayAppend(columnArr, 'A-PWDNEVEREXPIRES');
			ArrayAppend(columnArr, 'A-USERCANRESETUSING');
			ArrayAppend(columnArr, 'A-MAXPASSWORDAGE');
			ArrayAppend(columnArr, 'A-MINPASSWORDAGE');
			ArrayAppend(columnArr, 'A-MINPASSWORDLENGTH');
			ArrayAppend(columnArr, 'A-PWDMUSTMEETCOMPLEXITY');
			ArrayAppend(columnArr, 'A-ACCOUNTLOCKOUTDURATION');
			ArrayAppend(columnArr, 'A-ACCOUNTLOCKOUTTHRESHHOLD');
			ArrayAppend(columnArr, 'A-RESETACCOUNTLOCKOUTCOUNTERAFTER');
			ArrayAppend(columnArr, 'A-PROFILENAME');
			ArrayAppend(columnArr, 'A-DEFAULTAPPID');
			ArrayAppend(columnArr, 'A-LOGINCOUNTER');
			ArrayAppend(columnArr, 'A-OLDPASSWORD');
			ArrayAppend(columnArr, 'A-RESETPASSWORD');
			ArrayAppend(columnArr, 'A-ALTERNATEAPPROVER');
			ArrayAppend(columnArr, 'A-NOOFLOGIN');
			ArrayAppend(columnArr, 'A-DISABLEACCOUNT');
			ArrayAppend(columnArr, 'A-NOOFERRLOGINS');
			ArrayAppend(columnArr, 'A-SETNEWPASSWORD');
			ArrayAppend(columnArr, 'A-ADUSERNAME');
			ArrayAppend(columnArr, 'A-ISLOGGEDIN');
			ArrayAppend(columnArr, 'A-PWDCOUNTFAILEDATTEMPT');
			ArrayAppend(columnArr, 'A-DATELASTFAILEDATTEMPT');
			ArrayAppend(columnArr, 'A-GOOGLEEMAIL');
			ArrayAppend(columnArr, 'A-DATELASTUPDATE');
			ArrayAppend(columnArr, 'A-RECDATECREATED');
			ArrayAppend(columnArr, 'A-GUID');
			ArrayAppend(columnArr, 'A-MAXDRIVESIZE');
			ArrayAppend(columnArr, 'B-SALUTATION');
			ArrayAppend(columnArr, 'B-FIRSTNAME');
			ArrayAppend(columnArr, 'B-MIDDLENAME');
			ArrayAppend(columnArr, 'B-LASTNAME');
			ArrayAppend(columnArr, 'B-NICKNAME');
			ArrayAppend(columnArr, 'B-SUFFIX');
			ArrayAppend(columnArr, 'B-PAGIBIGNUMBER');
			ArrayAppend(columnArr, 'B-SSSNUMBER');
			ArrayAppend(columnArr, 'B-TIN');
			ArrayAppend(columnArr, 'B-RECCREATEDBY');
			ArrayAppend(columnArr, 'B-RECDATECREATED');
			ArrayAppend(columnArr, 'B-DATELASTUPDATE');
			ArrayAppend(columnArr, 'B-HOTLINE');
			ArrayAppend(columnArr, 'B-HOTLINEPHONE');
			ArrayAppend(columnArr, 'B-COMPANYCODE');
			ArrayAppend(columnArr, 'B-SUBCOMPANYCODE');
			ArrayAppend(columnArr, 'B-HOTLINECELLPHONE');
			ArrayAppend(columnArr, 'B-HOTLINEFAX');
			ArrayAppend(columnArr, 'B-HOTLINEEMAIL');
			ArrayAppend(columnArr, 'B-MEMO');
			ArrayAppend(columnArr, 'B-ISACTIVE');
			ArrayAppend(columnArr, 'C-PERSONNELIDNO');
			ArrayAppend(columnArr, 'C-ISVISIBLE');
			ArrayAppend(columnArr, 'C-MYTHEME');
			ArrayAppend(columnArr, 'C-MYMESSAGE');
			ArrayAppend(columnArr, 'C-DEFAULTTHEME');
			ArrayAppend(columnArr, 'C-SIGNATURE');
			ArrayAppend(columnArr, 'C-AVATAR');

			for(var i=1; i<=ArrayLen(dsource); i++) {
				tmpresult = StructNew();
				for (var c = 1; c <= 64; c++) {
					try { tmpresult['#columnArr[c]#'] = dsource[i][c]; }
					catch (Any e) { tmpresult['#columnArr[c]#'] = ""; }
				}
				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGUSERMASTER AS A LEFT JOIN  A.GMFPEOPLE AS B LEFT JOIN A.EGRGMYIBOSE AS C #PreserveSingleQuotes(WHERE)#",true);
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


	public struct function SubmitUser() ExtDirect=true ExtFormHandler=true {

		var duserid = trim(form["A-USERID"]);
		if(trim(form.USERACTION) == "NEW" || trim(form.USERACTION) == "COPY") {
			var c1 = EntityNew("EGRGUSERMASTER");
			var c2 = EntityNew("GMFPEOPLE");
			var c3 = EntityNew("EGRGMYIBOSE");

			c1.setUSERID(duserid);
			c2.setUSERID(duserid);
			c3.setUSERID(duserid);

			c1.setRECDATECREATED(CreateODBCDateTime(now()));
			c2.setRECDATECREATED(CreateODBCDateTime(now()));

		} else if(trim(form.USERACTION) == "EDIT") {
			var c1 = EntityLoad("EGRGUSERMASTER",duserid, true);
			var c2 = EntityLoad("GMFPEOPLE",duserid, true);
			var c3 = EntityLoad("EGRGMYIBOSE",duserid, true);

			if (!IsDefined("c2")) {
				var c2 = EntityNew("GMFPEOPLE");
				c2.setUSERID(duserid);
				c2.setRECDATECREATED(CreateODBCDateTime(now()));
			}

			if (!IsDefined("c3")) {
				var c3 = EntityNew("EGRGMYIBOSE");
				c3.setUSERID(duserid);
			}

		} else if(trim(form.USERACTION) == "DELETE") {
			var dsource = EntityLoad("EGRGUSERMASTER",duserid, true);
			if (IsDefined("dsource")) {
				EntityDelete(dsource);
				OrmFlush();
			}
			rootstruct = StructNew();
			rootstruct["success"] = "true";
			return rootstruct;
		} else {
			throw(message="Action unknown!");
		}


		try {
		if(form['B-ISACTIVE'] == "" ) c2.setISACTIVE(javacast("null",""));
		else c2.setISACTIVE(trim(form['B-ISACTIVE']));
		} catch (Any e) { }

		try {
		if(form['A-DISABLEACCOUNT'] == "" ) c1.setDISABLEACCOUNT(javacast("null",""));
		else c1.setDISABLEACCOUNT(trim(form['A-DISABLEACCOUNT']));
		} catch (Any e) { }

		try {
		if(form['C-PERSONNELIDNO'] == "" ) c3.setPERSONNELIDNO(javacast("null",""));
		else c3.setPERSONNELIDNO(trim(form['C-PERSONNELIDNO']));
		} catch (Any e) { }

		try {
		if(form['B-SALUTATION'] == "" ) c2.setSALUTATION(javacast("null",""));
		else c2.setSALUTATION(trim(form['B-SALUTATION']));
		} catch (Any e) { }

		try {
		if(form['B-FIRSTNAME'] == "" ) c2.setFIRSTNAME(javacast("null",""));
		else c2.setFIRSTNAME(trim(form['B-FIRSTNAME']));
		} catch (Any e) { }

		try {
		if(form['B-MIDDLENAME'] == "" ) c2.setMIDDLENAME(javacast("null",""));
		else c2.setMIDDLENAME(trim(form['B-MIDDLENAME']));
		} catch (Any e) { }

		try {
		if(form['B-LASTNAME'] == "" ) c2.setLASTNAME(javacast("null",""));
		else c2.setLASTNAME(trim(form['B-LASTNAME']));
		} catch (Any e) { }

		try {
		if(form['B-COMPANYCODE'] == "" ) c2.setCOMPANYCODE(javacast("null",""));
		else c2.setCOMPANYCODE(trim(form['B-COMPANYCODE']));
		} catch (Any e) { }

		try {
		if(form['B-SUBCOMPANYCODE'] == "" ) c2.setSUBCOMPANYCODE(javacast("null",""));
		else c2.setSUBCOMPANYCODE(trim(form['B-SUBCOMPANYCODE']));
		} catch (Any e) { }

		try {
		if(form['A-USERTYPE'] == "" ) c1.setUSERTYPE(javacast("null",""));
		else c1.setUSERTYPE(trim(form['A-USERTYPE']));
		} catch (Any e) { }

		try {
		if(form['A-PROFILENAME'] == "" ) c1.setPROFILENAME(javacast("null",""));
		else c1.setPROFILENAME(trim(form['A-PROFILENAME']));
		} catch (Any e) { }

		try {
		if(form['A-GUID'] == "" ) c1.setGUID(javacast("null",""));
		else c1.setGUID(trim(form['A-GUID']));
		} catch (Any e) { }

		try {
		if(form['A-GUID'] == "" ) c2.setGUID(javacast("null",""));
		else c2.setGUID(trim(form['A-GUID']));
		} catch (Any e) { }

		try {
		if(form['A-MAXDRIVESIZE'] == "" ) c1.setMAXDRIVESIZE(javacast("null",""));
		else c1.setMAXDRIVESIZE(trim(form['A-MAXDRIVESIZE']));
		} catch (Any e) { }

		try {
		if(form['A-PASSWORD'] == "" ) c1.setPASSWORD(javacast("null",""));
		else c1.setPASSWORD(trim(form['A-PASSWORD']));
		} catch (Any e) { }

		try {
		if(form['A-DATEPASSWORD'] == "" ) c1.setDATEPASSWORD(javacast("null",""));
		else c1.setDATEPASSWORD(trim(form['A-DATEPASSWORD']));
		} catch (Any e) { }

		try {
		if(form['A-PASSQUESTION'] == "" ) c1.setPASSQUESTION(javacast("null",""));
		else c1.setPASSQUESTION(trim(form['A-PASSQUESTION']));
		} catch (Any e) { }

		try {
		if(form['A-PASSANSWER'] == "" ) c1.setPASSANSWER(javacast("null",""));
		else c1.setPASSANSWER(trim(form['A-PASSANSWER']));
		} catch (Any e) { }

		try {
		if(form['A-CHANGEPWDNEXTLOGON'] == "" ) c1.setCHANGEPWDNEXTLOGON(javacast("null",""));
		else c1.setCHANGEPWDNEXTLOGON(trim(form['A-CHANGEPWDNEXTLOGON']));
		} catch (Any e) { }

		try {
		if(form['A-CANNOTCHANGEPWD'] == "" ) c1.setCANNOTCHANGEPWD(javacast("null",""));
		else c1.setCANNOTCHANGEPWD(trim(form['A-CANNOTCHANGEPWD']));
		} catch (Any e) { }

		try {
		if(form['A-PWDNEVEREXPIRES'] == "" ) c1.setPWDNEVEREXPIRES(javacast("null",""));
		else c1.setPWDNEVEREXPIRES(trim(form['A-PWDNEVEREXPIRES']));
		} catch (Any e) { }

		try {
		if(form['A-USERCANRESETUSING'] == "" ) c1.setUSERCANRESETUSING(javacast("null",""));
		else c1.setUSERCANRESETUSING(trim(form['A-USERCANRESETUSING']));
		} catch (Any e) { }

		try {
		if(form['A-MAXPASSWORDAGE'] == "" ) c1.setMAXPASSWORDAGE(javacast("null",""));
		else c1.setMAXPASSWORDAGE(trim(form['A-MAXPASSWORDAGE']));
		} catch (Any e) { }

		try {
		if(form['A-MINPASSWORDAGE'] == "" ) c1.setMINPASSWORDAGE(javacast("null",""));
		else c1.setMINPASSWORDAGE(trim(form['A-MINPASSWORDAGE']));
		} catch (Any e) { }

		try {
		if(form['A-MINPASSWORDLENGTH'] == "" ) c1.setMINPASSWORDLENGTH(javacast("null",""));
		else c1.setMINPASSWORDLENGTH(trim(form['A-MINPASSWORDLENGTH']));
		} catch (Any e) { }

		try {
		if(form['A-PWDMUSTMEETCOMPLEXITY'] == "" ) c1.setPWDMUSTMEETCOMPLEXITY(javacast("null",""));
		else c1.setPWDMUSTMEETCOMPLEXITY(trim(form['A-PWDMUSTMEETCOMPLEXITY']));
		} catch (Any e) { }

		try {
		if(form['A-ACCOUNTLOCKOUTDURATION'] == "" ) c1.setACCOUNTLOCKOUTDURATION(javacast("null",""));
		else c1.setACCOUNTLOCKOUTDURATION(trim(form['A-ACCOUNTLOCKOUTDURATION']));
		} catch (Any e) { }

		try {
		if(form['A-ACCOUNTLOCKOUTTHRESHHOLD'] == "" ) c1.setACCOUNTLOCKOUTTHRESHHOLD(javacast("null",""));
		else c1.setACCOUNTLOCKOUTTHRESHHOLD(trim(form['A-ACCOUNTLOCKOUTTHRESHHOLD']));
		} catch (Any e) { }

		try {
		if(form['A-RESETACCOUNTLOCKOUTCOUNTERAFTER'] == "" ) c1.setRESETACCOUNTLOCKOUTCOUNTERAFTER(javacast("null",""));
		else c1.setRESETACCOUNTLOCKOUTCOUNTERAFTER(trim(form['A-RESETACCOUNTLOCKOUTCOUNTERAFTER']));
		} catch (Any e) { }

		try {
		if(form['A-RESETPASSWORD'] == "" ) c1.setRESETPASSWORD(javacast("null",""));
		else c1.setRESETPASSWORD(trim(form['A-RESETPASSWORD']));
		} catch (Any e) { }

		try {
		if(form['A-SETNEWPASSWORD'] == "" ) c1.setSETNEWPASSWORD(javacast("null",""));
		else c1.setSETNEWPASSWORD(trim(form['A-SETNEWPASSWORD']));
		} catch (Any e) { }

		try {
		if(form['A-PWDCOUNTFAILEDATTEMPT'] == "" ) c1.setPWDCOUNTFAILEDATTEMPT(javacast("null",""));
		else c1.setPWDCOUNTFAILEDATTEMPT(trim(form['A-PWDCOUNTFAILEDATTEMPT']));
		} catch (Any e) { }

		try {
		if(form['A-DATELASTFAILEDATTEMPT'] == "" ) c1.setDATELASTFAILEDATTEMPT(javacast("null",""));
		else c1.setDATELASTFAILEDATTEMPT(trim(form['A-DATELASTFAILEDATTEMPT']));
		} catch (Any e) { }

		try {
		if(form['A-GOOGLEEMAIL'] == "" ) c1.setGOOGLEEMAIL(javacast("null",""));
		else c1.setGOOGLEEMAIL(trim(form['A-GOOGLEEMAIL']));
		} catch (Any e) { }

		try {
		if(form['A-DATELASTUPDATE'] == "" ) c1.setDATELASTUPDATE(javacast("null",""));
		else c1.setDATELASTUPDATE(trim(form['A-DATELASTUPDATE']));
		} catch (Any e) { }

		try {
		if(form['A-DEFAULTAPPID'] == "" ) c1.setDEFAULTAPPID(javacast("null",""));
		else c1.setDEFAULTAPPID(trim(form['A-DEFAULTAPPID']));
		} catch (Any e) { }

		try {
		if(form['A-NOOFERRLOGINS'] == "" ) c1.setNOOFERRLOGINS(javacast("null",""));
		else c1.setNOOFERRLOGINS(trim(form['A-NOOFERRLOGINS']));
		} catch (Any e) { }

		try {
		if(form['A-NOOFLOGIN'] == "" ) c1.setNOOFLOGIN(javacast("null",""));
		else c1.setNOOFLOGIN(trim(form['A-NOOFLOGIN']));
		} catch (Any e) { }

		try {
		if(form['A-ALTERNATEAPPROVER'] == "" ) c1.setALTERNATEAPPROVER(javacast("null",""));
		else c1.setALTERNATEAPPROVER(trim(form['A-ALTERNATEAPPROVER']));
		} catch (Any e) { }

		try {
		if(form['A-LOGINCOUNTER'] == "" ) c1.setLOGINCOUNTER(javacast("null",""));
		else c1.setLOGINCOUNTER(trim(form['A-LOGINCOUNTER']));
		} catch (Any e) { }

		try {
		if(form['A-OLDPASSWORD'] == "" ) c1.setOLDPASSWORD(javacast("null",""));
		else c1.setOLDPASSWORD(trim(form['A-OLDPASSWORD']));
		} catch (Any e) { }

		try {
		if(form['A-ISLOGGEDIN'] == "" ) c1.setISLOGGEDIN(javacast("null",""));
		else c1.setISLOGGEDIN(trim(form['A-ISLOGGEDIN']));
		} catch (Any e) { }

		try {
		if(form['A-ADUSERNAME'] == "" ) c1.setADUSERNAME(javacast("null",""));
		else c1.setADUSERNAME(trim(form['A-ADUSERNAME']));
		} catch (Any e) { }

		try {
		if(form['B-NICKNAME'] == "" ) c2.setNICKNAME(javacast("null",""));
		else c2.setNICKNAME(trim(form['B-NICKNAME']));
		} catch (Any e) { }

		try {
		if(form['B-SUFFIX'] == "" ) c2.setSUFFIX(javacast("null",""));
		else c2.setSUFFIX(trim(form['B-SUFFIX']));
		} catch (Any e) { }

		try {
		if(form['B-PAGIBIGNUMBER'] == "" ) c2.setPAGIBIGNUMBER(javacast("null",""));
		else c2.setPAGIBIGNUMBER(trim(form['B-PAGIBIGNUMBER']));
		} catch (Any e) { }

		try {
		if(form['B-SSSNUMBER'] == "" ) c2.setSSSNUMBER(javacast("null",""));
		else c2.setSSSNUMBER(trim(form['B-SSSNUMBER']));
		} catch (Any e) { }

		try {
		if(form['B-TIN'] == "" ) c2.setTIN(javacast("null",""));
		else c2.setTIN(trim(form['B-TIN']));
		} catch (Any e) { }

		try {
		if(form['B-RECCREATEDBY'] == "" ) c2.setRECCREATEDBY(javacast("null",""));
		else c2.setRECCREATEDBY(trim(form['B-RECCREATEDBY']));
		} catch (Any e) { }

		try {
		if(form['B-DATELASTUPDATE'] == "" ) c2.setDATELASTUPDATE(javacast("null",""));
		else c2.setDATELASTUPDATE(trim(form['B-DATELASTUPDATE']));
		} catch (Any e) { }

		try {
		if(form['B-HOTLINECELLPHONE'] == "" ) c2.setHOTLINECELLPHONE(javacast("null",""));
		else c2.setHOTLINECELLPHONE(trim(form['B-HOTLINECELLPHONE']));
		} catch (Any e) { }

		try {
		if(form['B-HOTLINEPHONE'] == "" ) c2.setHOTLINEPHONE(javacast("null",""));
		else c2.setHOTLINEPHONE(trim(form['B-HOTLINEPHONE']));
		} catch (Any e) { }

		try {
		if(form['B-MEMO'] == "" ) c2.setMEMO(javacast("null",""));
		else c2.setMEMO(trim(form['B-MEMO']));
		} catch (Any e) { }

		try {
		if(form['C-ISVISIBLE'] == "" ) c3.setISVISIBLE(javacast("null",""));
		else c3.setISVISIBLE(trim(form['C-ISVISIBLE']));
		} catch (Any e) { }

		try {
		if(form['C-MYTHEME'] == "" ) c3.setMYTHEME(javacast("null",""));
		else c3.setMYTHEME(trim(form['C-MYTHEME']));
		} catch (Any e) { }

		try {
		if(form['C-MYMESSAGE'] == "" ) c3.setMYMESSAGE(javacast("null",""));
		else c3.setMYMESSAGE(trim(form['C-MYMESSAGE']));
		} catch (Any e) { }

		try {
		if(form['C-DEFAULTTHEME'] == "" ) c3.setDEFAULTTHEME(javacast("null",""));
		else c3.setDEFAULTTHEME(trim(form['C-DEFAULTTHEME']));
		} catch (Any e) { }

		try {
		if(form['C-SIGNATURE'] == "" ) c3.setSIGNATURE(javacast("null",""));
		else c3.setSIGNATURE(trim(form['C-SIGNATURE']));
		} catch (Any e) { }

		try {
		if(form['C-AVATAR'] == "" ) c3.setAVATAR("noicon.png");
		else c3.setAVATAR(trim(form['C-AVATAR']));
		} catch (Any e) { }


		c1.setDATELASTUPDATE(CreateODBCDateTime(now()));
		c2.setDATELASTUPDATE(CreateODBCDateTime(now()));
		//c1.setGMFPEOPLE(c2);
		//c1.setEGRGMYIBOSE(c3);

		c2.setEGRGUSERMASTER(c1);
		c3.setEGRGUSERMASTER(c1);

		EntitySave(c1);
		EntitySave(c2);
		EntitySave(c3);

		ormflush();

		// update also company table in order for the app to work
		var xgid = ""; xsal = ""; xln = ""; xfn = ""; xmn = ""; xsf = ""; xnn = ""; xccode = ""; xscode = ""; xpid = "";
		var xisvisible = ""; var xmytheme = ""; var xmymessage = ""; var xavatar = ""; var xsig = "";
		try { var xgid = trim(form['A-GUID']); } catch (Any e) {}
		try { var xsal = trim(form['B-SALUTATION']); } catch (Any e) {}
		try { var xln = trim(form['B-LASTNAME']); } catch (Any e) {}
		try { var xfn = trim(form['B-FIRSTNAME']); } catch (Any e) {}
		try { var xmn = trim(form['B-MIDDLENAME']); } catch (Any e) {}
		try { var xsf = trim(form['B-SUFFIX']); } catch (Any e) {}
		try { var xnn = trim(form['B-NICKNAME']); } catch (Any e) {}
		try { var xccode = trim(form['B-COMPANYCODE']); } catch (Any e) {}
		try { var xscode = trim(form['B-SUBCOMPANYCODE']); } catch (Any e) {}
		try { var xpid = trim(form['C-PERSONNELIDNO']); } catch (Any e) {}
		try { var xisvisible = trim(form['C-ISVISIBLE']); } catch (Any e) {}
		try { var xmytheme = trim(form['C-MYTHEME']); } catch (Any e) {}
		try { var xmymessage = trim(form['C-MYMESSAGE']); } catch (Any e) {}
		try { var xavatar = trim(form['C-AVATAR']); } catch (Any e) {}
		try { var xsig = trim(form['C-SIGNATURE']); } catch (Any e) {}

		// Test cmfpa if the user exist ---------------------------------------------------------
		var texist = new query();
		texist.addParam(name="pid",value="#xpid#",cfsqltype="cf_sql_varchar");
		var dsql = "SELECT FIRSTNAME FROM CMFPA WHERE PERSONNELIDNO = :pid";
		texist.setDatasource("#ucase(xccode)#_CBOSE");
		texist.setName("dexist");
		var dresult = texist.execute(sql=dsql);
		var dquery = dresult.getResult();

		queryService = new query();
		queryService.addParam(name="gid",value="#xgid#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="sal",value="#xsal#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="ln",value="#xln#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="fn",value="#xfn#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="mn",value="#xmn#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="sf",value="#xsf#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="nn",value="#xnn#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="ccode",value="#xccode#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="scode",value="#xscode#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="pid",value="#xpid#",cfsqltype="cf_sql_varchar");
		if (dquery.recordcount > 0) { // update the table

			Usql = "UPDATE CMFPA
					   SET GUID = :gid, SALUTATION = :sal, LASTNAME = :ln, FIRSTNAME = :fn,
					       MIDDLENAME = :mn, SUFFIX = :sf, NICKNAME = :nn, COMPANYCODE = :ccode,
					       SUBCOMPANYCODE = :scode
					 WHERE PERSONNELIDNO = :pid";
		} else { // insert the data
			Usql = "INSERT INTO CMFPA (PERSONNELIDNO, GUID, SALUTATION, LASTNAME, FIRSTNAME, MIDDLENAME, SUFFIX, NICKNAME, COMPANYCODE, SUBCOMPANYCODE)
					            VALUES(:pid, :gid, :sal, :ln, :fn, :mn, :sf, :nn, :ccode, :scode)";
		}

		queryService.setDatasource("#ucase(xccode)#_CBOSE");
		queryService.setName("dummyN");
		theResultSet = queryService.execute(sql=Usql);
		// End cmfpa ----------------------------------------------------------------------


		// Test ecrgmyibose if the user exist ----------------------------------------------
		var texist = new query();
		texist.addParam(name="pid",value="#xpid#",cfsqltype="cf_sql_varchar");
		var dsql = "SELECT AVATAR FROM ECRGMYIBOSE WHERE PERSONNELIDNO = :pid";
		texist.setDatasource("#ucase(xccode)#_CBOSE");
		texist.setName("dexist");
		var dresult = texist.execute(sql=dsql);
		var dquery = dresult.getResult();

		queryService = new query();
		queryService.addParam(name="pid",value="#xpid#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="isv",value="#xisvisible#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="myt",value="#xmytheme#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="mym",value="#xmymessage#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="ava",value="#xavatar#",cfsqltype="cf_sql_varchar");
		queryService.addParam(name="sig",value="#xsig#",cfsqltype="cf_sql_varchar");
		if (dquery.recordcount > 0) { // update the table

			Usql = "UPDATE ECRGMYIBOSE
					   SET ISVISIBLE = :isv, MYTHEME = :myt, MYMESSAGE = :mym, AVATAR = :ava, SIGNATURE = :sig
					 WHERE PERSONNELIDNO = :pid";
		} else { // insert the data
			Usql = "INSERT INTO ECRGMYIBOSE (PERSONNELIDNO, ISVISIBLE, MYTHEME, MYMESSAGE, AVATAR, SIGNATURE)
					            VALUES(:pid, :isv, :myt, :mym, :ava, :sig)";
		}

		queryService.setDatasource("#ucase(xccode)#_CBOSE");
		queryService.setName("dummyN");
		theResultSet = queryService.execute(sql=Usql);
		// End test ecrgmyibose



		rootstruct = StructNew();
		rootstruct["success"] = "true";
		return rootstruct;
	}

	public struct function SubmitUserRole() ExtDirect=true ExtFormHandler=true {

		var did = trim(form["USERGRPID"]);
		if(trim(form.USERACTION) == "NEW" || trim(form.USERACTION) == "COPY") {
			var c1 = EntityNew("EGRGUSERGROUPS");

			c1.setUSERGRPID(did);
			//c1.setRECDATECREATED(CreateODBCDateTime(now()));

		} else if(trim(form.USERACTION) == "EDIT") {
			var c1 = EntityLoad("EGRGUSERGROUPS",did, true);
			if (!IsDefined("c1")) {
				rootstruct = StructNew();
				rootstruct["success"] = "true";
			}
		} else if(trim(form.USERACTION) == "DELETE") {
			var dsource = EntityLoad("EGRGUSERGROUPS",did, true);
			if (IsDefined("dsource")) {
				EntityDelete(dsource);
				OrmFlush();
			}
			rootstruct = StructNew();
			rootstruct["success"] = "true";
			return rootstruct;
		} else {
			throw(message="Action unknown!");
		}

		if(Not IsDefined("form.DESCRIPTION") || form.DESCRIPTION== "" ) c1.setDESCRIPTION(javacast("null",""));
		else c1.setDESCRIPTION(trim(form.DESCRIPTION));

		//c1.setDATELASTUPDATE(CreateODBCDateTime(now()));

		EntitySave(c1);

		ormflush();

		rootstruct = StructNew();
		rootstruct["success"] = "true";
		return rootstruct;
	}

}
