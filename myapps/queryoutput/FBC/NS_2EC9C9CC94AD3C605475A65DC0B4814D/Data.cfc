
component  output=false persistent=false ExtDirect=true {
public struct function Read(required string page,
							required string start,
							required string limit,
							required any sort,
							required any filter,
							required string querycode,
							required struct extraparams)
ExtDirect=true
{
	var theargs = StructNew();
	theargs["page"] = page;
    theargs["start"] = start;
    theargs["limit"] = limit;
    theargs["sort"] = sort;
    theargs["filter"] = filter;

    bcObj = Createobject("component","IBOSE.application.GridQuery");
    dresult = bcObj.buildConditionDash(argumentCollection="#theargs#");
	WHERE = dresult["where"];
    ORDERBY = dresult["orderby"];



	if (trim(WHERE) == "") {
		WHERE = "WHERE  cin21personalinfo.PERSONNELIDNO = '#session.chapa#'";
	} else {
		WHERE = "#WHERE#  AND  cin21personalinfo.PERSONNELIDNO = '#session.chapa#'";
	}

	/* Dynamically processes extra parameters */
	if (!StructIsEmpty(extraparams)) {
		var extraparamKeys = StructKeyArray(extraparams);
		var extraCondArr = ArrayNew(1);
		for (var b=1; b <= ArrayLen(extraparamKeys); b++) {
			var excond = "#replace(extraparamKeys[b],'_','.')# = '" & extraparams["#extraparamKeys[b]#"] & "'";
			ArrayAppend(extraCondArr, excond);
		}
		var excondition = ArrayToList(extraCondArr, " AND ");
		if (WHERE == "") {
			WHERE = "WHERE " & excondition;
		} else {
			WHERE = WHERE & " AND " & excondition;
		}
	}



	if (trim(ORDERBY) == "") {
		ORDERBY = "";
	} else {
		ORDERBY = "ORDER BY #ORDERBY# ";
	}

	Usql = "SELECT cin21personalinfo.BIRTHDAY AS 'Birthday', cin21personalinfo.AGE AS 'Age', cin21personalinfo.BIRTHPLACE AS 'Birthplace', cin21personalinfo.CITIZENSHIP AS 'Citizenship', cin21personalinfo.CITYPROVINCE AS 'City or Province', cin21personalinfo.CIVILSTATUS AS 'Civil Status', cin21personalinfo.CONTACTADDRESS AS 'Contact Address', cin21personalinfo.CONTACTADDRESS2 AS 'Contact Address 2', cin21personalinfo.CONTACTADDRESS3 AS 'Contact Address 3', cin21personalinfo.SEX AS 'Gender', cin21personalinfo.ACRNUMBER AS 'ACR Number', cin21personalinfo.ACRDATEISSUED AS 'ACR Date Issued', cin21personalinfo.ACREXPIRATIONDATE AS 'ACR Expiration Date', cin21personalinfo.CONTACTCELLNUMBER AS 'Mobile Number', cin21personalinfo.CONTACTPAGERNO AS 'Contact Pager No', cin21personalinfo.CONTACTTELNO AS 'Telephone Number', cin21personalinfo.EMAILADDRESS AS 'Email Address', cin21personalinfo.HEIGHT AS 'Height', cin21personalinfo.WEIGHT AS 'Weight', cin21personalinfo.LANGUAGEREAD AS 'Language Read', cin21personalinfo.LANGUAGESPOKEN AS 'Language Spoken', cin21personalinfo.LANGUAGEWRITTEN AS 'Language Written', cin21personalinfo.MAIDENNAME AS 'Maiden Name', cin21personalinfo.NATIONALITY AS 'Nationality', cin21personalinfo.NUMBEROFCHILDREN AS 'Number of Children', cin21personalinfo.OCCUPATIONCOMPANY AS 'Occupation or Company', cin21personalinfo.PASSPORTNUMBER AS 'Passport Number', cin21personalinfo.PASSPORTDATEISSUED AS 'Passport Date Issued', cin21personalinfo.PERCELLNUMBER AS 'Per Cell Number', cin21personalinfo.PERIODOFRESIDENCE AS 'Period of Residence', cin21personalinfo.PERPAGERNUMBER AS 'Per Pager No', cin21personalinfo.PERSONNELIDNO AS 'Personnel ID No', cin21personalinfo.PERSONTOCONTACT AS 'Person to Contact', cin21personalinfo.PLACEOFISSUANCE AS 'Place of Issuance', cin21personalinfo.PROVPERIODOFRES AS 'Province Period of Residence', cin21personalinfo.PROVTELNUMBER AS 'Provincial Tel No', cin21personalinfo.PROVZIPCODE AS 'Prov Zip Code', cin21personalinfo.RELATIONSHIP AS 'Relationship', cin21personalinfo.RELIGIONCODE AS 'Religion Code', cin21personalinfo.SPOUSENAME AS 'Spouse Name', cin21personalinfo.STREETBARRIO AS 'Street or Barrio', cin21personalinfo.STREETBARRIO2 AS 'Street or Barrio 2', cin21personalinfo.STREETBARRIO3 AS 'Street or Barrio 3', cin21personalinfo.TELEPHONENUMBER AS 'Tel Number 1', cin21personalinfo.TELEPHONENUMBER2 AS 'Tel Number 2', cin21personalinfo.TELEPHONENUMBER3 AS 'Tel Number 3', cin21personalinfo.TOWNLOCALITY AS 'Town Locality', cin21personalinfo.ZIPCODE AS 'Zip Code', cin21personalinfo.PREVIOUSADDRESS AS 'Previous Address', cin21personalinfo.PREVIOUSTELNUMBER AS 'Previous Tel No', cin21personalinfo.PREVIOUSZIPCODE AS 'Previous Zip Code', cin21personalinfo.PROVINCIALADDRESS AS 'Provincial Address', cin21personalinfo.EMAILADDRESS2 AS 'Alternative Email', cin21personalinfo.EXPIRATIONDATE AS 'Expiration Date'
			 FROM #session.companycode#_cbose.cin21personalinfo cin21personalinfo
			 #WHERE#
			 
			 
			 #ORDERBY#";

	queryService = new query();
	queryService.setDatasource("#session.global_dsn#");
  		queryService.setName("dqueryname");
	queryService.setSQL(Usql);
	theResultSet = queryService.execute();
	dquery = theResultSet.getResult();

	resultArr = ArrayNew(1);
	rootstuct = StructNew();
    rootstuct["totalCount"] = dquery.recordCount;

	if (dquery.recordCount < limit) {
    	limit = dquery.recordCount;
    }
    /*Creates an array of structure to be converted to JSON using serializeJSON*/
	for (var b = start+1; b <= start+limit; b++) {
    	tmpresult = StructNew();
 
    			tmpresult["cin21personalinfo-BIRTHDAY"] = dquery["BIRTHDAY"][b];
    			tmpresult["cin21personalinfo-AGE"] = dquery["AGE"][b];
    			tmpresult["cin21personalinfo-BIRTHPLACE"] = dquery["BIRTHPLACE"][b];
    			tmpresult["cin21personalinfo-CITIZENSHIP"] = dquery["CITIZENSHIP"][b];
    			tmpresult["cin21personalinfo-CITYPROVINCE"] = dquery["CITY OR PROVINCE"][b];
    			tmpresult["cin21personalinfo-CIVILSTATUS"] = dquery["CIVIL STATUS"][b];
    			tmpresult["cin21personalinfo-CONTACTADDRESS"] = dquery["CONTACT ADDRESS"][b];
    			tmpresult["cin21personalinfo-CONTACTADDRESS2"] = dquery["CONTACT ADDRESS 2"][b];
    			tmpresult["cin21personalinfo-CONTACTADDRESS3"] = dquery["CONTACT ADDRESS 3"][b];
    			tmpresult["cin21personalinfo-SEX"] = dquery["GENDER"][b];
    			tmpresult["cin21personalinfo-ACRNUMBER"] = dquery["ACR NUMBER"][b];
    			tmpresult["cin21personalinfo-ACRDATEISSUED"] = dquery["ACR DATE ISSUED"][b];
    			tmpresult["cin21personalinfo-ACREXPIRATIONDATE"] = dquery["ACR EXPIRATION DATE"][b];
    			tmpresult["cin21personalinfo-CONTACTCELLNUMBER"] = dquery["MOBILE NUMBER"][b];
    			tmpresult["cin21personalinfo-CONTACTPAGERNO"] = dquery["CONTACT PAGER NO"][b];
    			tmpresult["cin21personalinfo-CONTACTTELNO"] = dquery["TELEPHONE NUMBER"][b];
    			tmpresult["cin21personalinfo-EMAILADDRESS"] = dquery["EMAIL ADDRESS"][b];
    			tmpresult["cin21personalinfo-HEIGHT"] = dquery["HEIGHT"][b];
    			tmpresult["cin21personalinfo-WEIGHT"] = dquery["WEIGHT"][b];
    			tmpresult["cin21personalinfo-LANGUAGEREAD"] = dquery["LANGUAGE READ"][b];
    			tmpresult["cin21personalinfo-LANGUAGESPOKEN"] = dquery["LANGUAGE SPOKEN"][b];
    			tmpresult["cin21personalinfo-LANGUAGEWRITTEN"] = dquery["LANGUAGE WRITTEN"][b];
    			tmpresult["cin21personalinfo-MAIDENNAME"] = dquery["MAIDEN NAME"][b];
    			tmpresult["cin21personalinfo-NATIONALITY"] = dquery["NATIONALITY"][b];
    			tmpresult["cin21personalinfo-NUMBEROFCHILDREN"] = dquery["NUMBER OF CHILDREN"][b];
    			tmpresult["cin21personalinfo-OCCUPATIONCOMPANY"] = dquery["OCCUPATION OR COMPANY"][b];
    			tmpresult["cin21personalinfo-PASSPORTNUMBER"] = dquery["PASSPORT NUMBER"][b];
    			tmpresult["cin21personalinfo-PASSPORTDATEISSUED"] = dquery["PASSPORT DATE ISSUED"][b];
    			tmpresult["cin21personalinfo-PERCELLNUMBER"] = dquery["PER CELL NUMBER"][b];
    			tmpresult["cin21personalinfo-PERIODOFRESIDENCE"] = dquery["PERIOD OF RESIDENCE"][b];
    			tmpresult["cin21personalinfo-PERPAGERNUMBER"] = dquery["PER PAGER NO"][b];
    			tmpresult["cin21personalinfo-PERSONNELIDNO"] = dquery["PERSONNEL ID NO"][b];
    			tmpresult["cin21personalinfo-PERSONTOCONTACT"] = dquery["PERSON TO CONTACT"][b];
    			tmpresult["cin21personalinfo-PLACEOFISSUANCE"] = dquery["PLACE OF ISSUANCE"][b];
    			tmpresult["cin21personalinfo-PROVPERIODOFRES"] = dquery["PROVINCE PERIOD OF RESIDENCE"][b];
    			tmpresult["cin21personalinfo-PROVTELNUMBER"] = dquery["PROVINCIAL TEL NO"][b];
    			tmpresult["cin21personalinfo-PROVZIPCODE"] = dquery["PROV ZIP CODE"][b];
    			tmpresult["cin21personalinfo-RELATIONSHIP"] = dquery["RELATIONSHIP"][b];
    			tmpresult["cin21personalinfo-RELIGIONCODE"] = dquery["RELIGION CODE"][b];
    			tmpresult["cin21personalinfo-SPOUSENAME"] = dquery["SPOUSE NAME"][b];
    			tmpresult["cin21personalinfo-STREETBARRIO"] = dquery["STREET OR BARRIO"][b];
    			tmpresult["cin21personalinfo-STREETBARRIO2"] = dquery["STREET OR BARRIO 2"][b];
    			tmpresult["cin21personalinfo-STREETBARRIO3"] = dquery["STREET OR BARRIO 3"][b];
    			tmpresult["cin21personalinfo-TELEPHONENUMBER"] = dquery["TEL NUMBER 1"][b];
    			tmpresult["cin21personalinfo-TELEPHONENUMBER2"] = dquery["TEL NUMBER 2"][b];
    			tmpresult["cin21personalinfo-TELEPHONENUMBER3"] = dquery["TEL NUMBER 3"][b];
    			tmpresult["cin21personalinfo-TOWNLOCALITY"] = dquery["TOWN LOCALITY"][b];
    			tmpresult["cin21personalinfo-ZIPCODE"] = dquery["ZIP CODE"][b];
    			tmpresult["cin21personalinfo-PREVIOUSADDRESS"] = dquery["PREVIOUS ADDRESS"][b];
    			tmpresult["cin21personalinfo-PREVIOUSTELNUMBER"] = dquery["PREVIOUS TEL NO"][b];
    			tmpresult["cin21personalinfo-PREVIOUSZIPCODE"] = dquery["PREVIOUS ZIP CODE"][b];
    			tmpresult["cin21personalinfo-PROVINCIALADDRESS"] = dquery["PROVINCIAL ADDRESS"][b];
    			tmpresult["cin21personalinfo-EMAILADDRESS2"] = dquery["ALTERNATIVE EMAIL"][b];
    			tmpresult["cin21personalinfo-EXPIRATIONDATE"] = dquery["EXPIRATION DATE"][b];
		ArrayAppend(resultArr, tmpresult);
    }
    rootstuct["topics"] = resultArr;
	return rootstuct;
}

public struct function Create(required any args) ExtDirect=true {
	var retVal = StructNew();
	if (!isArray(args)) {
		var ar = ArrayNew(1);
		ar[1] = args;
		args = ArrayNew(1);
		args = ar;
	}

	for (b = 1; b <= ArrayLen(args); b++) {
		queryService = new query();
		queryService.addParam(name="BIRTHDAY",value="#rereplace(args[b]['cin21personalinfo-BIRTHDAY'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="AGE",value="#args[b]['cin21personalinfo-AGE']#",cfsqltype="CF_SQL_INTEGER");
			queryService.addParam(name="BIRTHPLACE",value="#args[b]['cin21personalinfo-BIRTHPLACE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CITIZENSHIP",value="#args[b]['cin21personalinfo-CITIZENSHIP']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CITYPROVINCE",value="#args[b]['cin21personalinfo-CITYPROVINCE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CIVILSTATUS",value="#args[b]['cin21personalinfo-CIVILSTATUS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CONTACTADDRESS",value="#args[b]['cin21personalinfo-CONTACTADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CONTACTADDRESS2",value="#args[b]['cin21personalinfo-CONTACTADDRESS2']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CONTACTADDRESS3",value="#args[b]['cin21personalinfo-CONTACTADDRESS3']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SEX",value="#args[b]['cin21personalinfo-SEX']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="ACRNUMBER",value="#args[b]['cin21personalinfo-ACRNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="ACRDATEISSUED",value="#rereplace(args[b]['cin21personalinfo-ACRDATEISSUED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="ACREXPIRATIONDATE",value="#rereplace(args[b]['cin21personalinfo-ACREXPIRATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="CONTACTCELLNUMBER",value="#args[b]['cin21personalinfo-CONTACTCELLNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CONTACTPAGERNO",value="#args[b]['cin21personalinfo-CONTACTPAGERNO']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CONTACTTELNO",value="#args[b]['cin21personalinfo-CONTACTTELNO']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="EMAILADDRESS",value="#args[b]['cin21personalinfo-EMAILADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="HEIGHT",value="#args[b]['cin21personalinfo-HEIGHT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="WEIGHT",value="#args[b]['cin21personalinfo-WEIGHT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LANGUAGEREAD",value="#args[b]['cin21personalinfo-LANGUAGEREAD']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LANGUAGESPOKEN",value="#args[b]['cin21personalinfo-LANGUAGESPOKEN']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LANGUAGEWRITTEN",value="#args[b]['cin21personalinfo-LANGUAGEWRITTEN']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="MAIDENNAME",value="#args[b]['cin21personalinfo-MAIDENNAME']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="NATIONALITY",value="#args[b]['cin21personalinfo-NATIONALITY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="NUMBEROFCHILDREN",value="#args[b]['cin21personalinfo-NUMBEROFCHILDREN']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="OCCUPATIONCOMPANY",value="#args[b]['cin21personalinfo-OCCUPATIONCOMPANY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PASSPORTNUMBER",value="#args[b]['cin21personalinfo-PASSPORTNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PASSPORTDATEISSUED",value="#rereplace(args[b]['cin21personalinfo-PASSPORTDATEISSUED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="PERCELLNUMBER",value="#args[b]['cin21personalinfo-PERCELLNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PERIODOFRESIDENCE",value="#args[b]['cin21personalinfo-PERIODOFRESIDENCE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PERPAGERNUMBER",value="#args[b]['cin21personalinfo-PERPAGERNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PERSONNELIDNO",value="#args[b]['cin21personalinfo-PERSONNELIDNO']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PERSONTOCONTACT",value="#args[b]['cin21personalinfo-PERSONTOCONTACT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PLACEOFISSUANCE",value="#args[b]['cin21personalinfo-PLACEOFISSUANCE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PROVPERIODOFRES",value="#args[b]['cin21personalinfo-PROVPERIODOFRES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PROVTELNUMBER",value="#args[b]['cin21personalinfo-PROVTELNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PROVZIPCODE",value="#args[b]['cin21personalinfo-PROVZIPCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RELATIONSHIP",value="#args[b]['cin21personalinfo-RELATIONSHIP']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RELIGIONCODE",value="#args[b]['cin21personalinfo-RELIGIONCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SPOUSENAME",value="#args[b]['cin21personalinfo-SPOUSENAME']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="STREETBARRIO",value="#args[b]['cin21personalinfo-STREETBARRIO']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="STREETBARRIO2",value="#args[b]['cin21personalinfo-STREETBARRIO2']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="STREETBARRIO3",value="#args[b]['cin21personalinfo-STREETBARRIO3']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TELEPHONENUMBER",value="#args[b]['cin21personalinfo-TELEPHONENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TELEPHONENUMBER2",value="#args[b]['cin21personalinfo-TELEPHONENUMBER2']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TELEPHONENUMBER3",value="#args[b]['cin21personalinfo-TELEPHONENUMBER3']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TOWNLOCALITY",value="#args[b]['cin21personalinfo-TOWNLOCALITY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="ZIPCODE",value="#args[b]['cin21personalinfo-ZIPCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PREVIOUSADDRESS",value="#args[b]['cin21personalinfo-PREVIOUSADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PREVIOUSTELNUMBER",value="#args[b]['cin21personalinfo-PREVIOUSTELNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PREVIOUSZIPCODE",value="#args[b]['cin21personalinfo-PREVIOUSZIPCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PROVINCIALADDRESS",value="#args[b]['cin21personalinfo-PROVINCIALADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="EMAILADDRESS2",value="#args[b]['cin21personalinfo-EMAILADDRESS2']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="EXPIRATIONDATE",value="#rereplace(args[b]['cin21personalinfo-EXPIRATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				
		Usql = 'INSERT INTO {COMPANYCODE}_cbose.cin21personalinfo (BIRTHDAY,AGE,BIRTHPLACE,CITIZENSHIP,CITYPROVINCE,CIVILSTATUS,CONTACTADDRESS,CONTACTADDRESS2,CONTACTADDRESS3,SEX,ACRNUMBER,ACRDATEISSUED,ACREXPIRATIONDATE,CONTACTCELLNUMBER,CONTACTPAGERNO,CONTACTTELNO,EMAILADDRESS,HEIGHT,WEIGHT,LANGUAGEREAD,LANGUAGESPOKEN,LANGUAGEWRITTEN,MAIDENNAME,NATIONALITY,NUMBEROFCHILDREN,OCCUPATIONCOMPANY,PASSPORTNUMBER,PASSPORTDATEISSUED,PERCELLNUMBER,PERIODOFRESIDENCE,PERPAGERNUMBER,PERSONNELIDNO,PERSONTOCONTACT,PLACEOFISSUANCE,PROVPERIODOFRES,PROVTELNUMBER,PROVZIPCODE,RELATIONSHIP,RELIGIONCODE,SPOUSENAME,STREETBARRIO,STREETBARRIO2,STREETBARRIO3,TELEPHONENUMBER,TELEPHONENUMBER2,TELEPHONENUMBER3,TOWNLOCALITY,ZIPCODE,PREVIOUSADDRESS,PREVIOUSTELNUMBER,PREVIOUSZIPCODE,PROVINCIALADDRESS,EMAILADDRESS2,EXPIRATIONDATE)
		          VALUES (:BIRTHDAY, :AGE, :BIRTHPLACE, :CITIZENSHIP, :CITYPROVINCE, :CIVILSTATUS, :CONTACTADDRESS, :CONTACTADDRESS2, :CONTACTADDRESS3, :SEX, :ACRNUMBER, :ACRDATEISSUED, :ACREXPIRATIONDATE, :CONTACTCELLNUMBER, :CONTACTPAGERNO, :CONTACTTELNO, :EMAILADDRESS, :HEIGHT, :WEIGHT, :LANGUAGEREAD, :LANGUAGESPOKEN, :LANGUAGEWRITTEN, :MAIDENNAME, :NATIONALITY, :NUMBEROFCHILDREN, :OCCUPATIONCOMPANY, :PASSPORTNUMBER, :PASSPORTDATEISSUED, :PERCELLNUMBER, :PERIODOFRESIDENCE, :PERPAGERNUMBER, :PERSONNELIDNO, :PERSONTOCONTACT, :PLACEOFISSUANCE, :PROVPERIODOFRES, :PROVTELNUMBER, :PROVZIPCODE, :RELATIONSHIP, :RELIGIONCODE, :SPOUSENAME, :STREETBARRIO, :STREETBARRIO2, :STREETBARRIO3, :TELEPHONENUMBER, :TELEPHONENUMBER2, :TELEPHONENUMBER3, :TOWNLOCALITY, :ZIPCODE, :PREVIOUSADDRESS, :PREVIOUSTELNUMBER, :PREVIOUSZIPCODE, :PROVINCIALADDRESS, :EMAILADDRESS2, :EXPIRATIONDATE)';
		queryService.setDatasource(session.global_dsn);
	  	queryService.setName('qryname');
		queryService.setSQL(Usql);
		var theResultSet = queryService.execute();
	}

	retVal["message"] = args;
	retVal["success"] = true;
	return retVal;
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
		queryService = new query();
		queryService.addParam(name="BIRTHDAY",value="#rereplace(args[b]['cin21personalinfo-BIRTHDAY'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="AGE",value="#args[b]['cin21personalinfo-AGE']#",cfsqltype="CF_SQL_INTEGER");
			queryService.addParam(name="BIRTHPLACE",value="#args[b]['cin21personalinfo-BIRTHPLACE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CITIZENSHIP",value="#args[b]['cin21personalinfo-CITIZENSHIP']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CITYPROVINCE",value="#args[b]['cin21personalinfo-CITYPROVINCE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CIVILSTATUS",value="#args[b]['cin21personalinfo-CIVILSTATUS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CONTACTADDRESS",value="#args[b]['cin21personalinfo-CONTACTADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CONTACTADDRESS2",value="#args[b]['cin21personalinfo-CONTACTADDRESS2']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CONTACTADDRESS3",value="#args[b]['cin21personalinfo-CONTACTADDRESS3']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SEX",value="#args[b]['cin21personalinfo-SEX']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="ACRNUMBER",value="#args[b]['cin21personalinfo-ACRNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="ACRDATEISSUED",value="#rereplace(args[b]['cin21personalinfo-ACRDATEISSUED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="ACREXPIRATIONDATE",value="#rereplace(args[b]['cin21personalinfo-ACREXPIRATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="CONTACTCELLNUMBER",value="#args[b]['cin21personalinfo-CONTACTCELLNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CONTACTPAGERNO",value="#args[b]['cin21personalinfo-CONTACTPAGERNO']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CONTACTTELNO",value="#args[b]['cin21personalinfo-CONTACTTELNO']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="EMAILADDRESS",value="#args[b]['cin21personalinfo-EMAILADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="HEIGHT",value="#args[b]['cin21personalinfo-HEIGHT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="WEIGHT",value="#args[b]['cin21personalinfo-WEIGHT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LANGUAGEREAD",value="#args[b]['cin21personalinfo-LANGUAGEREAD']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LANGUAGESPOKEN",value="#args[b]['cin21personalinfo-LANGUAGESPOKEN']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LANGUAGEWRITTEN",value="#args[b]['cin21personalinfo-LANGUAGEWRITTEN']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="MAIDENNAME",value="#args[b]['cin21personalinfo-MAIDENNAME']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="NATIONALITY",value="#args[b]['cin21personalinfo-NATIONALITY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="NUMBEROFCHILDREN",value="#args[b]['cin21personalinfo-NUMBEROFCHILDREN']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="OCCUPATIONCOMPANY",value="#args[b]['cin21personalinfo-OCCUPATIONCOMPANY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PASSPORTNUMBER",value="#args[b]['cin21personalinfo-PASSPORTNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PASSPORTDATEISSUED",value="#rereplace(args[b]['cin21personalinfo-PASSPORTDATEISSUED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="PERCELLNUMBER",value="#args[b]['cin21personalinfo-PERCELLNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PERIODOFRESIDENCE",value="#args[b]['cin21personalinfo-PERIODOFRESIDENCE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PERPAGERNUMBER",value="#args[b]['cin21personalinfo-PERPAGERNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PERSONNELIDNO",value="#args[b]['cin21personalinfo-PERSONNELIDNO']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PERSONTOCONTACT",value="#args[b]['cin21personalinfo-PERSONTOCONTACT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PLACEOFISSUANCE",value="#args[b]['cin21personalinfo-PLACEOFISSUANCE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PROVPERIODOFRES",value="#args[b]['cin21personalinfo-PROVPERIODOFRES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PROVTELNUMBER",value="#args[b]['cin21personalinfo-PROVTELNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PROVZIPCODE",value="#args[b]['cin21personalinfo-PROVZIPCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RELATIONSHIP",value="#args[b]['cin21personalinfo-RELATIONSHIP']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RELIGIONCODE",value="#args[b]['cin21personalinfo-RELIGIONCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SPOUSENAME",value="#args[b]['cin21personalinfo-SPOUSENAME']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="STREETBARRIO",value="#args[b]['cin21personalinfo-STREETBARRIO']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="STREETBARRIO2",value="#args[b]['cin21personalinfo-STREETBARRIO2']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="STREETBARRIO3",value="#args[b]['cin21personalinfo-STREETBARRIO3']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TELEPHONENUMBER",value="#args[b]['cin21personalinfo-TELEPHONENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TELEPHONENUMBER2",value="#args[b]['cin21personalinfo-TELEPHONENUMBER2']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TELEPHONENUMBER3",value="#args[b]['cin21personalinfo-TELEPHONENUMBER3']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TOWNLOCALITY",value="#args[b]['cin21personalinfo-TOWNLOCALITY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="ZIPCODE",value="#args[b]['cin21personalinfo-ZIPCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PREVIOUSADDRESS",value="#args[b]['cin21personalinfo-PREVIOUSADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PREVIOUSTELNUMBER",value="#args[b]['cin21personalinfo-PREVIOUSTELNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PREVIOUSZIPCODE",value="#args[b]['cin21personalinfo-PREVIOUSZIPCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PROVINCIALADDRESS",value="#args[b]['cin21personalinfo-PROVINCIALADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="EMAILADDRESS2",value="#args[b]['cin21personalinfo-EMAILADDRESS2']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="EXPIRATIONDATE",value="#rereplace(args[b]['cin21personalinfo-EXPIRATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				
		Usql = 'UPDATE {COMPANYCODE}_cbose.cin21personalinfo
						SET BIRTHDAY = :BIRTHDAY,AGE = :AGE,BIRTHPLACE = :BIRTHPLACE,CITIZENSHIP = :CITIZENSHIP,CITYPROVINCE = :CITYPROVINCE,CIVILSTATUS = :CIVILSTATUS,CONTACTADDRESS = :CONTACTADDRESS,CONTACTADDRESS2 = :CONTACTADDRESS2,CONTACTADDRESS3 = :CONTACTADDRESS3,SEX = :SEX,ACRNUMBER = :ACRNUMBER,ACRDATEISSUED = :ACRDATEISSUED,ACREXPIRATIONDATE = :ACREXPIRATIONDATE,CONTACTCELLNUMBER = :CONTACTCELLNUMBER,CONTACTPAGERNO = :CONTACTPAGERNO,CONTACTTELNO = :CONTACTTELNO,EMAILADDRESS = :EMAILADDRESS,HEIGHT = :HEIGHT,WEIGHT = :WEIGHT,LANGUAGEREAD = :LANGUAGEREAD,LANGUAGESPOKEN = :LANGUAGESPOKEN,LANGUAGEWRITTEN = :LANGUAGEWRITTEN,MAIDENNAME = :MAIDENNAME,NATIONALITY = :NATIONALITY,NUMBEROFCHILDREN = :NUMBEROFCHILDREN,OCCUPATIONCOMPANY = :OCCUPATIONCOMPANY,PASSPORTNUMBER = :PASSPORTNUMBER,PASSPORTDATEISSUED = :PASSPORTDATEISSUED,PERCELLNUMBER = :PERCELLNUMBER,PERIODOFRESIDENCE = :PERIODOFRESIDENCE,PERPAGERNUMBER = :PERPAGERNUMBER,PERSONNELIDNO = :PERSONNELIDNO,PERSONTOCONTACT = :PERSONTOCONTACT,PLACEOFISSUANCE = :PLACEOFISSUANCE,PROVPERIODOFRES = :PROVPERIODOFRES,PROVTELNUMBER = :PROVTELNUMBER,PROVZIPCODE = :PROVZIPCODE,RELATIONSHIP = :RELATIONSHIP,RELIGIONCODE = :RELIGIONCODE,SPOUSENAME = :SPOUSENAME,STREETBARRIO = :STREETBARRIO,STREETBARRIO2 = :STREETBARRIO2,STREETBARRIO3 = :STREETBARRIO3,TELEPHONENUMBER = :TELEPHONENUMBER,TELEPHONENUMBER2 = :TELEPHONENUMBER2,TELEPHONENUMBER3 = :TELEPHONENUMBER3,TOWNLOCALITY = :TOWNLOCALITY,ZIPCODE = :ZIPCODE,PREVIOUSADDRESS = :PREVIOUSADDRESS,PREVIOUSTELNUMBER = :PREVIOUSTELNUMBER,PREVIOUSZIPCODE = :PREVIOUSZIPCODE,PROVINCIALADDRESS = :PROVINCIALADDRESS,EMAILADDRESS2 = :EMAILADDRESS2,EXPIRATIONDATE = :EXPIRATIONDATE
			          WHERE BIRTHDAY = :BIRTHDAY';
		queryService.setDatasource(session.global_dsn);
	  	queryService.setName('qryname');
		queryService.setSQL(Usql);
		var theResultSet = queryService.execute();
	}

	retVal["message"] = args;
	retVal["success"] = true;
	return retVal;
}


public struct function Destroy(required any args) ExtDirect=true {
	var retVal = StructNew();
	if (!isArray(args)) {
		var ar = ArrayNew(1);
		ar[1] = args;
		args = ArrayNew(1);
		args = ar;
	}

	for (b = 1; b <= ArrayLen(args); b++) {
		queryService = new query();
		queryService.addParam(name="BIRTHDAY",value="#rereplace(args[b]['cin21personalinfo-BIRTHDAY'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="AGE",value="#args[b]['cin21personalinfo-AGE']#",cfsqltype="CF_SQL_INTEGER");
		queryService.addParam(name="BIRTHPLACE",value="#args[b]['cin21personalinfo-BIRTHPLACE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CITIZENSHIP",value="#args[b]['cin21personalinfo-CITIZENSHIP']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CITYPROVINCE",value="#args[b]['cin21personalinfo-CITYPROVINCE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CIVILSTATUS",value="#args[b]['cin21personalinfo-CIVILSTATUS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CONTACTADDRESS",value="#args[b]['cin21personalinfo-CONTACTADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CONTACTADDRESS2",value="#args[b]['cin21personalinfo-CONTACTADDRESS2']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CONTACTADDRESS3",value="#args[b]['cin21personalinfo-CONTACTADDRESS3']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="SEX",value="#args[b]['cin21personalinfo-SEX']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ACRNUMBER",value="#args[b]['cin21personalinfo-ACRNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ACRDATEISSUED",value="#rereplace(args[b]['cin21personalinfo-ACRDATEISSUED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="ACREXPIRATIONDATE",value="#rereplace(args[b]['cin21personalinfo-ACREXPIRATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="CONTACTCELLNUMBER",value="#args[b]['cin21personalinfo-CONTACTCELLNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CONTACTPAGERNO",value="#args[b]['cin21personalinfo-CONTACTPAGERNO']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CONTACTTELNO",value="#args[b]['cin21personalinfo-CONTACTTELNO']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="EMAILADDRESS",value="#args[b]['cin21personalinfo-EMAILADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="HEIGHT",value="#args[b]['cin21personalinfo-HEIGHT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="WEIGHT",value="#args[b]['cin21personalinfo-WEIGHT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="LANGUAGEREAD",value="#args[b]['cin21personalinfo-LANGUAGEREAD']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="LANGUAGESPOKEN",value="#args[b]['cin21personalinfo-LANGUAGESPOKEN']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="LANGUAGEWRITTEN",value="#args[b]['cin21personalinfo-LANGUAGEWRITTEN']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="MAIDENNAME",value="#args[b]['cin21personalinfo-MAIDENNAME']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="NATIONALITY",value="#args[b]['cin21personalinfo-NATIONALITY']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="NUMBEROFCHILDREN",value="#args[b]['cin21personalinfo-NUMBEROFCHILDREN']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="OCCUPATIONCOMPANY",value="#args[b]['cin21personalinfo-OCCUPATIONCOMPANY']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PASSPORTNUMBER",value="#args[b]['cin21personalinfo-PASSPORTNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PASSPORTDATEISSUED",value="#rereplace(args[b]['cin21personalinfo-PASSPORTDATEISSUED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="PERCELLNUMBER",value="#args[b]['cin21personalinfo-PERCELLNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PERIODOFRESIDENCE",value="#args[b]['cin21personalinfo-PERIODOFRESIDENCE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PERPAGERNUMBER",value="#args[b]['cin21personalinfo-PERPAGERNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PERSONNELIDNO",value="#args[b]['cin21personalinfo-PERSONNELIDNO']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PERSONTOCONTACT",value="#args[b]['cin21personalinfo-PERSONTOCONTACT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PLACEOFISSUANCE",value="#args[b]['cin21personalinfo-PLACEOFISSUANCE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PROVPERIODOFRES",value="#args[b]['cin21personalinfo-PROVPERIODOFRES']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PROVTELNUMBER",value="#args[b]['cin21personalinfo-PROVTELNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PROVZIPCODE",value="#args[b]['cin21personalinfo-PROVZIPCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RELATIONSHIP",value="#args[b]['cin21personalinfo-RELATIONSHIP']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RELIGIONCODE",value="#args[b]['cin21personalinfo-RELIGIONCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="SPOUSENAME",value="#args[b]['cin21personalinfo-SPOUSENAME']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="STREETBARRIO",value="#args[b]['cin21personalinfo-STREETBARRIO']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="STREETBARRIO2",value="#args[b]['cin21personalinfo-STREETBARRIO2']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="STREETBARRIO3",value="#args[b]['cin21personalinfo-STREETBARRIO3']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="TELEPHONENUMBER",value="#args[b]['cin21personalinfo-TELEPHONENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="TELEPHONENUMBER2",value="#args[b]['cin21personalinfo-TELEPHONENUMBER2']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="TELEPHONENUMBER3",value="#args[b]['cin21personalinfo-TELEPHONENUMBER3']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="TOWNLOCALITY",value="#args[b]['cin21personalinfo-TOWNLOCALITY']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ZIPCODE",value="#args[b]['cin21personalinfo-ZIPCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PREVIOUSADDRESS",value="#args[b]['cin21personalinfo-PREVIOUSADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PREVIOUSTELNUMBER",value="#args[b]['cin21personalinfo-PREVIOUSTELNUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PREVIOUSZIPCODE",value="#args[b]['cin21personalinfo-PREVIOUSZIPCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PROVINCIALADDRESS",value="#args[b]['cin21personalinfo-PROVINCIALADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="EMAILADDRESS2",value="#args[b]['cin21personalinfo-EMAILADDRESS2']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="EXPIRATIONDATE",value="#rereplace(args[b]['cin21personalinfo-EXPIRATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			
		Usql = 'DELETE FROM {COMPANYCODE}_cbose.cin21personalinfo
					  WHERE BIRTHDAY = :BIRTHDAY AND AGE = :AGE AND BIRTHPLACE = :BIRTHPLACE AND CITIZENSHIP = :CITIZENSHIP AND CITYPROVINCE = :CITYPROVINCE AND CIVILSTATUS = :CIVILSTATUS AND CONTACTADDRESS = :CONTACTADDRESS AND CONTACTADDRESS2 = :CONTACTADDRESS2 AND CONTACTADDRESS3 = :CONTACTADDRESS3 AND SEX = :SEX AND ACRNUMBER = :ACRNUMBER AND ACRDATEISSUED = :ACRDATEISSUED AND ACREXPIRATIONDATE = :ACREXPIRATIONDATE AND CONTACTCELLNUMBER = :CONTACTCELLNUMBER AND CONTACTPAGERNO = :CONTACTPAGERNO AND CONTACTTELNO = :CONTACTTELNO AND EMAILADDRESS = :EMAILADDRESS AND HEIGHT = :HEIGHT AND WEIGHT = :WEIGHT AND LANGUAGEREAD = :LANGUAGEREAD AND LANGUAGESPOKEN = :LANGUAGESPOKEN AND LANGUAGEWRITTEN = :LANGUAGEWRITTEN AND MAIDENNAME = :MAIDENNAME AND NATIONALITY = :NATIONALITY AND NUMBEROFCHILDREN = :NUMBEROFCHILDREN AND OCCUPATIONCOMPANY = :OCCUPATIONCOMPANY AND PASSPORTNUMBER = :PASSPORTNUMBER AND PASSPORTDATEISSUED = :PASSPORTDATEISSUED AND PERCELLNUMBER = :PERCELLNUMBER AND PERIODOFRESIDENCE = :PERIODOFRESIDENCE AND PERPAGERNUMBER = :PERPAGERNUMBER AND PERSONNELIDNO = :PERSONNELIDNO AND PERSONTOCONTACT = :PERSONTOCONTACT AND PLACEOFISSUANCE = :PLACEOFISSUANCE AND PROVPERIODOFRES = :PROVPERIODOFRES AND PROVTELNUMBER = :PROVTELNUMBER AND PROVZIPCODE = :PROVZIPCODE AND RELATIONSHIP = :RELATIONSHIP AND RELIGIONCODE = :RELIGIONCODE AND SPOUSENAME = :SPOUSENAME AND STREETBARRIO = :STREETBARRIO AND STREETBARRIO2 = :STREETBARRIO2 AND STREETBARRIO3 = :STREETBARRIO3 AND TELEPHONENUMBER = :TELEPHONENUMBER AND TELEPHONENUMBER2 = :TELEPHONENUMBER2 AND TELEPHONENUMBER3 = :TELEPHONENUMBER3 AND TOWNLOCALITY = :TOWNLOCALITY AND ZIPCODE = :ZIPCODE AND PREVIOUSADDRESS = :PREVIOUSADDRESS AND PREVIOUSTELNUMBER = :PREVIOUSTELNUMBER AND PREVIOUSZIPCODE = :PREVIOUSZIPCODE AND PROVINCIALADDRESS = :PROVINCIALADDRESS AND EMAILADDRESS2 = :EMAILADDRESS2 AND EXPIRATIONDATE = :EXPIRATIONDATE';
		queryService.setDatasource(session.global_dsn);
	  	queryService.setName('qryname');
		queryService.setSQL(Usql);
		var theResultSet = queryService.execute();
	}

	retVal["message"] = args;
	retVal["success"] = true;
	return retVal;
}


public struct function getUserToolbars(required string querycode) ExtDirect=true {
	var dockitems = StructNew();
	try {
		dockitems["xtype"] = "toolbar";
	   	dockitems["dock"] = "top";
	   	var itemArray = ArrayNew(1);
		var qryres = ORMExecuteQuery("SELECT SHOWPRINT,
											 SHOWVIEW,
											 SHOWADD,
											 SHOWEDIT,
											 SHOWCOPY,
											 SHOWDELETE,
											 SHOWEXPORT,
											 SHOWEMAIL
										FROM EGRTQUERY
										WHERE EQRYCODE = '#trim(querycode)#' AND userid = '#session.userid#'", false);
		actionlist = "Print,View,Add,Edit,Copy,Delete,Export,Email";
		actionlistimg = "print-icon,view-icon,add-icon,edit-icon,copy-icon,delete-icon,export-icon,email-icon";
		if (ArrayLen(qryres) > 0) { /* if assigned to a user */
			for (b = 1; b <= ListLen(actionlist); b++) {
				if (qryres[1][b] == true) {
					var xtypeS = StructNew();
				   	xtypeS["xtype"] = "button";
				   	xtypeS["action"] = "#ListGetAt(actionlist,b,',')#";
				   	xtypeS["tooltip"] = "#ListGetAt(actionlist,b,',')#";
				   	xtypeS["iconCls"] = "#ListGetAt(actionlistimg,b,',')#";
				   	ArrayAppend(itemArray, xtypeS);
				}
			}
			if (ArrayLen(itemArray) == 0) itemArray = setItemArrayWithGroup(itemArray, querycode);
		} else { /* if assigned to a group*/
			itemArray = setItemArrayWithGroup(itemArray, querycode);
		}

		if (ArrayLen(itemArray) > 0) {
			dockitems["items"] = itemArray;
			dockitems["success"] = true;
		} else {
			dockitems["false"] = true;
			dockitems["message"] = "No tools assigned to this user.";
		}

	return dockitems;

	} catch (Any e) {
		dockitems["false"] = true;
		dockitems["message"] = e.message & " ," & e.detail;
	}
}

private array function setItemArrayWithGroup(itemArray,querycode) {
	var qryresg = ORMExecuteQuery("SELECT SHOWPRINT,
										 SHOWVIEW,
										 SHOWADD,
										 SHOWEDIT,
										 SHOWCOPY,
										 SHOWDELETE,
										 SHOWEXPORT,
										 SHOWEMAIL
									FROM EGRTQUERYGROUP
								   WHERE EQRYCODE = '#trim(querycode)#'
										 AND USERGRPID IN (SELECT USERGRPIDFK FROM EGRGROLEINDEX
														    WHERE USERGRPMEMBERSIDX = '#session.userid#')", false);
		if (ArrayLen(qryresg) > 0) {
			for (b = 1; b <= ListLen(actionlist); b++) {
				if (qryresg[1][b] == true) {
					var xtypeS = StructNew();
				   	xtypeS["xtype"] = "button";
				   	xtypeS["action"] = "#ListGetAt(actionlist,b,',')#";
				   	xtypeS["tooltip"] = "#ListGetAt(actionlist,b,',')#";
				   	xtypeS["iconCls"] = "#ListGetAt(actionlistimg,b,',')#";
				   	ArrayAppend(itemArray, xtypeS);
				}
			}
		}
	return itemArray;
}

remote struct function exportGridToExcel(required String querycode, required String querytitle) ExtDirect=true {
	var retVal = StructNew();
	var qrydef = CreateObject("component", "myapps.query.definition.QueryDefinition");
	Usql = "SELECT cin21personalinfo.BIRTHDAY AS 'Birthday', cin21personalinfo.AGE AS 'Age', cin21personalinfo.BIRTHPLACE AS 'Birthplace', cin21personalinfo.CITIZENSHIP AS 'Citizenship', cin21personalinfo.CITYPROVINCE AS 'City or Province', cin21personalinfo.CIVILSTATUS AS 'Civil Status', cin21personalinfo.CONTACTADDRESS AS 'Contact Address', cin21personalinfo.CONTACTADDRESS2 AS 'Contact Address 2', cin21personalinfo.CONTACTADDRESS3 AS 'Contact Address 3', cin21personalinfo.SEX AS 'Gender', cin21personalinfo.ACRNUMBER AS 'ACR Number', cin21personalinfo.ACRDATEISSUED AS 'ACR Date Issued', cin21personalinfo.ACREXPIRATIONDATE AS 'ACR Expiration Date', cin21personalinfo.CONTACTCELLNUMBER AS 'Mobile Number', cin21personalinfo.CONTACTPAGERNO AS 'Contact Pager No', cin21personalinfo.CONTACTTELNO AS 'Telephone Number', cin21personalinfo.EMAILADDRESS AS 'Email Address', cin21personalinfo.HEIGHT AS 'Height', cin21personalinfo.WEIGHT AS 'Weight', cin21personalinfo.LANGUAGEREAD AS 'Language Read', cin21personalinfo.LANGUAGESPOKEN AS 'Language Spoken', cin21personalinfo.LANGUAGEWRITTEN AS 'Language Written', cin21personalinfo.MAIDENNAME AS 'Maiden Name', cin21personalinfo.NATIONALITY AS 'Nationality', cin21personalinfo.NUMBEROFCHILDREN AS 'Number of Children', cin21personalinfo.OCCUPATIONCOMPANY AS 'Occupation or Company', cin21personalinfo.PASSPORTNUMBER AS 'Passport Number', cin21personalinfo.PASSPORTDATEISSUED AS 'Passport Date Issued', cin21personalinfo.PERCELLNUMBER AS 'Per Cell Number', cin21personalinfo.PERIODOFRESIDENCE AS 'Period of Residence', cin21personalinfo.PERPAGERNUMBER AS 'Per Pager No', cin21personalinfo.PERSONNELIDNO AS 'Personnel ID No', cin21personalinfo.PERSONTOCONTACT AS 'Person to Contact', cin21personalinfo.PLACEOFISSUANCE AS 'Place of Issuance', cin21personalinfo.PROVPERIODOFRES AS 'Province Period of Residence', cin21personalinfo.PROVTELNUMBER AS 'Provincial Tel No', cin21personalinfo.PROVZIPCODE AS 'Prov Zip Code', cin21personalinfo.RELATIONSHIP AS 'Relationship', cin21personalinfo.RELIGIONCODE AS 'Religion Code', cin21personalinfo.SPOUSENAME AS 'Spouse Name', cin21personalinfo.STREETBARRIO AS 'Street or Barrio', cin21personalinfo.STREETBARRIO2 AS 'Street or Barrio 2', cin21personalinfo.STREETBARRIO3 AS 'Street or Barrio 3', cin21personalinfo.TELEPHONENUMBER AS 'Tel Number 1', cin21personalinfo.TELEPHONENUMBER2 AS 'Tel Number 2', cin21personalinfo.TELEPHONENUMBER3 AS 'Tel Number 3', cin21personalinfo.TOWNLOCALITY AS 'Town Locality', cin21personalinfo.ZIPCODE AS 'Zip Code', cin21personalinfo.PREVIOUSADDRESS AS 'Previous Address', cin21personalinfo.PREVIOUSTELNUMBER AS 'Previous Tel No', cin21personalinfo.PREVIOUSZIPCODE AS 'Previous Zip Code', cin21personalinfo.PROVINCIALADDRESS AS 'Provincial Address', cin21personalinfo.EMAILADDRESS2 AS 'Alternative Email', cin21personalinfo.EXPIRATIONDATE AS 'Expiration Date'
			 FROM #session.companycode#_cbose.cin21personalinfo cin21personalinfo
			 WHERE  cin21personalinfo.PERSONNELIDNO = '#session.chapa#'
			 
			 
			 ";
	var res = qrydef.exportQueryToExcel(querytitle,Usql.trim());
	retVal["result"] = res;
	return retVal;
}

remote struct function emailSelGridQuery(required String fromvalue,
										 required String tovalue,
										 required String subjectvalue,
										 required String bodyvalue) ExtDirect=true {
	var retVal = StructNew();
	retVal["success"] = true;
	try {
		var dmailObj = CreateObject("component", "mail");
		if (trim(session.ms) != "") {
			dmailObj.setServer(Decrypt(session.ms,"mailmng"));
			dmailObj.setUsername(Decrypt(session.mu,"mailmng"));
			dmailObj.setPassword(Decrypt(session.mp,"mailmng"));
		}
		if (trim(session.mt) != "") dmailObj.setTimeout(session.mt);
		if (trim(session.mpt) != "") dmailObj.setPort(session.mpt);
		if (trim(session.mtls) != "") dmailObj.setUseTLS(session.mtls);
		if (trim(session.mssl) != "") dmailObj.setUseSSL(session.mssl);
		dmailObj.setFrom(fromvalue);
		dmailObj.setTo(tovalue);
		dmailObj.setSubject(subjectvalue);
		dmailObj.setType("html");
		dmailObj.setBody(bodyvalue);
		dmailObj.send();
	} catch (Any e) {
		retVal["success"] = false;
		retVal["message"] = e.message & " - " & e.detail;
	}

	return retVal;
}

}