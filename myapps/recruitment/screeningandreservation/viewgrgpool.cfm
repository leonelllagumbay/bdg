<cfset thelist = trim(url.refnum) />
<cfset count = ListLen(thelist, "~", "no")>

<!---Initialize variables here--->

<cfset FIRSTNAME         			= "">
<cfset MIDDLENAME        			= "">
<cfset LASTNAME          			= "">
<cfset PAGIBIGNUMBER     			= "">
<cfset SSSNUMBER         			= "">
<cfset TINNUMBER         			= "">
<cfset LANDLINENUMBER    			= "">
<cfset COMPANYCODE       			= "">
<cfset CELLPHONENUMBER   			= "">
<cfset EMAILADDRESS      			= "">
<cfset REFERENCECODE     			= "">
<cfset REFERENCECODE     			= "">
<cfset SUFFIX            = "">
<cfset LASTNAME          = "">
<cfset FIRSTNAME         = "">
<cfset MIDDLENAME        = "">
<cfset DATEOFAPPLICATION = "">
<cfset POSITIONFIRSTPRIORITY = "">
<cfset SOURCEEMPLOYMENT  = "">
<cfset SOURCEOTHERVALUE  = "">
<cfset SOURCEJOBFAIRWHERE= "">
<cfset SOURCEJOBFAIRDATE = "">
<cfset SOURCEREFERREDBY  = "">
<cfset PAGIBIGNUMBER     = "">
<cfset SSSNUMBER         = "">
<cfset EXPECTEDSALARY    = 0>
<cfset TINNUMBER         = "">
<cfset EMAILADDRESS      = "">
<cfset CURRENTSALARY     = 0>
<cfset PRESENTADDRESSPOSTAL = "">
<cfset PROVINCIALADDRESSPOSTAL = "">
<cfset DATEOFBIRTH       = "_">
<cfset PLACEOFBIRTH      = "">
<cfset AGE               = 0>
<cfset GENDER  			 = "">
<cfset CIVILSTATUS       = "">
<cfset CITIZENSHIP       = "">
<cfset RELIGION          = "">
<cfset CELLPHONENUMBER   = "">
<cfset LANDLINENUMBER    = "">
<cfset EMAILADDRESS      = "">
<cfset HEIGHT            = "">
<cfset WEIGHT            = "">
<cfset LANGUAGESPOKEN    = "">
<cfset INCASEEMERNAME    = "">
<cfset INCASEEMERRELATION= "">
<cfset INCASEEMERTELNUM  = "">
<cfset INCASEEMERCELLNUM = "">
<cfset PRESENTADDRESSOWN = "">
<cfset PROVINCEADDRESSOWN= "">
<cfset POSITIONFIRSTPRIORITY   = "">
<cfset POSITIONSECONDPRIORITY  = "">
<cfset POSITIONTHIRDPRIORITY   = "">
<cfset COMPANYFIRSTPRIORITY    = "">
<cfset COMPANYSECONDPRIORITY   = "">
<cfset COMPANYTHIRDPRIORITY    = "">
<cfset FATHERFULLNAME       = "">
<cfset FATHERAGE            = 0>
<cfset FATHEROCCUPATION     = "">
<cfset FATHERCOMPANY        = "">
<cfset FATHERCONTACTNO      = "">

<cfset MOTHERFULLNAME       = "">
<cfset MOTHERAGE            = 0>
<cfset MOTHEROCCUPATION     = "">
<cfset MOTHERCOMPANY        = "">
<cfset MOTHERCONTACTNO      = "">

<cfset SPOUSEFULLNAME       = "">
<cfset SPOUSEAGE            = 0>
<cfset SPOUSEOCCUPATION     = "">
<cfset SPOUSECOMPANY        = "">
<cfset SPOUSECONTACTNO      = "">

<cfset POSTGRADSCHOOL     = "">
<cfset COLLEGESCHOOL      = "">
<cfset VOCATIONALSCHOOL   = "">
<cfset SECONDARYSCHOOL    = "">

<cfset POSTGRADCOURSE     = "">
<cfset COLLEGECOURSE      = "">
<cfset VOCATIONALCOURSE   = "">
<cfset SECONDARYCOURSE    = "">

<cfset POSTGRADFROM       = "">
<cfset COLLEGEFROM        = "">
<cfset VOCATIONALFROM     = "">
<cfset SECONDARYFROM      = "">

<cfset POSTGRADTO         = "">
<cfset COLLEGETO          = "">
<cfset VOCATIONALTO       = "">
<cfset SECONDARYTO        = "">

<cfset POSTGRADISGRAD     = "">
<cfset COLLEGEISGRAD      = "">
<cfset VOCATIONALISGRAD   = "">
<cfset SECONDARYISGRAD    = "">

<cfset POSTGRADHONORS     = "">
<cfset COLLEGEHONORS      = "">
<cfset VOCATIONALHONORS   = "">
<cfset SECONDARYHONORS    = "">

<cfset BLOODTYPE                 = "">
<cfset FIRSTSEMINARTOPIC         = "">
<cfset FIRSTSEMINARDATE          = "">
<cfset FIRSTSEMINARORGANIZER     = "">

<cfset FIRSTEMPHISTORYNAME          = "">
<cfset FIRSTEMPHISTORYADDRESS       = "">

<cfset FIRSTEMPHISTORYPOSITION      = "">
<cfset FIRSTEMPHISTORYCONTACTNO     = "">

<cfset FIRSTEMPHISTORYDATEEMP       = "">
<cfset FIRSTEMPHISTORYDATESEP       = "">
<cfset FIRSTEMPHISTORYINISALARY     = "0">
<cfset FIRSTEMPHISTORYLASTSALARY    = "0">
<cfset FIRSTEMPHISTORYLASTPOS       = "">
<cfset FIRSTEMPHISTORYSUPERIOR      = "">
<cfset FIRSTEMPHISTORYLEAVEREASONS  = "">

<cfset FIRSTEMPHISTORYCOMPANYCONTACT  = '' />
<cfset FIRSTEMPHISTORYACCOMPLISHMENT  = '' />

<cfset RELWORKINNAMEONE           = "">
<cfset RELWORKINCOMPONE           = "">
<cfset RELWORKINAFINITYONE        = "">

<cfset RELWORKINNAMETWO           = "">
<cfset RELWORKINCOMPTWO           = "">
<cfset RELWORKINAFINITYTWO        = "">

<cfset RELWORKINNAMETHREE           = "">
<cfset RELWORKINCOMPTHREE           = "">
<cfset RELWORKINAFINITYTHREE        = "">


<cfset SPECIALSKILLSONE           = "">
<cfset SPECIALSKILLSLEVELONE      = "">

<cfset REFERENCENAME1 = "">
<cfset REFERENCENAME2 = "">
<cfset REFERENCENAME3 = "">

<cfset REFERENCEOCCUPATION1 = "">
<cfset REFERENCEOCCUPATION2 = "">
<cfset REFERENCEOCCUPATION3 = "">

<cfset REFERENCECOMPANY1 = "">
<cfset REFERENCECOMPANY2 = "">
<cfset REFERENCECOMPANY3 = "">

<cfset REFERENCECONTACT1 = "">
<cfset REFERENCECONTACT2 = "">
<cfset REFERENCECONTACT3 = "">

<cfset HASOPILLNESS       			 = "">
<cfset HASOPILLNESSNATURE      		 = "">

<cfset HASDRUGSENSITIVE      		 = "">
<cfset HASDRUGSENSITIVENATURE      	 = "">

<cfset HASENGAGEDRUGS      			 = "">
<cfset HASENGAGEDRUGSNATURE      	 = "">

<cfset HASINVOLVEBUSI      			 = "">
<cfset HASINVOLVEBUSINATURE      	 = "">

<cfset HASSUSPENDED     		     = "">
<cfset HASSUSPENDEDNATURE      		 = "">

<cfset HASCRIMINAL      			 = "">
<cfset HASCRIMINALNATURE      	     = "">

<cfset PHOTOIDNAME      	     = "">

<cfset PHILHEALTHNUMBER      	     = "">

<cfset PREVEMPLOYED = ''>
<cfset PREVAPPLIED = ''>
<cfset DATEAVAILEMP = ''>

<cfset PREVEMPLOYEDFROM = ''>
<cfset PREVEMPLOYEDTO = ''>
<cfset PREVAPPLIEDLAST = ''>

<cfset ACRNUMBER = ''>
<cfset FATHERBIRTHDAY      = ''>
<cfset FATHERLIVINGORDEAD     = ''>
<cfset MOTHERBIRTHDAY      = ''>
<cfset MOTHERLIVINGORDEAD     = ''>
<cfset SPOUSEBIRTHDAY      = ''>
<cfset SPOUSELIVINGORDEAD     = ''>
<cfset POSTGRADLOCATION     = ''>
<cfset COLLEGELOCATION     = ''>
<cfset VOCATIONALLOCATION     = ''>
<cfset SECONDARYLOCATION     = ''>

<cfset TYPEOFEXAM = '' />
<cfset DATETAKENPASSED = '' />
<cfset RATING = '' />
<cfset LICENSENUMBER = '' />
<cfset HIGHESTPOSITION = '' />
<cfset PERIODCOVERED = '' />
<cfset ORGANIZATION = '' />

<!---End initialization--->

<cfdocument
    format = "PDF"
    name = "#session.userid#"
    orientation = "portrait"
    overwrite = "yes"
    pageType = "letter"
	filename = "#session.userid#.pdf"
    >


<cfloop index="countme" from="1" to="#count#">

	<cfset refcode = ListGetAt(thelist, countme, "~", "no")>

	<cfquery name="qryEGMFAP" datasource="#session.global_dsn#" maxrows="1">
			   SELECT   GUID,
	                    APPLICANTNUMBER,
	                    SUFFIX,
	                    LASTNAME,
	                    FIRSTNAME,
	                    MIDDLENAME,
	                    APPLICATIONDATE,
	                    PAGIBIGNUMBER,
	                    REFERREDBY,
	                    SSSNUMBER,
	                    STARTINGSALARY,
	                    TIN,
	                    EMAILADD,
	                    POSITIONCODE,
	                    SOURCE,
	                    RESERVED,
	                    WORKEXPRATING
				 FROM   EGMFAP
				WHERE   REFERENCECODE = '#refcode#';
	</cfquery>

	<cfquery name="getpositiondesc" datasource="#session.company_dsn#" maxrows="1">

	    SELECT DESCRIPTION
	      FROM CLKPOSITION
	     WHERE POSITIONCODE = '#qryEGMFAP.POSITIONCODE#'
	    ;

	</cfquery>

	<cfset POSITIONFIRSTPRIORITY = '#getpositiondesc.DESCRIPTION#'>

	<cfloop query="qryEGMFAP">
			<cfset SUFFIX                = '#SUFFIX#'>
	        <cfset LASTNAME              = '#LASTNAME#'>
	        <cfset FIRSTNAME             = '#FIRSTNAME#'>
	        <cfset MIDDLENAME            = '#MIDDLENAME#'>
	        <cfset DATEOFAPPLICATION     = '#APPLICATIONDATE#'>
	        <cfset PAGIBIGNUMBER         = '#PAGIBIGNUMBER#'>
	        <cfset SOURCEREFERREDBY      = '#REFERREDBY#'>
	        <cfset SSSNUMBER             = '#SSSNUMBER#'>
	        <cfset EXPECTEDSALARY        = '#EXPECTEDSALARY#'>
	        <cfset TINNUMBER             = '#TIN#'>
	        <cfset EMAILADDRESS          = '#EMAILADD#'>
	        <cfset POSITIONFIRSTPRIORITY = '#POSITIONFIRSTPRIORITY#'>
	        <cfset SOURCEEMPLOYMENT      = '#SOURCE#'>
	        <cfset CURRENTSALARY         = '#WORKEXPRATING#'>
	        <cfset SOURCEOTHERVALUE      = '#SOURCE#'>
	        <cfset SOURCEJOBFAIRWHERE    = ''>
	        <cfset SOURCEJOBFAIRDATE     = ''>
	</cfloop>

	<cfquery name="qryEGIN21PERSONALINFO" datasource="#session.global_dsn#" maxrows="1">
			   SELECT   GUID,
	                    PERSONNELIDNO,
	                    CONTACTADDRESS,
	                    PROVINCIALADDRESS,
	                    BIRTHDAY,
	                    BIRTHPLACE,
	                    AGE,
	                    SEX,
	                    CIVILSTATUS,
	                    CITIZENSHIP,
	                    RELIGIONCODE,
	                    CONTACTCELLNUMBER,
	                    CONTACTTELNO,
	                    EMAILADDRESS,
	                    HEIGHT,
	                    WEIGHT,
	                    ACRNUMBER,
	                    LANGUAGESPOKEN,
	                    PERSONTOCONTACT,
	                    RELATIONSHIP,
	                    TELEPHONENUMBER,
	                    PERCELLNUMBER,
	                    PREVIOUSADDRESS,
	                    PROVPERIODOFRES,
	                    LANGUAGEWRITTEN,
	                    CONTACTADDRESS2,
	                    CONTACTADDRESS3,
	                    ACREXPIRATIONDATE
				 FROM   EGIN21PERSONALINFO
				WHERE   REFERENCECODE = '#refcode#';
	</cfquery>

	<cfquery name="religiontodesc" datasource="#session.global_dsn#" maxrows="1">
	    SELECT DESCRIPTION
	      FROM GLKRELIGION
	     WHERE RELIGIONCODE = '#qryEGIN21PERSONALINFO.RELIGIONCODE#';
	</cfquery>

	<cfset RELIGIONDESC = religiontodesc.DESCRIPTION >

	<cfloop query="qryEGIN21PERSONALINFO">
			<cfset PRESENTADDRESSPOSTAL    = '#CONTACTADDRESS#'>
	        <cfset PROVINCIALADDRESSPOSTAL 	= '#PROVINCIALADDRESS#'>
	        <cfset DATEOFBIRTH             	= '#BIRTHDAY#'>
	        <cfset PLACEOFBIRTH            	= '#BIRTHPLACE#'>
	        <cfset AGE                     	= '#AGE#'>
	        <cfset GENDER                  	= '#SEX#'>
	        <cfset CIVILSTATUS 			   	= '#CIVILSTATUS#'>
	        <cfset CITIZENSHIP    		   	= '#CITIZENSHIP#'>
	        <cfset RELIGION     		   	= '#RELIGIONDESC#'>
	        <cfset CELLPHONENUMBER 		   	= '#CONTACTCELLNUMBER#'>
	        <cfset LANDLINENUMBER 		   	= '#CONTACTTELNO#'>
	        <cfset EMAILADDRESS     	   	= '#EMAILADDRESS#'>
	        <cfset HEIGHT     			   	= '#HEIGHT#'>
	        <cfset WEIGHT     			   	= '#WEIGHT#'>
	        <cfset LANGUAGESPOKEN     	   	= '#LANGUAGESPOKEN#'>
	        <cfset INCASEEMERNAME 		   	= '#PERSONTOCONTACT#'>
	        <cfset INCASEEMERRELATION 	   	= '#RELATIONSHIP#'>
	        <cfset INCASEEMERTELNUM        	= '#TELEPHONENUMBER#'>
	        <cfset INCASEEMERCELLNUM 	   	= '#PERCELLNUMBER#'>
	        <cfset PRESENTADDRESSOWN 	   	= '#PREVIOUSADDRESS#'>
	        <cfset PROVINCEADDRESSOWN 	   	= '#PROVPERIODOFRES#'>
			<cfset PHOTOIDNAME 	           	= '#LANGUAGEWRITTEN#'>
	        <cfset PREVEMPLOYED 			= '#CONTACTADDRESS2#'>
			<cfset PREVAPPLIED 				= '#CONTACTADDRESS3#'>
	        <cfset DATEAVAILEMP 			= '#ACREXPIRATIONDATE#'>
	</cfloop>

	<cfset POSITIONFIRSTPRIORITY   = '_'>
	<cfset POSITIONSECONDPRIORITY   = '_'>
	<cfset POSITIONTHIRDPRIORITY   = '_'>
	<cfset COMPANYFIRSTPRIORITY = '_'>
	<cfset COMPANYSECONDPRIORITY   = '_'>
	<cfset COMPANYTHIRDPRIORITY   = '_'>

	<cfquery name="qryEGIN21POSITNAPLD1" datasource="#session.global_dsn#" maxrows="1">
	   SELECT POSITIONCODE,COMPANYCODE,PRIORITY
		 FROM EGIN21POSITNAPLD
		WHERE REFERENCECODE = '#refcode#' AND PRIORITY = 1;
	</cfquery>

	<cfloop query="qryEGIN21POSITNAPLD1">
		<cfquery name="getpositiondes1" datasource="#COMPANYCODE#_CBOSE" maxrows="1">
	        SELECT DESCRIPTION
	          FROM CLKPOSITION
	         WHERE POSITIONCODE = '#POSITIONCODE#';
	    </cfquery>
	    <cfif getpositiondes1.recordcount gt 0 >
			<cfset POSITIONFIRSTPRIORITY   = '#getpositiondes1.DESCRIPTION#'>
		</cfif>

	    <cfquery name="getcompanydes1" datasource="#session.global_dsn#" maxrows="1">
	        SELECT DESCRIPTION,COMPANYCODE
	          FROM GLKCOMPANY
	         WHERE COMPANYCODE = '#COMPANYCODE#';
	    </cfquery>
	    <cfif getcompanydes1.recordcount gt 0 >
			<cfset COMPANYFIRSTPRIORITY = '#getcompanydes1.DESCRIPTION#'>
		</cfif>
	</cfloop>

	<cfquery name="qryEGIN21POSITNAPLD2" datasource="#session.global_dsn#" maxrows="1">
	   SELECT   POSITIONCODE,COMPANYCODE,PRIORITY
		 FROM   EGIN21POSITNAPLD
		WHERE   REFERENCECODE = '#refcode#' AND PRIORITY = 2;
	</cfquery>

	<cfloop query="qryEGIN21POSITNAPLD2">
		<cfquery name="getpositiondes2" datasource="#COMPANYCODE#_CBOSE" maxrows="1">
	        SELECT DESCRIPTION
	          FROM CLKPOSITION
	         WHERE POSITIONCODE = '#POSITIONCODE#';
	    </cfquery>
	    <cfif getpositiondes2.recordcount gt 0 >
			<cfset POSITIONSECONDPRIORITY   = '#getpositiondes2.DESCRIPTION#'>
		</cfif>

	    <cfquery name="getcompanydes2" datasource="#session.global_dsn#" maxrows="1">
	        SELECT DESCRIPTION  FROM GLKCOMPANY
	         WHERE  COMPANYCODE = '#COMPANYCODE#';
	    </cfquery>
	    <cfif getcompanydes2.recordcount gt 0 >
			<cfset COMPANYSECONDPRIORITY   = '#getcompanydes2.DESCRIPTION#'>
		</cfif>
	</cfloop>

	<cfquery name="qryEGIN21POSITNAPLD3" datasource="#session.global_dsn#" maxrows="1">
	   SELECT POSITIONCODE,COMPANYCODE
		 FROM EGIN21POSITNAPLD
		WHERE REFERENCECODE = '#refcode#' AND PRIORITY = 3;
	</cfquery>

	<cfloop query="qryEGIN21POSITNAPLD3">
		<cfquery name="getpositiondes3" datasource="#COMPANYCODE#_CBOSE" maxrows="1">
	        SELECT DESCRIPTION
	          FROM CLKPOSITION
	         WHERE POSITIONCODE = '#POSITIONCODE#';
	    </cfquery>
	    <cfif getpositiondes3.recordcount gt 0 >
			<cfset POSITIONTHIRDPRIORITY   = '#getpositiondes3.DESCRIPTION#'>
		</cfif>

	    <cfquery name="getcompanydes3" datasource="#session.global_dsn#" maxrows="1">
	        SELECT DESCRIPTION  FROM GLKCOMPANY
	         WHERE  COMPANYCODE = '#COMPANYCODE#';
	    </cfquery>
	    <cfif getcompanydes3.recordcount gt 0 >
			<cfset COMPANYTHIRDPRIORITY   = '#getcompanydes3.DESCRIPTION#'>
		</cfif>
	</cfloop>

<cfquery name="qryEGIN21FAMILYBKGRNDF" datasource="#session.global_dsn#" maxrows="1">
		   SELECT GUID,
                    PERSONNELIDNO,
                    NAME,
                    AGE,
                    COMPANY,
                    OCCUPATION,
                    RELATIONSHIP,
                    TELEPHONENUMBER,
					BIRTHDAY,
					LIVINGORDEAD
			 FROM   EGIN21FAMILYBKGRND
			WHERE   REFERENCECODE = '#refcode#' AND RELATIONSHIP LIKE '%FATHER%';
</cfquery>

<cfloop query="qryEGIN21FAMILYBKGRNDF">

	<cfset FATHERFULLNAME       = '#NAME#'>
    <cfset FATHERAGE            = '#AGE#'>
    <cfset FATHEROCCUPATION     = '#OCCUPATION#'>
    <cfset FATHERCOMPANY        = '#COMPANY#'>
    <cfset FATHERCONTACTNO      = '#TELEPHONENUMBER#'>
	<cfset FATHERBIRTHDAY      = '#BIRTHDAY#'>
	<cfset FATHERLIVINGORDEAD     = '#LIVINGORDEAD#'>

</cfloop>

<cfquery name="qryEGIN21FAMILYBKGRNDM" datasource="#session.global_dsn#" maxrows="1">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    NAME,
                    AGE,
                    COMPANY,
                    OCCUPATION,
                    RELATIONSHIP,
                    TELEPHONENUMBER,
					BIRTHDAY,
					LIVINGORDEAD
			 FROM   EGIN21FAMILYBKGRND
			WHERE REFERENCECODE = '#refcode#' AND RELATIONSHIP LIKE '%MOTHER%';
</cfquery>

<cfloop query="qryEGIN21FAMILYBKGRNDM">

	<cfset MOTHERFULLNAME       = '#NAME#'>
    <cfset MOTHERAGE            = '#AGE#'>
    <cfset MOTHEROCCUPATION     = '#OCCUPATION#'>
    <cfset MOTHERCOMPANY        = '#COMPANY#'>
    <cfset MOTHERCONTACTNO      = '#TELEPHONENUMBER#'>
	<cfset MOTHERBIRTHDAY      = '#BIRTHDAY#'>
	<cfset MOTHERLIVINGORDEAD     = '#LIVINGORDEAD#'>

</cfloop>

<cfquery name="qryEGIN21FAMILYBKGRNDS" datasource="#session.global_dsn#" maxrows="1">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    NAME,
                    AGE,
                    COMPANY,
                    OCCUPATION,
                    RELATIONSHIP,
                    TELEPHONENUMBER,
					BIRTHDAY,
					LIVINGORDEAD
			 FROM   EGIN21FAMILYBKGRND
			WHERE REFERENCECODE = '#refcode#' AND RELATIONSHIP LIKE '%SPOUSE%';
</cfquery>

<cfloop query="qryEGIN21FAMILYBKGRNDS">

	<cfset SPOUSEFULLNAME       = '#NAME#'>
    <cfset SPOUSEAGE            = '#AGE#'>
    <cfset SPOUSEOCCUPATION     = '#OCCUPATION#'>
    <cfset SPOUSECOMPANY        = '#COMPANY#'>
    <cfset SPOUSECONTACTNO      = '#TELEPHONENUMBER#'>
	<cfset SPOUSEBIRTHDAY      = '#BIRTHDAY#'>
	<cfset SPOUSELIVINGORDEAD     = '#LIVINGORDEAD#'>

</cfloop>


<cfquery name="qryEGIN21FAMILYBKGRNDCHILDREN" datasource="#session.global_dsn#">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    NAME,
                    AGE,
                    COMPANY,
                    OCCUPATION,
                    RELATIONSHIP,
                    TELEPHONENUMBER,
					BIRTHDAY,
					LIVINGORDEAD
			 FROM   EGIN21FAMILYBKGRND
			WHERE REFERENCECODE = '#refcode#' AND RELATIONSHIP LIKE '%SON%';
</cfquery>

<cfquery name="qryEGIN21FAMILYBKGRNDSIBLING" datasource="#session.global_dsn#">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    NAME,
                    AGE,
                    COMPANY,
                    OCCUPATION,
                    RELATIONSHIP,
                    TELEPHONENUMBER,
					BIRTHDAY,
					LIVINGORDEAD
			 FROM   EGIN21FAMILYBKGRND
			WHERE REFERENCECODE = '#refcode#' AND RELATIONSHIP LIKE '%BRO%';
</cfquery>


<cfquery name="qryEGIN21EDUCATIONP" datasource="#session.global_dsn#" maxrows="1">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    SCHOOLNAME,
                    EDUCLEVEL,
					LOCATION,
                    MAJORDEGREE,
                    COURSECODE,
                    SCHOOLCODE,
                    DATEBEGIN,
                    DATEFINISHED,
                    GRADUATE,
                    HONORSRECEIVED
			 FROM   EGIN21EDUCATION
			WHERE REFERENCECODE = '#refcode#' AND EDUCLEVEL LIKE '%POSTGRAD%';
</cfquery>

<cfquery name="getschooldesc" datasource="#session.global_dsn#" maxrows="1">
    SELECT SCHOOLNAME
      FROM GLKSCHOOL
     WHERE SCHOOLCODE= '#qryEGIN21EDUCATIONP.SCHOOLCODE#';
</cfquery>

<cfset POSTGRADSCHOOL = '#getschooldesc.SCHOOLNAME#'>

<cfquery name="getcoursedesc" datasource="#session.global_dsn#" maxrows="1">
    SELECT DESCRIPTION
      FROM GLKCOURSE
     WHERE COURSECODE = '#qryEGIN21EDUCATIONP.COURSECODE#';
</cfquery>
<cfset POSTGRADCOURSE = '#getcoursedesc.DESCRIPTION#'>


<cfloop query="qryEGIN21EDUCATIONP">

	<cfset POSTGRADSCHOOL     = '#POSTGRADSCHOOL#'>
    <cfset POSTGRADCOURSE     = '#POSTGRADCOURSE#'>
    <cfset POSTGRADLOCATION      = '#LOCATION#'>
    <cfset POSTGRADFROM       = '#DATEBEGIN#'>
    <cfset POSTGRADTO         = '#DATEFINISHED#'>
    <cfset POSTGRADISGRAD     = '#GRADUATE#'>
    <cfset POSTGRADHONORS     = '#HONORSRECEIVED#'>

</cfloop>

<cfquery name="qryEGIN21EDUCATIONC" datasource="#session.global_dsn#">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    SCHOOLNAME,
                    EDUCLEVEL,
					LOCATION,
                    MAJORDEGREE,
                    COURSECODE,
                    SCHOOLCODE,
                    DATEBEGIN,
                    DATEFINISHED,
                    GRADUATE,
                    HONORSRECEIVED
			 FROM   EGIN21EDUCATION
			WHERE REFERENCECODE = '#refcode#' AND EDUCLEVEL LIKE '%COLLEGE%';
</cfquery>

<cfquery name="qryEGIN21EDUCATIONV" datasource="#session.global_dsn#">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    SCHOOLNAME,
                    EDUCLEVEL,
					LOCATION,
                    MAJORDEGREE,
                    COURSECODE,
                    SCHOOLCODE,
                    DATEBEGIN,
                    DATEFINISHED,
                    GRADUATE,
                    HONORSRECEIVED
			 FROM   EGIN21EDUCATION
			WHERE REFERENCECODE = '#refcode#' AND EDUCLEVEL LIKE '%VOCATIONAL%';
</cfquery>


<cfquery name="getschooldesc" datasource="#session.global_dsn#" maxrows="1">
    SELECT SCHOOLNAME
      FROM GLKSCHOOL
     WHERE SCHOOLCODE= '#qryEGIN21EDUCATIONV.SCHOOLCODE#';
</cfquery>

<cfset VOCATIONALSCHOOL = '#getschooldesc.SCHOOLNAME#'>

<cfquery name="getcoursedesc" datasource="#session.global_dsn#" maxrows="1">
    SELECT DESCRIPTION
      FROM GLKCOURSE
     WHERE COURSECODE = '#qryEGIN21EDUCATIONV.COURSECODE#';
</cfquery>
<cfset VOCATIONALCOURSE = '#getcoursedesc.DESCRIPTION#'>


<cfloop query="qryEGIN21EDUCATIONV">

	<cfset VOCATIONALSCHOOL     = '#VOCATIONALSCHOOL#'>
    <cfset VOCATIONALCOURSE     = '#VOCATIONALCOURSE#'>
    <cfset VOCATIONALLOCATION      = '#LOCATION#'>
    <cfset VOCATIONALFROM       = '#DATEBEGIN#'>
    <cfset VOCATIONALTO         = '#DATEFINISHED#'>
    <cfset VOCATIONALISGRAD     = '#GRADUATE#'>
    <cfset VOCATIONALHONORS     = '#HONORSRECEIVED#'>

</cfloop>

<cfquery name="qryEGIN21EDUCATIONS" datasource="#session.global_dsn#">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    SCHOOLNAME,
                    EDUCLEVEL,
					LOCATION,
                    MAJORDEGREE,
                    COURSECODE,
                    SCHOOLCODE,
                    DATEBEGIN,
                    DATEFINISHED,
                    GRADUATE,
                    HONORSRECEIVED
			 FROM   EGIN21EDUCATION
			WHERE REFERENCECODE = '#refcode#' AND EDUCLEVEL LIKE '%SECONDARY%';
</cfquery>


<cfquery name="getschooldesc" datasource="#session.global_dsn#" maxrows="1">
    SELECT SCHOOLNAME
      FROM GLKSCHOOL
     WHERE SCHOOLCODE= '#qryEGIN21EDUCATIONS.SCHOOLCODE#';
</cfquery>

<cfset SECONDARYSCHOOL = '#getschooldesc.SCHOOLNAME#'>

<cfquery name="getcoursedesc" datasource="#session.global_dsn#" maxrows="1">
    SELECT DESCRIPTION
      FROM GLKCOURSE
     WHERE COURSECODE = '#qryEGIN21EDUCATIONS.COURSECODE#';
</cfquery>
<cfset SECONDARYCOURSE = '#getcoursedesc.DESCRIPTION#'>


<cfloop query="qryEGIN21EDUCATIONS">

	<cfset SECONDARYSCHOOL     = '#SECONDARYSCHOOL#'>
    <cfset SECONDARYCOURSE     = '#SECONDARYCOURSE#'>
    <cfset SECONDARYLOCATION      = '#LOCATION#'>
    <cfset SECONDARYFROM       = '#DATEBEGIN#'>
    <cfset SECONDARYTO         = '#DATEFINISHED#'>
    <cfset SECONDARYISGRAD     = '#GRADUATE#'>
    <cfset SECONDARYHONORS     = '#HONORSRECEIVED#'>

</cfloop>


<cfquery name="qryEGIN21EMPEXTRA" datasource="#session.global_dsn#">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    ORGANIZATION,
                    PERIODCOVERED,
                    HIGHESTPOSITION
			 FROM   EGIN21EMPEXTRA
			WHERE REFERENCECODE = '#refcode#';
</cfquery>


<cfquery name="qryEGIN21EXAMPASS" datasource="#session.global_dsn#">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    DATETAKENPASSED,
                    PASSED,
                    RATING,
                    TYPEOFEXAM,
					LICENSENUMBER
			 FROM   EGIN21EXAMPASS
			WHERE REFERENCECODE = '#refcode#';
</cfquery>

<cfquery name="qryEGIN21MEDHISTORY" datasource="#session.global_dsn#" maxrows="1">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    BLOODTYPE
			 FROM   EGIN21MEDHISTORY
			WHERE REFERENCECODE = '#refcode#';
</cfquery>

<cfloop query="qryEGIN21MEDHISTORY">

	<cfset BLOODTYPE = '#BLOODTYPE#'>

</cfloop>





<cfquery name="qryEGIN21TRAINING" datasource="#session.global_dsn#">
		   SELECT   GUID,
                    PERSONNELIDNO,
                    INCLUSIVEDATE,
                    TOPIC,
                    REMARKS
			 FROM   EGIN21TRAINING
			WHERE REFERENCECODE = '#refcode#';
</cfquery>


<cfquery name="qryEGIN21WORKHISTORY" datasource="#session.global_dsn#">
		   SELECT  GUID,
                   PERSONNELIDNO,
                   ENTITYCODE,
                   MAINDUTIES,
                   DATEHIRED,
                   SEPARATIONDATE,
                   WORKSTARTINGSALARY,
                   WORKENDINGSALARY,
                   LASTPOSITIONHELD,
                   SUPERIOR,
                   REASONFORLEAVING,
				   SUPERIORPOSITION,
				   SUPERIORCONTACT,
				   COMPANYCONTACT,
				   ACCOMPLISHMENT
			 FROM  EGIN21WORKHISTORY
			WHERE REFERENCECODE = '#refcode#';
</cfquery>



<cfquery name="qryEGIN21RELATIVE" datasource="#session.global_dsn#">
		   SELECT  GUID,
                   PERSONNELIDNO,
                   NAME,
                   COMPANY,
                   POSITION
			 FROM  EGIN21RELATIVE
			WHERE REFERENCECODE = '#refcode#';
</cfquery>

<cfset counter = 1 >

<cfloop query="qryEGIN21RELATIVE">

  <cfif counter EQ 1 >

	<cfset RELWORKINNAMEONE           = '#NAME#'>
    <cfset RELWORKINCOMPONE           = '#COMPANY#'>
    <cfset RELWORKINAFINITYONE        = '#POSITION#'>

    <cfset couner = counter + 1 >

 <cfelseif counter EQ 2 >

	<cfset RELWORKINNAMETWO           = '#NAME#'>
    <cfset RELWORKINCOMPTWO           = '#COMPANY#'>
    <cfset RELWORKINAFINITYTWO        = '#POSITION#'>

    <cfset couner = counter + 1 >

 <cfelseif counter EQ 3 >

	<cfset RELWORKINNAMETHREE           = '#NAME#'>
    <cfset RELWORKINCOMPTHREE           = '#COMPANY#'>
    <cfset RELWORKINAFINITYTHREE        = '#POSITION#'>

 </cfif>

</cfloop>

<cfquery name="qryEGIN21MISCINFO1" datasource="#session.global_dsn#">
		   SELECT  GUID,
                   PERSONNELIDNO,
                   SPECIALTALENTS,
                   CLASSIFICATION,
                   RANKHELD
			 FROM  EGIN21MISCINFO1
			WHERE REFERENCECODE = '#refcode#';
</cfquery>

<cfquery name="qryEGIN21CHAREFERENCE" datasource="#session.global_dsn#">
		   SELECT  GUID,
                   PERSONNELIDNO,
                   NAME,
                   OCCUPATION,
                   COMPANY,
                   CELLULARPHONE
			 FROM  EGIN21CHAREFERENCE
			WHERE REFERENCECODE = '#refcode#';
</cfquery>

<cfset counter = 1 >

<cfloop query="qryEGIN21CHAREFERENCE">

  <cfif counter EQ 1 >

	<cfset REFERENCENAME1       = '#NAME#'>
    <cfset REFERENCEOCCUPATION1 = '#OCCUPATION#'>
    <cfset REFERENCECOMPANY1    = '#COMPANY#'>
    <cfset REFERENCECONTACT1    = '#CELLULARPHONE#'>

    <cfset counter = counter + 1 >

  <cfelseif counter EQ 2 >

	<cfset REFERENCENAME2       = '#NAME#'>
    <cfset REFERENCEOCCUPATION2 = '#OCCUPATION#'>
    <cfset REFERENCECOMPANY2    = '#COMPANY#'>
    <cfset REFERENCECONTACT2    = '#CELLULARPHONE#'>

    <cfset counter = counter + 1 >

  <cfelseif counter EQ 3 >

	<cfset REFERENCENAME3       = '#NAME#'>
    <cfset REFERENCEOCCUPATION3 = '#OCCUPATION#'>
    <cfset REFERENCECOMPANY3    = '#COMPANY#'>
    <cfset REFERENCECONTACT3    = '#CELLULARPHONE#'>

  </cfif>

</cfloop>


<cfquery name="qryEGIN21EMPVIOL2" datasource="#session.global_dsn#">
		   SELECT  GUID,
                   PERSONNELIDNO,
                   CASENUMBER,
                   CASENAME,
                   CASESTATUS
			 FROM  EGIN21EMPVIOL
			WHERE REFERENCECODE = '#refcode#' AND CASENUMBER = 'illness';
</cfquery>

<cfloop query="qryEGIN21EMPVIOL2">

	<cfset HASOPILLNESS           = '#CASENAME#'>
	<cfset HASOPILLNESSNATURE     = '#CASESTATUS#'>

</cfloop>

<cfquery name="qryEGIN21EMPVIOL3" datasource="#session.global_dsn#">
		   SELECT  GUID,
                   PERSONNELIDNO,
                   CASENUMBER,
                   CASENAME,
                   CASESTATUS
			 FROM  EGIN21EMPVIOL
			WHERE REFERENCECODE = '#refcode#' AND CASENUMBER = 'sensitive';
</cfquery>

<cfloop query="qryEGIN21EMPVIOL3">

	<cfset HASDRUGSENSITIVE           = '#CASENAME#'>
	<cfset HASDRUGSENSITIVENATURE     = '#CASESTATUS#'>

</cfloop>

<cfquery name="qryEGIN21EMPVIOL4" datasource="#session.global_dsn#">
		   SELECT  GUID,
                   PERSONNELIDNO,
                   CASENUMBER,
                   CASENAME,
                   CASESTATUS
			 FROM  EGIN21EMPVIOL
			WHERE REFERENCECODE = '#refcode#' AND CASENUMBER = 'dangerous';
</cfquery>

<cfloop query="qryEGIN21EMPVIOL4">

	<cfset HASENGAGEDRUGS           = '#CASENAME#'>
	<cfset HASENGAGEDRUGSNATURE     = '#CASESTATUS#'>

</cfloop>

<cfquery name="qryEGIN21EMPVIOL5" datasource="#session.global_dsn#">
		   SELECT  GUID,
                   PERSONNELIDNO,
                   CASENUMBER,
                   CASENAME,
                   CASESTATUS
			 FROM  EGIN21EMPVIOL
			WHERE REFERENCECODE = '#refcode#' AND CASENUMBER = 'business';
</cfquery>

<cfloop query="qryEGIN21EMPVIOL5">

	<cfset HASINVOLVEBUSI           = '#CASENAME#'>
	<cfset HASINVOLVEBUSINATURE     = '#CASESTATUS#'>

</cfloop>

<cfquery name="qryEGIN21EMPVIOLN6" datasource="#session.global_dsn#">
		   SELECT  GUID,
                   PERSONNELIDNO,
                   CASENUMBER,
                   CASENAME,
                   CASESTATUS
			 FROM  EGIN21EMPVIOL
			WHERE REFERENCECODE = '#refcode#' AND CASENUMBER = 'suspended';
</cfquery>

<cfloop query="qryEGIN21EMPVIOLN6">

	<cfset HASSUSPENDED           = '#CASENAME#'>
	<cfset HASSUSPENDEDNATURE     = '#CASESTATUS#'>

</cfloop>

<cfquery name="qryEGIN21EMPVIOL7" datasource="#session.global_dsn#">
		   SELECT  GUID,
                   PERSONNELIDNO,
                   CASENUMBER,
                   CASENAME,
                   CASESTATUS
			 FROM  EGIN21EMPVIOL
			WHERE REFERENCECODE = '#refcode#' AND CASENUMBER = 'convicted';
</cfquery>

<cfloop query="qryEGIN21EMPVIOL7">

	<cfset HASCRIMINAL           = '#CASENAME#'>
	<cfset HASCRIMINALNATURE     = '#CASESTATUS#'>

</cfloop>


    <h2 style="text-align: center;"><cfoutput>#session.companyname#</cfoutput></h2>
    <h3 style="text-align: center;">EMPLOYMENT APPLICATION FORM</h3>
    <br />
    <img src="../../../unDB/images/globalphoto/<cfoutput>#PHOTOIDNAME#</cfoutput>" width="200" height="200" alt="NO PHOTO">
    <h4><cfoutput>#LASTNAME#, #FIRSTNAME# #MIDDLENAME#</cfoutput></h4>

	<table style="font-size: 12px; font-family: Arial, Helvetica, sans-serif; border: 1px solid #666;">
		<tr>
			<th style="border-bottom: 1px solid #CCC;">&nbsp;</th>
			<th style="border-bottom: 1px solid #CCC;">&nbsp;</th>
		</tr>

        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>PERSONAL INFORMATION</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Last Name</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#LASTNAME#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">First Name</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTNAME#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Suffix</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SUFFIX#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Middle Name</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#MIDDLENAME#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Present Address and Postal Code</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#PRESENTADDRESSPOSTAL#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#PRESENTADDRESSOWN#</cfoutput></td>
		</tr>

        <tr>
			<td style="border-bottom: 1px solid #CCC;">Provincial Address and Postal Code</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#PROVINCIALADDRESSPOSTAL#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#PROVINCEADDRESSOWN#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Date of Birth</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#DATEOFBIRTH#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Age</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#AGE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Gender</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#GENDER#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Place of Birth</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#PLACEOFBIRTH#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Civil Status</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#CIVILSTATUS#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">SSS No.</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SSSNUMBER#</cfoutput></td>
		</tr>

        <tr>
			<td style="border-bottom: 1px solid #CCC;">TIN</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#TINNUMBER#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">PhilHealth No.</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#PHILHEALTHNUMBER#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">PAG-IBIG No.</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#PAGIBIGNUMBER#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Cellphone Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#CELLPHONENUMBER#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Landline Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#LANDLINENUMBER#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Email Address</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#EMAILADDRESS#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Citizenship</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#CITIZENSHIP#</cfoutput></td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #CCC;">ACR Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#ACRNUMBER#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Religion</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RELIGION#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Height</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#HEIGHT#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Weight</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#WEIGHT#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Blood Type</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#BLOODTYPE#</cfoutput></td>
		</tr>

		<tr>
			<td style="border-bottom: 1px solid #CCC;">Languages and Dialects Spoken/Written</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#LANGUAGESPOKEN#</cfoutput></td>
		</tr>

        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>



        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>EMPLOYMENT INFORMATION<strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Position First Choice</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#POSITIONFIRSTPRIORITY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Position First Choice Company</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COMPANYFIRSTPRIORITY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Position Second Choice</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#POSITIONSECONDPRIORITY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Position Second Choice Company</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COMPANYSECONDPRIORITY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Position Third Choice</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#POSITIONTHIRDPRIORITY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Position Third Choice Company</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COMPANYTHIRDPRIORITY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Expected Salary</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#EXPECTEDSALARY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Current Salary</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#CURRENTSALARY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Previously Employed with Filinvest Group of Companies?</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#PREVEMPLOYED# From: #PREVEMPLOYEDFROM#  To: #PREVEMPLOYEDTO#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Previously Applied Here? </td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#PREVAPPLIED#  last:  #PREVAPPLIEDLAST#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Date Available for Employment?</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#DATEAVAILEMP#</cfoutput></td>
		</tr>


        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>FAMILY BACKGROUND<strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Father</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FATHERFULLNAME#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Age</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FATHERAGE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Occupation</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FATHEROCCUPATION#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Company</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FATHERCOMPANY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Contact Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FATHERCONTACTNO#</cfoutput></td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #CCC;">Birth Day</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FATHERBIRTHDAY#</cfoutput></td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #CCC;">Deceased?</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FATHERLIVINGORDEAD#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Mother</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#MOTHERFULLNAME#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Age</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#MOTHERAGE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Occupation</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#MOTHEROCCUPATION#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Company</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#MOTHERCOMPANY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Contact Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#MOTHERCONTACTNO#</cfoutput></td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #CCC;">Birth Day</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#MOTHERBIRTHDAY#</cfoutput></td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #CCC;">Deceased?</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#MOTHERLIVINGORDEAD#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <cfif len(SPOUSEFULLNAME) GT 0 AND Ucase(SPOUSEFULLNAME) NEQ 'NA'>

        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Spouse</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SPOUSEFULLNAME#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Age</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SPOUSEAGE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Occupation</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SPOUSEOCCUPATION#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Company</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SPOUSECOMPANY#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Contact Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SPOUSECONTACTNO#</cfoutput></td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #CCC;">Birth Day</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SPOUSEBIRTHDAY#</cfoutput></td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #CCC;">Deceased?</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SPOUSELIVINGORDEAD#</cfoutput></td>
		</tr>
        </cfif>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>

        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>Children</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>

		<cfset namecnt = 1 />
		<cfloop query="qryEGIN21FAMILYBKGRNDCHILDREN">

	        <tr>
				<td style="border-bottom: 1px solid #CCC;"></td>
				<td style="border-bottom: 1px solid #CCC;"></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;"><b><cfoutput>#namecnt#.</cfoutput></b> Name</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#NAME#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Age</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#AGE#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Occupation</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#OCCUPATION#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Company</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COMPANY#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Contact Number</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#TELEPHONENUMBER#</cfoutput></td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid #CCC;">Birth Day</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#BIRTHDAY#</cfoutput></td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid #CCC;">Deceased?</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#LIVINGORDEAD#</cfoutput></td>
			</tr>

			<cfset namecnt = namecnt + 1 />

		</cfloop>

		<tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>Siblings</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>


		<cfset namecnt = 1 />
		<cfloop query="qryEGIN21FAMILYBKGRNDSIBLING">

	        <tr>
				<td style="border-bottom: 1px solid #CCC;"></td>
				<td style="border-bottom: 1px solid #CCC;"></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;"><b><cfoutput>#namecnt#.</cfoutput></b> Name</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#NAME#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Age</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#AGE#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Occupation</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#OCCUPATION#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Company</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COMPANY#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Contact Number</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#TELEPHONENUMBER#</cfoutput></td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid #CCC;">Birth Day</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#BIRTHDAY#</cfoutput></td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid #CCC;">Deceased?</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#LIVINGORDEAD#</cfoutput></td>
			</tr>

			<cfset namecnt = namecnt + 1 />

		</cfloop>



        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>


        <tr>
			<td style="border-bottom: 1px solid #CCC;"><strong>In case of emergency, please notify:</strong></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Name</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#INCASEEMERNAME#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Cellphone Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#INCASEEMERCELLNUM#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Relationship</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#INCASEEMERRELATION#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Telephone Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#INCASEEMERTELNUM#</cfoutput></td>
		</tr>


        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>Relatives/Friends Working in <cfoutput>#COMPANYCODE#</cfoutput> Group: </strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>

        <cfset counts = 0 >
        <cfif len(RELWORKINNAMEONE) GT 0 AND Ucase(RELWORKINNAMEONE) NEQ 'NA'>

        	<cfset counts = counts + 1 >
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#counts#. </strong></cfoutput> Name</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RELWORKINNAMEONE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Company's Name/Occupation</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RELWORKINCOMPONE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Degree of Afinity</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RELWORKINAFINITYONE#</cfoutput></td>
		</tr>

        </cfif>


        <cfif len(RELWORKINNAMETWO) GT 0 AND Ucase(RELWORKINNAMETWO) NEQ 'NA'>

        	<cfset counts = counts + 1 >
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#counts#. </strong></cfoutput> Name</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RELWORKINNAMETWO#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Company's Name/Occupation</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RELWORKINCOMPTWO#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Degree of Afinity</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RELWORKINAFINITYTWO#</cfoutput></td>
		</tr>

        </cfif>


        <cfif len(RELWORKINNAMETHREE) GT 0 AND Ucase(RELWORKINNAMETHREE) NEQ 'NA'>

        	<cfset counts = counts + 1 >
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#counts#. </strong></cfoutput> Name</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RELWORKINNAMETHREE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Company's Name/Occupation</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RELWORKINCOMPTHREE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Degree of Afinity</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RELWORKINAFINITYTHREE#</cfoutput></td>
		</tr>

        </cfif>


        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>EDUCATIONAL BACKGROUND</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <cfset postcheck = "#POSTGRADISGRAD#">
      		<cfif postcheck  EQ "1">
				<cfset postcheckcheck  = "Yes">
            <cfelse>
                <cfset postcheckcheck  = "No">
            </cfif>

      <cfset vocationalcheck = "#VOCATIONALISGRAD#">
      		<cfif vocationalcheck  EQ "1">
				<cfset vocationalcheckcheck  = "Yes">
            <cfelse>
                <cfset vocationalcheckcheck  = "No">
            </cfif>
      <cfset secondarycheck = "#SECONDARYISGRAD#">
      		<cfif secondarycheck  EQ "1">
				<cfset secondarycheckcheck  = "Yes">
            <cfelse>
                <cfset secondarycheckcheck  = "No">
            </cfif>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"><strong>Post Grad School</strong></td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#POSTGRADSCHOOL#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Location</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#POSTGRADLOCATION#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Course</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#POSTGRADCOURSE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Is Grad</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#postcheckcheck#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">From</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#POSTGRADFROM#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">To</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#POSTGRADTO#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Honor(s)/Award(s)</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#POSTGRADHONORS#</cfoutput></td>
		</tr>

		<cfset collegecnt = 1 />
		<cfloop query="qryEGIN21EDUCATIONC">

			<cfquery name="getschooldesc" datasource="#session.global_dsn#" maxrows="1">
			    SELECT SCHOOLNAME
			      FROM GLKSCHOOL
			     WHERE SCHOOLCODE= '#qryEGIN21EDUCATIONC.SCHOOLCODE#';
			</cfquery>

			<cfquery name="getcoursedesc" datasource="#session.global_dsn#" maxrows="1">
			    SELECT DESCRIPTION
			      FROM GLKCOURSE
			     WHERE COURSECODE = '#qryEGIN21EDUCATIONC.COURSECODE#';
			</cfquery>

			<cfset COLLEGESCHOOL = '#getschooldesc.SCHOOLNAME#'>
			<cfset COLLEGECOURSE = '#getcoursedesc.DESCRIPTION#'>
			<cfset COLLEGESCHOOL     = '#COLLEGESCHOOL#'>
		    <cfset COLLEGECOURSE     = '#COLLEGECOURSE#'>
		    <cfset COLLEGELOCATION      = '#LOCATION#'>
		    <cfset COLLEGEFROM       = '#DATEBEGIN#'>
		    <cfset COLLEGETO         = '#DATEFINISHED#'>
		    <cfset COLLEGEISGRAD     = '#GRADUATE#'>
		    <cfset COLLEGEHONORS     = '#HONORSRECEIVED#'>

		    <cfset collegecheck = "#COLLEGEISGRAD#">
      		<cfif collegecheck  EQ "1">
				<cfset collegecheckcheck  = "Yes">
            <cfelse>
                <cfset collegecheckcheck  = "No">
            </cfif>

		    <tr>
				<td style="border-bottom: 1px solid #CCC;"></td>
				<td style="border-bottom: 1px solid #CCC;"></td>
			</tr>

			<tr>
				<td style="border-bottom: 1px solid #CCC;"><strong><cfoutput>#collegecnt#.</cfoutput> School</strong></td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COLLEGESCHOOL#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Location</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COLLEGELOCATION#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Course</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COLLEGECOURSE#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Is Grad</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#collegecheckcheck#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">From</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COLLEGEFROM#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">To</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COLLEGETO#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Honor(s)/Award(s)</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#COLLEGEHONORS#</cfoutput></td>
			</tr>

			<cfset collegecnt = collegecnt + 1 />

		</cfloop>


        <cfif len(VOCATIONALSCHOOL) GT 0 AND Ucase(VOCATIONALSCHOOL) NEQ 'NA'>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;"></td>
				<td style="border-bottom: 1px solid #CCC;"></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;"><strong>Vocational School</strong></td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#VOCATIONALSCHOOL#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Location</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#VOCATIONALLOCATION#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Course</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#VOCATIONALCOURSE#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Is Grad</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#vocationalcheck#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">From</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#VOCATIONALFROM#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">To</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#VOCATIONALTO#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Honor(s)/Award(s)</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#VOCATIONALHONORS#</cfoutput></td>
			</tr>
        </cfif>

        <cfif len(SECONDARYSCHOOL) GT 0 AND Ucase(SECONDARYSCHOOL) NEQ 'NA'>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;"></td>
				<td style="border-bottom: 1px solid #CCC;"></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;"><strong>Secondary School</strong></td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SECONDARYSCHOOL#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Location</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SECONDARYLOCATION#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Course</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SECONDARYCOURSE#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Is Grad</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#secondarycheckcheck#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">From</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SECONDARYFROM#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">To</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SECONDARYTO#</cfoutput></td>
			</tr>
	        <tr>
				<td style="border-bottom: 1px solid #CCC;">Honor(S)/Award(s)</td>
				<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SECONDARYHONORS#</cfoutput></td>
			</tr>
        </cfif>

        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>EXTRA CURRICULAR</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;""></td>
		</tr>

		<cfset currcnt = 1 />
		<cfloop query="qryEGIN21EMPEXTRA">
			<cfif len(ORGANIZATION) GT 0 AND Ucase(ORGANIZATION) NEQ 'NA'>
	        	<tr>
					<td style="border-bottom: 1px solid #CCC;"></td>
					<td style="border-bottom: 1px solid #CCC;"></td>
				</tr>
				<tr>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#currcnt#. </strong></cfoutput> Organization</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#ORGANIZATION#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Inclusive Dates</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#PERIODCOVERED#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Highest Position Held</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#HIGHESTPOSITION#</cfoutput></td>
				</tr>
				<cfset currcnt = currcnt + 1 />
			</cfif>
		</cfloop>

		<tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>ADDITIONAL INFORMATION</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;""></td>
		</tr>

		<cfset currcnt = 1 />
		<cfloop query="qryEGIN21EXAMPASS">

	        <cfif len(TYPEOFEXAM) GT 0 AND Ucase(TYPEOFEXAM) NEQ 'NA'>

		        <tr>
					<td style="border-bottom: 1px solid #CCC;"></td>
					<td style="border-bottom: 1px solid #CCC;"></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#currcnt#. </strong></cfoutput> Licensure Exam Passed</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#TYPEOFEXAM#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Date Taken</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#DATETAKENPASSED#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Rating</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#RATING#</cfoutput></td>
				</tr>
				<tr>
					<td style="border-bottom: 1px solid #CCC;">License Number</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#LICENSENUMBER#</cfoutput></td>
				</tr>
				<cfset currcnt = currcnt + 1 />
	        </cfif>
		</cfloop>

        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>TRAININGS AND SEMINARS</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>

		<cfset counter = 1 >

		<cfloop query="qryEGIN21TRAINING">

			<cfset FIRSTSEMINARTOPIC         = '#TOPIC#'>
		    <cfset FIRSTSEMINARDATE          = '#INCLUSIVEDATE#'>
		    <cfset FIRSTSEMINARORGANIZER     = '#REMARKS#'>

			<cfif len(FIRSTSEMINARTOPIC) GT 0 AND Ucase(FIRSTSEMINARTOPIC) NEQ 'NA'>
	        	<tr>
					<td style="border-bottom: 1px solid #CCC;"></td>
					<td style="border-bottom: 1px solid #CCC;"></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#counter#. </strong></cfoutput> Training/Seminar Topic</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTSEMINARTOPIC#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Date</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTSEMINARDATE#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Organizer</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTSEMINARORGANIZER#</cfoutput></td>
				</tr>
				<cfset counter = counter + 1 >
	        </cfif>

		 </cfloop>

        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>EMPLOYMENT HISTORY</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>


		<cfset counter = 1 >

		<cfloop query="qryEGIN21WORKHISTORY">



			<cfset FIRSTEMPHISTORYNAME          = '#ENTITYCODE#'>
		    <cfset FIRSTEMPHISTORYADDRESS       = '#MAINDUTIES#'>
		    <cfset FIRSTEMPHISTORYDATEEMP       = '#DATEHIRED#'>
		    <cfset FIRSTEMPHISTORYDATESEP       = '#SEPARATIONDATE#'>
		    <cfset FIRSTEMPHISTORYINISALARY     = '#WORKSTARTINGSALARY#'>
		    <cfset FIRSTEMPHISTORYLASTSALARY    = '#WORKENDINGSALARY#'>
		    <cfset FIRSTEMPHISTORYLASTPOS       = '#LASTPOSITIONHELD#'>
		    <cfset FIRSTEMPHISTORYSUPERIOR      = '#SUPERIOR#'>
		    <cfset FIRSTEMPHISTORYLEAVEREASONS  = '#REASONFORLEAVING#'>
			<cfset FIRSTEMPHISTORYPOSITION  = '#SUPERIORPOSITION#'>
			<cfset FIRSTEMPHISTORYCONTACTNO  = '#SUPERIORCONTACT#'>
			<cfset FIRSTEMPHISTORYCOMPANYCONTACT  = '#COMPANYCONTACT#'>
			<cfset FIRSTEMPHISTORYACCOMPLISHMENT  = '#ACCOMPLISHMENT#'>

			<cfif len(FIRSTEMPHISTORYNAME) GT 0 AND Ucase(FIRSTEMPHISTORYNAME) NEQ 'NA'>

		        <tr>
					<td style="border-bottom: 1px solid #CCC;"></td>
					<td style="border-bottom: 1px solid #CCC;"></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#counter#. </strong></cfoutput> Company Name</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYNAME#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Date Employed</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYDATEEMP#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Company Address</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYADDRESS#</cfoutput></td>
				</tr>
				<tr>
					<td style="border-bottom: 1px solid #CCC;">Contact Information</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYCOMPANYCONTACT#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Date Separated</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYDATESEP#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Last Position Held</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYLASTPOS#</cfoutput></td>
				</tr>
				<tr>
					<td style="border-bottom: 1px solid #CCC;">Major Accomplishments</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYACCOMPLISHMENT#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Initial Salary</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYINISALARY#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Last Salary</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYLASTSALARY#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Reason(s) for Leaving</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYLEAVEREASONS#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Immediate Superior</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYSUPERIOR#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Position</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYPOSITION#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Contact Number</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#FIRSTEMPHISTORYCONTACTNO#</cfoutput></td>
				</tr>

				<cfset counter = counter + 1 >
	        </cfif>

		</cfloop>

        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>SPECIAL SKILLS</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>

		<cfset counter = 1 >
		<cfloop query="qryEGIN21MISCINFO1">

			<cfset SPECIALSKILLSONE           = '#SPECIALTALENTS#'>
		    <cfset SPECIALSKILLSLEVELONE      = '#RANKHELD#'>

			<cfif len(SPECIALSKILLSONE) GT 0 AND Ucase(SPECIALSKILLSONE) NEQ 'NA'>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;"></td>
					<td style="border-bottom: 1px solid #CCC;"></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#counter#. </strong></cfoutput>Special skills</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SPECIALSKILLSONE#</cfoutput></td>
				</tr>
		        <tr>
					<td style="border-bottom: 1px solid #CCC;">Level of Expertise</td>
					<td style="border-bottom: 1px solid #CCC;"><cfoutput>#SPECIALSKILLSLEVELONE#</cfoutput></td>
				</tr>
				<cfset counter = counter + 1 >
		    </cfif>
		</cfloop>

        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>SOURCE</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;""></td>
		</tr>

        <tr>
            <td style="border-bottom: 1px solid #CCC;"></td>
            <td style="border-bottom: 1px solid #CCC;"><cfoutput>#SOURCEEMPLOYMENT#</cfoutput></td>
        </tr>

        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>REFERENCES</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>

        <cfset counts = 0 >

        <cfif len(REFERENCENAME1) GT 0 AND Ucase(REFERENCENAME1) NEQ 'NA'>
        	<cfset counts = counts + 1 >
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#counts#. </strong></cfoutput> Name</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCENAME1#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Occupation</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCEOCCUPATION1#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Company</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCECOMPANY1#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Contact Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCECONTACT1#</cfoutput></td>
		</tr>
        </cfif>

        <cfif len(REFERENCENAME2) GT 0 AND Ucase(REFERENCENAME2) NEQ 'NA'>
        	<cfset counts = counts + 1 >
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#counts#. </strong></cfoutput> Name</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCENAME2#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Occupation</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCEOCCUPATION2#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Company</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCECOMPANY2#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Contact Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCECONTACT2#</cfoutput></td>
		</tr>
        </cfif>

        <cfif len(REFERENCENAME3) GT 0 AND Ucase(REFERENCENAME3) NEQ 'NA'>
        	<cfset counts = counts + 1 >
        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput><strong>#counts#. </strong></cfoutput> Name</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCENAME3#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Occupation</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCEOCCUPATION3#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Company</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCECOMPANY3#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Contact Number</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#REFERENCECONTACT3#</cfoutput></td>
		</tr>
        </cfif>


        <tr>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"><strong>OTHER DETAILS</strong></td>
			<td style="border-bottom: 2px solid #333; border-top: 2px solid #333;"></td>
		</tr>

        <tr>
			<td style="border-bottom: 1px solid #CCC;"></td>
			<td style="border-bottom: 1px solid #CCC;"></td>
		</tr>

        <tr>
			<td style="border-bottom: 1px solid #CCC;">Have you ever had any serious physical or mental illness?</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#HASOPILLNESS# #HASOPILLNESSNATURE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Do you have any allergies? Please specify.</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#HASDRUGSENSITIVE# #HASDRUGSENSITIVENATURE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Are you engaged in the use and trade of dangerous drugs?</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#HASENGAGEDRUGS# #HASENGAGEDRUGSNATURE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Are you engaged in any other businesses?</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#HASINVOLVEBUSI# #HASINVOLVEBUSINATURE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Have you been dismissed or suspended in your previous employments?</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#HASSUSPENDED# #HASSUSPENDEDNATURE#</cfoutput></td>
		</tr>
        <tr>
			<td style="border-bottom: 1px solid #CCC;">Have you ever been convicted in any administrative, civil or criminal case?</td>
			<td style="border-bottom: 1px solid #CCC;"><cfoutput>#HASCRIMINAL# #HASCRIMINALNATURE#</cfoutput></td>
		</tr>

	</table>

	<cfif countme neq count>
		<cfdocumentitem type="pagebreak" />
    </cfif>
</cfloop>

</cfdocument>

<cflocation url="#session.userid#.pdf">