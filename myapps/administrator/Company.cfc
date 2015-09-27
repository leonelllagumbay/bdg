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
			dsource = ORMExecuteQuery("SELECT A.COMPANYCODE,
											A.DESCRIPTION,
											A.SLOGAN,
											A.WEBSITEEMAILADD,
											A.HOMEPAGE,
											A.COMPANYTHEME,
											A.ISACTIVE,
											A.DBMS,
											A.DBMSVERSION,
											A.WEBDOMAIN,
											A.TEMPLATECODE,
											A.TEMPLATEDATACODE,
											A.COMPANYDEFAULTAPP,
											A.UNSTRUCDATALOC,
											A.UNSTRUCTDATAMAP,
											A.MAILSERVER,
											A.EMAILUSERNAME,
											A.EMAILPASSWORD,
											A.EMAILTIMEOUT,
											A.EMAILPORT,
											A.EMAILUSETLS,
											A.EMAILUSESSL,
											A.EMAILTYPE,
											A.LDAPSERVER,
											A.LDAPPORT,
											A.LDAPTIMEOUT,
											A.LDAPSTARTROW,
											A.LDAPSTART,
											A.LDAPATTRIBUTES,
											A.LDAPFILTERCONDITIONS,
											A.LDAPSORTCONTROL,
											A.LDAPSEPARATOR,
											A.LDAPSECURE,
											A.LDAPSCOPE,
											A.LDAPRETURNASBINARY,
											A.LDAPREFERRAL,
											A.LDAPREBIND,
											A.LDAPNAME,
											A.LDAPMAXROWS,
											A.LDAPFILTER,
											A.LDAPDN,
											A.LDAPDELIMITER,
											A.LDAPSORT,
											A.MOODLELOC,
											A.OPENMEETINGSLOC,
											A.EROOMSSERVER,
											A.XMLPOPMAILSERVER,
											A.XMLPOPMAILUSERNAME,
											A.XMLPOPMAILPASSWORD,
											A.WITHATTENDANCE,
											A.WITHATTENDANCELOG,
											B.GLOBAL_DSN,
											B.COMPANY_DSN,
											B.SUBCO_DSN,
											B.TRANSACT_DSN,
											B.QUERY_DSN,
											B.SITE_DSN,
											B.VAR_DSN,
											B.SUBNONCO_DSN,
											C.ADDRESS,
											C.BANKACCOUNTNOPBG,
											C.BANKACCOUNTNOSSS,
											C.BANKACCOUNTNOWTAX,
											C.BANKCODEFORPBG,
											C.BANKCODEFORSSS,
											C.BANKCODEFORWTAX,
											C.BUSINESSUNITCODE,
											C.CITY1,C.CITY2,
											C.COMPANYORDER,
											C.COMPANYTAG,
											C.FAXNUMBER,
											C.INDUSTRY,
											C.SSSNUMBER,
											C.NHIPNUMBER,
											C.TELNUMBER1,
											C.TELNUMBER2,
											C.TELNUMBER3,
											C.TIN,
											C.DECLARANTNAME,
											C.DECLARANTPOSITION,
											C.RDOCODE,
											C.ZIPCODE,
											C.RRTREE,
											C.SECTIONCODE,
											C.SSSEDIBRANCHCODE,
											C.SSSEDILOCCODE,
											C.DRIVERNAME,
											C.DATALOCATIONCODE,
											C.RECDATECREATED,
											D.MYIBOSELOGO,
											D.COMPANYLOGO
									   FROM EGRGCOMPANYSETTINGS AS A LEFT JOIN  A.EGRGCOMPANY AS B LEFT JOIN A.GRGCOMPANY AS C LEFT JOIN A.EGRGTHEMES AS D
									   #PreserveSingleQuotes(WHERE)#
			                           ORDER BY #ORDERBY#", false, {maxResults=#limit#, offset=#start#, timeout=500});

			var columnArr = ArrayNew(1);
			ArrayAppend(columnArr, 'A-COMPANYCODE');
			ArrayAppend(columnArr, 'A-DESCRIPTION');
			ArrayAppend(columnArr, 'A-SLOGAN');
			ArrayAppend(columnArr, 'A-WEBSITEEMAILADD');
			ArrayAppend(columnArr, 'A-HOMEPAGE');
			ArrayAppend(columnArr, 'A-COMPANYTHEME');
			ArrayAppend(columnArr, 'A-ISACTIVE');
			ArrayAppend(columnArr, 'A-DBMS');
			ArrayAppend(columnArr, 'A-DBMSVERSION');
			ArrayAppend(columnArr, 'A-WEBDOMAIN');
			ArrayAppend(columnArr, 'A-TEMPLATECODE');
			ArrayAppend(columnArr, 'A-TEMPLATEDATACODE');
			ArrayAppend(columnArr, 'A-COMPANYDEFAULTAPP');
			ArrayAppend(columnArr, 'A-UNSTRUCDATALOC');
			ArrayAppend(columnArr, 'A-UNSTRUCTDATAMAP');
			ArrayAppend(columnArr, 'A-MAILSERVER');
			ArrayAppend(columnArr, 'A-EMAILUSERNAME');
			ArrayAppend(columnArr, 'A-EMAILPASSWORD');
			ArrayAppend(columnArr, 'A-EMAILTIMEOUT');
			ArrayAppend(columnArr, 'A-EMAILPORT');
			ArrayAppend(columnArr, 'A-EMAILUSETLS');
			ArrayAppend(columnArr, 'A-EMAILUSESSL');
			ArrayAppend(columnArr, 'A-EMAILTYPE');
			ArrayAppend(columnArr, 'A-LDAPSERVER');
			ArrayAppend(columnArr, 'A-LDAPPORT');
			ArrayAppend(columnArr, 'A-LDAPTIMEOUT');
			ArrayAppend(columnArr, 'A-LDAPSTARTROW');
			ArrayAppend(columnArr, 'A-LDAPSTART');
			ArrayAppend(columnArr, 'A-LDAPATTRIBUTES');
			ArrayAppend(columnArr, 'A-LDAPFILTERCONDITIONS');
			ArrayAppend(columnArr, 'A-LDAPSORTCONTROL');
			ArrayAppend(columnArr, 'A-LDAPSEPARATOR');
			ArrayAppend(columnArr, 'A-LDAPSECURE');
			ArrayAppend(columnArr, 'A-LDAPSCOPE');
			ArrayAppend(columnArr, 'A-LDAPRETURNASBINARY');
			ArrayAppend(columnArr, 'A-LDAPREFERRAL');
			ArrayAppend(columnArr, 'A-LDAPREBIND');
			ArrayAppend(columnArr, 'A-LDAPNAME');
			ArrayAppend(columnArr, 'A-LDAPMAXROWS');
			ArrayAppend(columnArr, 'A-LDAPFILTER');
			ArrayAppend(columnArr, 'A-LDAPDN');
			ArrayAppend(columnArr, 'A-LDAPDELIMITER');
			ArrayAppend(columnArr, 'A-LDAPSORT');
			ArrayAppend(columnArr, 'A-MOODLELOC');
			ArrayAppend(columnArr, 'A-OPENMEETINGSLOC');
			ArrayAppend(columnArr, 'A-EROOMSSERVER');
			ArrayAppend(columnArr, 'A-XMLPOPMAILSERVER');
			ArrayAppend(columnArr, 'A-XMLPOPMAILUSERNAME');
			ArrayAppend(columnArr, 'A-XMLPOPMAILPASSWORD');
			ArrayAppend(columnArr, 'A-WITHATTENDANCE');
			ArrayAppend(columnArr, 'A-WITHATTENDANCELOG');
			ArrayAppend(columnArr, 'B-GLOBAL_DSN');
			ArrayAppend(columnArr, 'B-COMPANY_DSN');
			ArrayAppend(columnArr, 'B-SUBCO_DSN');
			ArrayAppend(columnArr, 'B-TRANSACT_DSN');
			ArrayAppend(columnArr, 'B-QUERY_DSN');
			ArrayAppend(columnArr, 'B-SITE_DSN');
			ArrayAppend(columnArr, 'B-VAR_DSN');
			ArrayAppend(columnArr, 'B-SUBNONCO_DSN');
			ArrayAppend(columnArr, 'C-ADDRESS');
			ArrayAppend(columnArr, 'C-BANKACCOUNTNOPBG');
			ArrayAppend(columnArr, 'C-BANKACCOUNTNOSSS');
			ArrayAppend(columnArr, 'C-BANKACCOUNTNOWTAX');
			ArrayAppend(columnArr, 'C-BANKCODEFORPBG');
			ArrayAppend(columnArr, 'C-BANKCODEFORSSS');
			ArrayAppend(columnArr, 'C-BANKCODEFORWTAX');
			ArrayAppend(columnArr, 'C-BUSINESSUNITCODE');
			ArrayAppend(columnArr, 'C-CITY1');
			ArrayAppend(columnArr, 'C-CITY2');
			ArrayAppend(columnArr, 'C-COMPANYORDER');
			ArrayAppend(columnArr, 'C-COMPANYTAG');
			ArrayAppend(columnArr, 'C-FAXNUMBER');
			ArrayAppend(columnArr, 'C-INDUSTRY');
			ArrayAppend(columnArr, 'C-SSSNUMBER');
			ArrayAppend(columnArr, 'C-NHIPNUMBER');
			ArrayAppend(columnArr, 'C-TELNUMBER1');
			ArrayAppend(columnArr, 'C-TELNUMBER2');
			ArrayAppend(columnArr, 'C-TELNUMBER3');
			ArrayAppend(columnArr, 'C-TIN');
			ArrayAppend(columnArr, 'C-DECLARANTNAME');
			ArrayAppend(columnArr, 'C-DECLARANTPOSITION');
			ArrayAppend(columnArr, 'C-RDOCODE');
			ArrayAppend(columnArr, 'C-ZIPCODE');
			ArrayAppend(columnArr, 'C-RRTREE');
			ArrayAppend(columnArr, 'C-SECTIONCODE');
			ArrayAppend(columnArr, 'C-SSSEDIBRANCHCODE');
			ArrayAppend(columnArr, 'C-SSSEDILOCCODE');
			ArrayAppend(columnArr, 'C-DRIVERNAME');
			ArrayAppend(columnArr, 'C-DATALOCATIONCODE');
			ArrayAppend(columnArr, 'C-RECDATECREATED');
			ArrayAppend(columnArr, 'D-MYIBOSELOGO');
			ArrayAppend(columnArr, 'D-COMPANYLOGO');

			for(var i=1; i<=ArrayLen(dsource); i++) {
				tmpresult = StructNew();
				for (var c = 1; c <= 92; c++) {
					try { tmpresult['#columnArr[c]#'] = dsource[i][c]; }
					catch (Any e) { tmpresult['#columnArr[c]#'] = ""; }
				}
				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGCOMPANYSETTINGS AS A LEFT JOIN  A.EGRGCOMPANY AS B LEFT JOIN A.GRGCOMPANY AS C LEFT JOIN A.EGRGTHEMES AS D #PreserveSingleQuotes(WHERE)#",true);
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


	public struct function SubmitCompany() ExtDirect=true ExtFormHandler=true {

		if (trim(form.dcompanyicon) neq "") {
			 var formDir = ExpandPath( "../../resource/image/companylogo/" );
			 var fileicon = fileUpload(formDir,"dcompanyicon","image/jpg,image/jpeg,image/png","Overwrite");
		}

		if (trim(form.dcompanylogo) neq "") {
			 var formDir = ExpandPath( "../../resource/image/companylogo/" );
			 var filelogo = fileUpload(formDir,"dcompanylogo","image/jpg,image/jpeg,image/png","Overwrite");
		}

		var dcompanycode = trim(form["A-COMPANYCODE"]);
		if(trim(form.COMPANYACTION) == "NEW" || trim(form.COMPANYACTION) == "COPY") {
			var c1 = EntityNew("EGRGCOMPANYSETTINGS");
			var c2 = EntityNew("EGRGCOMPANY");
			var c3 = EntityNew("GRGCOMPANY");
			var c4 = EntityNew("EGRGTHEMES");

			c1.setCOMPANYCODE(dcompanycode);
			c2.setCOMPANYCODE(dcompanycode);
			c3.setCOMPANYCODE(dcompanycode);
			c4.setCOMPANYCODE(dcompanycode);

			c1.setRECDATECREATED(CreateODBCDateTime(now()));

		} else if(trim(form.COMPANYACTION) == "EDIT") {
			var c1 = EntityLoad("EGRGCOMPANYSETTINGS",dcompanycode, true);
			var c2 = EntityLoad("EGRGCOMPANY",dcompanycode, true);
			var c3 = EntityLoad("GRGCOMPANY",dcompanycode, true);
			var c4 = EntityLoad("EGRGTHEMES",dcompanycode, true);

			if (!IsDefined("c2")) {
				var c2 = EntityNew("EGRGCOMPANY");
				c2.setUSERID(dcompanycode);
			}

			if (!IsDefined("c3")) {
				var c3 = EntityNew("GRGCOMPANY");
				c3.setUSERID(dcompanycode);
			}

			if (!IsDefined("c4")) {
				var c4 = EntityNew("EGRGTHEMES");
				c4.setUSERID(dcompanycode);
			}


		} else if(trim(form.COMPANYACTION) == "DELETE") {
			var dsource = EntityLoad("EGRGCOMPANYSETTINGS",dcompanycode, true);
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
		if(form['A-DESCRIPTION'] == "" ) c1.setDESCRIPTION(javacast("null",""));
		else c1.setDESCRIPTION(trim(form['A-DESCRIPTION']));
		} catch (Any e) { }

		try {
		if(form['A-SLOGAN'] == "" ) c1.setSLOGAN(javacast("null",""));
		else c1.setSLOGAN(trim(form['A-SLOGAN']));
		} catch (Any e) { }

		try {
		if(form['A-WEBSITEEMAILADD'] == "" ) c1.setWEBSITEEMAILADD(javacast("null",""));
		else c1.setWEBSITEEMAILADD(trim(form['A-WEBSITEEMAILADD']));
		} catch (Any e) { }

		try {
		if(form['A-HOMEPAGE'] == "" ) c1.setHOMEPAGE(javacast("null",""));
		else c1.setHOMEPAGE(trim(form['A-HOMEPAGE']));
		} catch (Any e) { }

		try {
		if(form['A-COMPANYTHEME'] == "" ) c1.setCOMPANYTHEME(javacast("null",""));
		else c1.setCOMPANYTHEME(trim(form['A-COMPANYTHEME']));
		} catch (Any e) { }

		try {
		if(form['A-ISACTIVE'] == "" ) c1.setISACTIVE(javacast("null",""));
		else c1.setISACTIVE(trim(form['A-ISACTIVE']));
		} catch (Any e) { }

		if (IsDefined("fileicon")) {
			c4.setMYIBOSELOGO(fileicon.serverFile);
		} else {
			try {
			if(form['D-MYIBOSELOGO'] == "" ) c4.setMYIBOSELOGO(javacast("null",""));
			else c4.setMYIBOSELOGO(trim(form['D-MYIBOSELOGO']));
			} catch (Any e) { }
		}

		if (IsDefined("filelogo")) {
			c4.setCOMPANYLOGO(filelogo.serverFile);
		} else {
			try {
			if(form['D-COMPANYLOGO'] == "" ) c4.setCOMPANYLOGO(javacast("null",""));
			else c4.setCOMPANYLOGO(trim(form['D-COMPANYLOGO']));
			} catch (Any e) { }
		}

		try {
		if(form['A-DBMS'] == "" ) c1.setDBMS(javacast("null",""));
		else c1.setDBMS(trim(form['A-DBMS']));
		} catch (Any e) { }

		try {
		if(form['A-DBMSVERSION'] == "" ) c1.setDBMSVERSION(javacast("null",""));
		else c1.setDBMSVERSION(trim(form['A-DBMSVERSION']));
		} catch (Any e) { }

		try {
		if(form['A-WEBDOMAIN'] == "" ) c1.setWEBDOMAIN(javacast("null",""));
		else c1.setWEBDOMAIN(trim(form['A-WEBDOMAIN']));
		} catch (Any e) { }

		try {
		if(form['A-TEMPLATECODE'] == "" ) c1.setTEMPLATECODE(javacast("null",""));
		else c1.setTEMPLATECODE(trim(form['A-TEMPLATECODE']));
		} catch (Any e) { }

		try {
		if(form['A-TEMPLATEDATACODE'] == "" ) c1.setTEMPLATEDATACODE(javacast("null",""));
		else c1.setTEMPLATEDATACODE(trim(form['A-TEMPLATEDATACODE']));
		} catch (Any e) { }

		try {
		if(form['A-COMPANYDEFAULTAPP'] == "" ) c1.setCOMPANYDEFAULTAPP(javacast("null",""));
		else c1.setCOMPANYDEFAULTAPP(trim(form['A-COMPANYDEFAULTAPP']));
		} catch (Any e) { }

		try {
		if(form['A-UNSTRUCDATALOC'] == "" ) c1.setUNSTRUCDATALOC(javacast("null",""));
		else c1.setUNSTRUCDATALOC(trim(form['A-UNSTRUCDATALOC']));
		} catch (Any e) { }

		try {
		if(form['A-UNSTRUCTDATAMAP'] == "" ) c1.setUNSTRUCTDATAMAP(javacast("null",""));
		else c1.setUNSTRUCTDATAMAP(trim(form['A-UNSTRUCTDATAMAP']));
		} catch (Any e) { }

		try {
		if(form['A-MAILSERVER'] == "" ) c1.setMAILSERVER(javacast("null",""));
		else c1.setMAILSERVER(trim(form['A-MAILSERVER']));
		} catch (Any e) { }

		try {
		if(form['A-EMAILUSERNAME'] == "" ) c1.setEMAILUSERNAME(javacast("null",""));
		else c1.setEMAILUSERNAME(trim(form['A-EMAILUSERNAME']));
		} catch (Any e) { }

		try {
		if(form['A-EMAILPASSWORD'] == "" ) c1.setEMAILPASSWORD(javacast("null",""));
		else c1.setEMAILPASSWORD(trim(form['A-EMAILPASSWORD']));
		} catch (Any e) { }

		try {
		if(form['A-EMAILTIMEOUT'] == "" ) c1.setEMAILTIMEOUT(javacast("null",""));
		else c1.setEMAILTIMEOUT(trim(form['A-EMAILTIMEOUT']));
		} catch (Any e) { }

		try {
		if(form['A-EMAILPORT'] == "" ) c1.setEMAILPORT(javacast("null",""));
		else c1.setEMAILPORT(trim(form['A-EMAILPORT']));
		} catch (Any e) { }

		try {
		if(form['A-EMAILUSETLS'] == "" ) c1.setEMAILUSETLS(javacast("null",""));
		else c1.setEMAILUSETLS(trim(form['A-EMAILUSETLS']));
		} catch (Any e) { }

		try {
		if(form['A-EMAILUSESSL'] == "" ) c1.setEMAILUSESSL(javacast("null",""));
		else c1.setEMAILUSESSL(trim(form['A-EMAILUSESSL']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPSERVER'] == "" ) c1.setLDAPSERVER(javacast("null",""));
		else c1.setLDAPSERVER(trim(form['A-LDAPSERVER']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPPORT'] == "" ) c1.setLDAPPORT(javacast("null",""));
		else c1.setLDAPPORT(trim(form['A-LDAPPORT']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPTIMEOUT'] == "" ) c1.setLDAPTIMEOUT(javacast("null",""));
		else c1.setLDAPTIMEOUT(trim(form['A-LDAPTIMEOUT']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPSTARTROW'] == "" ) c1.setLDAPSTARTROW(javacast("null",""));
		else c1.setLDAPSTARTROW(trim(form['A-LDAPSTARTROW']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPSTART'] == "" ) c1.setLDAPSTART(javacast("null",""));
		else c1.setLDAPSTART(trim(form['A-LDAPSTART']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPATTRIBUTES'] == "" ) c1.setLDAPATTRIBUTES(javacast("null",""));
		else c1.setLDAPATTRIBUTES(trim(form['A-LDAPATTRIBUTES']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPFILTERCONDITIONS'] == "" ) c1.setLDAPFILTERCONDITIONS(javacast("null",""));
		else c1.setLDAPFILTERCONDITIONS(trim(form['A-LDAPFILTERCONDITIONS']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPSORTCONTROL'] == "" ) c1.setLDAPSORTCONTROL(javacast("null",""));
		else c1.setLDAPSORTCONTROL(trim(form['A-LDAPSORTCONTROL']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPSEPARATOR'] == "" ) c1.setLDAPSEPARATOR(javacast("null",""));
		else c1.setLDAPSEPARATOR(trim(form['A-LDAPSEPARATOR']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPSECURE'] == "" ) c1.setLDAPSECURE(javacast("null",""));
		else c1.setLDAPSECURE(trim(form['A-LDAPSECURE']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPSCOPE'] == "" ) c1.setLDAPSCOPE(javacast("null",""));
		else c1.setLDAPSCOPE(trim(form['A-LDAPSCOPE']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPRETURNASBINARY'] == "" ) c1.setLDAPRETURNASBINARY(javacast("null",""));
		else c1.setLDAPRETURNASBINARY(trim(form['A-LDAPRETURNASBINARY']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPREFERRAL'] == "" ) c1.setLDAPREFERRAL(javacast("null",""));
		else c1.setLDAPREFERRAL(trim(form['A-LDAPREFERRAL']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPREBIND'] == "" ) c1.setLDAPREBIND(javacast("null",""));
		else c1.setLDAPREBIND(trim(form['A-LDAPREBIND']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPNAME'] == "" ) c1.setLDAPNAME(javacast("null",""));
		else c1.setLDAPNAME(trim(form['A-LDAPNAME']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPMAXROWS'] == "" ) c1.setLDAPMAXROWS(javacast("null",""));
		else c1.setLDAPMAXROWS(trim(form['A-LDAPMAXROWS']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPFILTER'] == "" ) c1.setLDAPFILTER(javacast("null",""));
		else c1.setLDAPFILTER(trim(form['A-LDAPFILTER']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPDN'] == "" ) c1.setLDAPDN(javacast("null",""));
		else c1.setLDAPDN(trim(form['A-LDAPDN']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPDELIMITER'] == "" ) c1.setLDAPDELIMITER(javacast("null",""));
		else c1.setLDAPDELIMITER(trim(form['A-LDAPDELIMITER']));
		} catch (Any e) { }

		try {
		if(form['A-LDAPSORT'] == "" ) c1.setLDAPSORT(javacast("null",""));
		else c1.setLDAPSORT(trim(form['A-LDAPSORT']));
		} catch (Any e) { }

		try {
		if(form['A-MOODLELOC'] == "" ) c1.setMOODLELOC(javacast("null",""));
		else c1.setMOODLELOC(trim(form['A-MOODLELOC']));
		} catch (Any e) { }

		try {
		if(form['A-OPENMEETINGSLOC'] == "" ) c1.setOPENMEETINGSLOC(javacast("null",""));
		else c1.setOPENMEETINGSLOC(trim(form['A-OPENMEETINGSLOC']));
		} catch (Any e) { }

		try {
		if(form['A-EROOMSSERVER'] == "" ) c1.setEROOMSSERVER(javacast("null",""));
		else c1.setEROOMSSERVER(trim(form['A-EROOMSSERVER']));
		} catch (Any e) { }

		try {
		if(form['A-XMLPOPMAILSERVER'] == "" ) c1.setXMLPOPMAILSERVER(javacast("null",""));
		else c1.setXMLPOPMAILSERVER(trim(form['A-XMLPOPMAILSERVER']));
		} catch (Any e) { }

		try {
		if(form['A-XMLPOPMAILUSERNAME'] == "" ) c1.setXMLPOPMAILUSERNAME(javacast("null",""));
		else c1.setXMLPOPMAILUSERNAME(trim(form['A-XMLPOPMAILUSERNAME']));
		} catch (Any e) { }

		try {
		if(form['A-XMLPOPMAILPASSWORD'] == "" ) c1.setXMLPOPMAILPASSWORD(javacast("null",""));
		else c1.setXMLPOPMAILPASSWORD(trim(form['A-XMLPOPMAILPASSWORD']));
		} catch (Any e) { }

		try {
		if(form['A-WITHATTENDANCE'] == "" ) c1.setWITHATTENDANCE(javacast("null",""));
		else c1.setWITHATTENDANCE(trim(form['A-WITHATTENDANCE']));
		} catch (Any e) { }

		try {
		if(form['A-WITHATTENDANCELOG'] == "" ) c1.setWITHATTENDANCELOG(javacast("null",""));
		else c1.setWITHATTENDANCELOG(trim(form['A-WITHATTENDANCELOG']));
		} catch (Any e) { }

		try {
		if(form['B-GLOBAL_DSN'] == "" ) c2.setGLOBAL_DSN(javacast("null",""));
		else c2.setGLOBAL_DSN(trim(form['B-GLOBAL_DSN']));
		} catch (Any e) { }

		try {
		if(form['B-COMPANY_DSN'] == "" ) c2.setCOMPANY_DSN(javacast("null",""));
		else c2.setCOMPANY_DSN(trim(form['B-COMPANY_DSN']));
		} catch (Any e) { }

		try {
		if(form['B-SUBCO_DSN'] == "" ) c2.setSUBCO_DSN(javacast("null",""));
		else c2.setSUBCO_DSN(trim(form['B-SUBCO_DSN']));
		} catch (Any e) { }

		try {
		if(form['B-TRANSACT_DSN'] == "" ) c2.setTRANSACT_DSN(javacast("null",""));
		else c2.setTRANSACT_DSN(trim(form['B-TRANSACT_DSN']));
		} catch (Any e) { }

		try {
		if(form['B-QUERY_DSN'] == "" ) c2.setQUERY_DSN(javacast("null",""));
		else c2.setQUERY_DSN(trim(form['B-QUERY_DSN']));
		} catch (Any e) { }

		try {
		if(form['B-SITE_DSN'] == "" ) c2.setSITE_DSN(javacast("null",""));
		else c2.setSITE_DSN(trim(form['B-SITE_DSN']));
		} catch (Any e) { }

		try {
		if(form['B-VAR_DSN'] == "" ) c2.setVAR_DSN(javacast("null",""));
		else c2.setVAR_DSN(trim(form['B-VAR_DSN']));
		} catch (Any e) { }

		try {
		if(form['B-SUBNONCO_DSN'] == "" ) c2.setSUBNONCO_DSN(javacast("null",""));
		else c2.setSUBNONCO_DSN(trim(form['B-SUBNONCO_DSN']));
		} catch (Any e) { }

		try {
		if(form['C-ADDRESS'] == "" ) c3.setADDRESS(javacast("null",""));
		else c3.setADDRESS(trim(form['C-ADDRESS']));
		} catch (Any e) { }

		try {
		if(form['A-DESCRIPTION'] == "" ) c3.setCOMPANYNAME(javacast("null",""));
		else c3.setCOMPANYNAME(trim(form['A-DESCRIPTION']));
		} catch (Any e) { }

		try {
		if(form['C-COMPANYORDER'] == "" ) c3.setCOMPANYORDER(javacast("null",""));
		else c3.setCOMPANYORDER(trim(form['C-COMPANYORDER']));
		} catch (Any e) { }

		try {
		if(form['C-INDUSTRY'] == "" ) c3.setINDUSTRY(javacast("null",""));
		else c3.setINDUSTRY(trim(form['C-INDUSTRY']));
		} catch (Any e) { }

		try {
		if(form['C-TELNUMBER1'] == "" ) c3.setTELNUMBER1(javacast("null",""));
		else c3.setTELNUMBER1(trim(form['C-TELNUMBER1']));
		} catch (Any e) { }

		try {
		if(form['C-TELNUMBER2'] == "" ) c3.setTELNUMBER2(javacast("null",""));
		else c3.setTELNUMBER2(trim(form['C-TELNUMBER2']));
		} catch (Any e) { }

		try {
		if(form['C-TELNUMBER3'] == "" ) c3.setTELNUMBER3(javacast("null",""));
		else c3.setTELNUMBER3(trim(form['C-TELNUMBER3']));
		} catch (Any e) { }

		try {
		if(form['C-TIN'] == "" ) c3.setTIN(javacast("null",""));
		else c3.setTIN(trim(form['C-TIN']));
		} catch (Any e) { }

		try {
		if(form['C-SSSNUMBER'] == "" ) c3.setSSSNUMBER(javacast("null",""));
		else c3.setSSSNUMBER(trim(form['C-SSSNUMBER']));
		} catch (Any e) { }

		try {
		if(form['C-FAXNUMBER'] == "" ) c3.setFAXNUMBER(javacast("null",""));
		else c3.setFAXNUMBER(trim(form['C-FAXNUMBER']));
		} catch (Any e) { }

		c1.setDATELASTUPDATE(CreateODBCDateTime(now()));
		/*c1.setEGRGCOMPANY(c2);
		c1.setGRGCOMPANY(c3);
		c1.setEGRGTHEMES(c4);*/
		c2.setEGRGCOMPANYSETTINGS(c1);
		c3.setEGRGCOMPANYSETTINGS(c1);
		c4.setEGRGCOMPANYSETTINGS(c1);

		EntitySave(c1);
		EntitySave(c2);
		EntitySave(c3);
		EntitySave(c4);

		ormflush();

		rootstruct = StructNew();
		rootstruct["success"] = "true";
		return rootstruct;
	}

}
