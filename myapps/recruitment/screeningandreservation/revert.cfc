<cfcomponent name="revert" ExtDirect="true">

<cffunction name="revert" ExtDirect="true">
<cfargument name="referencecodelist" >


<cftry>

<cfset thelist = referencecodelist />
<cfset count = ListLen(thelist, "~", "no")>
<cfset messageback = "success" >

<cfloop index="countme" from="1" to="#count#">


<cfset theguid = ListGetAt(thelist, countme, "~", "no")>
<cfset REFERENCECODE = dateformat(now(),"YYYYMMDD") & timeformat(now(),"HHMMSS") & createuuid() />
<cfset APPLICANTNUMBER = "" >
<!---revert start--->
<cfset sourceDir = ExpandPath("../../../unDB/forms/#session.companycode#/")>
<cfset destDir = ExpandPath( "../../../unDB/globalattachments/" ) />
<cftry>
	<cfif Not directoryExists(destDir) >
        <cfdirectory action="create" directory="#destDir#" mode="777" >
    </cfif>
<cfcatch></cfcatch>
</cftry>
<cfset imageArray = ArrayNew(1) >

<!---Revert to EGMFAP-------------------------------------------------------------------------------------->
	<cfquery name="query_from_CMFAP" datasource="#session.company_dsn#" maxrows="1">
	  SELECT   *
		FROM CMFAP
	   WHERE GUID = '#theguid#';
	</cfquery>

 <cfloop query="query_from_CMFAP">
   <cfset APPLICANTNUMBER = query_from_CMFAP.APPLICANTNUMBER >
   <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
       INSERT INTO EGMFAP ( GUID,
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
                            WORKEXPRATING,
                            RECDATECREATED,
                            DATELASTUPDATE,
                            APPLICANTTYPE,
                            COMPANYCODE,
                            REFERENCECODE
                            )
                 VALUES ( <cfqueryparam cfsqltype="cf_sql_varchar" value="#GUID#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#APPLICANTNUMBER#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#SUFFIX#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#LASTNAME#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#FIRSTNAME#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#MIDDLENAME#"/>,
                          <cfqueryparam cfsqltype="cf_sql_date"    value="#APPLICATIONDATE#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#PAGIBIGNUMBER#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERREDBY#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#SSSNUMBER#"/>,
                          <cfqueryparam cfsqltype="cf_sql_integer" value="#STARTINGSALARY#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#TIN#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#EMAILADD#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#POSITIONCODE#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#SOURCE#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="N"/>,
                          <cfqueryparam cfsqltype="cf_sql_integer" value="#WORKEXPRATING#"/>,
                          <cfqueryparam cfsqltype="cf_sql_date"    value="#dateformat(now(), 'YYYY-MM-DD')#"/>,
                          <cfqueryparam cfsqltype="cf_sql_date"    value="#DATELASTUPDATE#"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="YESREVERT"/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value=""/>,
                          <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
                         );
    </cfquery>
 </cfloop>
<!---END FETCH TO CMFAP-------------------------------------------------------------------------------------->

<!---FETCH TO CIN21PERSONALINFO-------------------------------------------------------------------------------------->
<cfquery name="query_from_CIN21PERSONALINFO" datasource="#session.company_dsn#" maxrows="1">
  SELECT   *
	FROM CIN21PERSONALINFO
   WHERE GUID = '#theguid#';
</cfquery>
<cfloop query="query_from_CIN21PERSONALINFO">
	<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
            INSERT INTO EGIN21PERSONALINFO ( GUID,
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
                                            ACREXPIRATIONDATE,
											ACRNUMBER,
                                            REFERENCECODE )
             VALUES ( <cfqueryparam cfsqltype="cf_sql_varchar" value="#GUID#"/>,
             		  <cfqueryparam cfsqltype="cf_sql_varchar" value="#PERSONNELIDNO#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#CONTACTADDRESS#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#PROVINCIALADDRESS#"/>,
                      <cfqueryparam cfsqltype="cf_sql_date" value="#BIRTHDAY#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#BIRTHPLACE#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#AGE#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#SEX#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#CIVILSTATUS#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#CITIZENSHIP#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#RELIGIONCODE#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#CONTACTCELLNUMBER#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#CONTACTTELNO#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#EMAILADDRESS#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#HEIGHT#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#WEIGHT#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#LANGUAGESPOKEN#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#PERSONTOCONTACT#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#RELATIONSHIP#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#TELEPHONENUMBER#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#PERCELLNUMBER#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#PREVIOUSADDRESS#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#PROVPERIODOFRES#"/>,
					  <cfqueryparam cfsqltype="cf_sql_varchar" value="#LANGUAGEWRITTEN#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#CONTACTADDRESS2#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#CONTACTADDRESS3#"/>,
                      <cfqueryparam cfsqltype="cf_sql_date" value="#ACREXPIRATIONDATE#"/>,
					  <cfqueryparam cfsqltype="cf_sql_date" value="#ACRNUMBER#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/> );
   </cfquery>
</cfloop>
<!---END FETCH TO CIN21PERSONALINFO-------------------------------------------------------------------------------------->

<!---FETCH TO CIN21POSITNAPLD-------------------------------------------------------------------------------------->
  <cfquery name="query_from_CIN21POSITNAPLD" datasource="#session.company_dsn#">
	  SELECT *
		FROM CIN21POSITNAPLD
	   WHERE GUID = '#theguid#';
  </cfquery>

  <cfloop query="query_from_CIN21POSITNAPLD">
  	<cfif PRIORITY eq 1 >
	 <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
	    INSERT INTO EGIN21POSITNAPLD (  GUID,
										PERSONNELIDNO,
	    								POSITIONCODE,
	                                    COMPANYCODE,
	                                    PRIORITY,
	                                    REFERENCECODE
	                                )
	                         VALUES (  <cfqueryparam cfsqltype="cf_sql_varchar" value="#GUID#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#PERSONNELIDNO#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#POSITIONCODE#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#DEPARTMENTCODE#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_integer" value="3"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
	                                );
	  </cfquery>
	  <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
	    UPDATE EGMFAP
	       SET POSITIONTHIRDPRIORITY = <cfqueryparam cfsqltype="cf_sql_varchar" value="#POSITIONCODE#"/>
	     WHERE REFERENCECODE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
	  </cfquery>
	 <cfelseif PRIORITY eq 2 >
	  <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
	    INSERT INTO EGIN21POSITNAPLD (  GUID,
										PERSONNELIDNO,
	    								POSITIONCODE,
	                                    COMPANYCODE,
	                                    PRIORITY,
	                                    REFERENCECODE
	                                )
	                         VALUES (  <cfqueryparam cfsqltype="cf_sql_varchar" value="#GUID#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#PERSONNELIDNO#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#POSITIONCODE#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#DEPARTMENTCODE#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_integer" value="1"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
	                                );
	  </cfquery>
	  <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
	    UPDATE EGMFAP
	       SET POSITIONCODE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#POSITIONCODE#"/>
	     WHERE REFERENCECODE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
	  </cfquery>
	 <cfelse>
	  <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
	    INSERT INTO EGIN21POSITNAPLD (  GUID,
										PERSONNELIDNO,
	    								POSITIONCODE,
	                                    COMPANYCODE,
	                                    PRIORITY,
	                                    REFERENCECODE
	                                )
	                         VALUES (  <cfqueryparam cfsqltype="cf_sql_varchar" value="#GUID#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#PERSONNELIDNO#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#POSITIONCODE#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#DEPARTMENTCODE#"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_integer" value="2"/>,
	                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
	                                );
	  </cfquery>
	  <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
	    UPDATE EGMFAP
	       SET POSITIONSECONDPRIORITY = <cfqueryparam cfsqltype="cf_sql_varchar" value="#POSITIONCODE#"/>
	     WHERE REFERENCECODE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
	  </cfquery>
  	</cfif>
  </cfloop>
<!---END FETCH TO CIN21POSITNAPLD-------------------------------------------------------------------------------------->

<!---FETCH TO CIN21FAMILYBKGRND-------------------------------------------------------------------------------------->
<cfquery name="query_from_CIN21FAMILYBKGRND" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21FAMILYBKGRND
   WHERE GUID = '#theguid#';
</cfquery>
<cfloop query="query_from_CIN21FAMILYBKGRND">
	<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
            INSERT INTO EGIN21FAMILYBKGRND (    GUID,
												PERSONNELIDNO,
												NAME,
												AGE,
												COMPANY,
												OCCUPATION,
									 			RELATIONSHIP,
												TELEPHONENUMBER,
												BIRTHDAY,
												LIVINGORDEAD,
												REFERENCECODE
									       )
             VALUES ( <cfqueryparam cfsqltype="cf_sql_varchar" value="#GUID#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#PERSONNELIDNO#"/>,
             		  <cfqueryparam cfsqltype="cf_sql_varchar" value="#NAME#"/>,
                      <cfqueryparam cfsqltype="cf_sql_integer" value="#AGE#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#COMPANY#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#OCCUPATION#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#RELATIONSHIP#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#TELEPHONENUMBER#"/>,
					  <cfif trim(BIRTHDAY) neq "">
						  <cfqueryparam cfsqltype="cf_sql_timestamp" value="#BIRTHDAY#" />,
					  <cfelse>
					  	  <cfqueryparam cfsqltype="cf_sql_timestamp" null="true" />,
					  </cfif>
					  <cfqueryparam cfsqltype="cf_sql_varchar" value="#LIVINGORDEAD#"/>,
                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
					 );
    </cfquery>
 </cfloop>
<!---END FETCH TO CIN21FAMILYBKGRND-------------------------------------------------------------------------------------->


<!---Fetch to CIN21EDUCATION-------------------------------------------------------------------------------------->
<cfquery name="query_from_CIN21EDUCATION" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21EDUCATION
   WHERE GUID = '#theguid#';
</cfquery>

<cfloop query="query_from_CIN21EDUCATION">
	<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
        INSERT INTO EGIN21EDUCATION (   GUID,
										PERSONNELIDNO,
										EDUCLEVEL,
										LOCATION,
										MAJORDEGREE,
										COURSECODE,
										SCHOOLCODE,
										DATEBEGIN,
										DATEFINISHED,
										GRADUATE,
										HONORSRECEIVED,
										REFERENCECODE
                                     )
                             VALUES (   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#EDUCLEVEL#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#LOCATION#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#MAJORDEGREE#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#COURSECODE#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#SCHOOLCODE#" >,
									    <cfqueryparam cfsqltype = "cf_sql_date"    value = "#DATEBEGIN#" >,
									    <cfqueryparam cfsqltype = "cf_sql_date"    value = "#DATEFINISHED#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GRADUATE#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#HONORSRECEIVED#" >,
									    <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
									 );
   </cfquery>
   <cfif ucase(trim(EDUCLEVEL)) eq "COLLEGE" >
   		<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
		    UPDATE EGMFAP
		       SET COLLEGESCHOOL = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#SCHOOLCODE#" >,
		           COLLEGECOURSE = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#COURSECODE#" >,
		           COLLEGEISGRAD = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GRADUATE#" >
		     WHERE REFERENCECODE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
		 </cfquery>
   <cfelseif ucase(trim(EDUCLEVEL)) eq "POSTGRAD" >
   	     <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
		    UPDATE EGMFAP
		       SET POSTGRADSCHOOL = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#SCHOOLCODE#" >,
		           POSTGRADCOURSE = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#COURSECODE#" >,
		           POSTGRADISGRAD = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GRADUATE#" >
		     WHERE REFERENCECODE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
		 </cfquery>
   <cfelseif ucase(trim(EDUCLEVEL)) eq "VOCATIONAL" >
   		<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
		    UPDATE EGMFAP
		       SET VOCATIONALSCHOOL = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#SCHOOLCODE#" >,
		           VOCATIONALCOURSE = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#COURSECODE#" >,
		           VOCATIONALISGRAD = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GRADUATE#" >
		     WHERE REFERENCECODE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
		 </cfquery>
   </cfif>
</cfloop>
   <!---END FETCH TO CIN21EDUCATION-------------------------------------------------------------------------------------->

   <!---FETCH TO CIN21EMPEXTRA-------------------------------------------------------------------------------------->
<cfquery name="query_from_CIN21EMPEXTRA" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21EMPEXTRA
   WHERE GUID = '#theguid#';
</cfquery>

 <cfloop query="query_from_CIN21EMPEXTRA">
	<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
        INSERT INTO EGIN21EMPEXTRA  (   GUID,
										PERSONNELIDNO,
                                        ORGANIZATION,
                                        PERIODCOVERED,
                                        HIGHESTPOSITION,
                                        REFERENCECODE
                                   )

							 VALUES (   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#ORGANIZATION#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERIODCOVERED#" >,
									    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#HIGHESTPOSITION#" >,
									    <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
									);
    </cfquery>
</cfloop>
<!---END FETCH TO CIN21EMPEXTRA-------------------------------------------------------------------------------------->

<!---FETCH TO CIN21EXAMPASS-------------------------------------------------------------------------------------->
<cfquery name="query_from_CIN21EXAMPASS" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21EXAMPASS
   WHERE GUID = '#theguid#';
</cfquery>

  <cfloop query="query_from_CIN21EXAMPASS">
	<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
        INSERT INTO EGIN21EXAMPASS (    GUID,
										PERSONNELIDNO,
										DATETAKENPASSED,
                                        PASSED,
                                        RATING,
                                        TYPEOFEXAM,
										LICENSENUMBER,
                                        REFERENCECODE
                                  )
							 VALUES (   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
										<cfqueryparam cfsqltype = "cf_sql_date" value = "#DATETAKENPASSED#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PASSED#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#RATING#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#TYPEOFEXAM#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#LICENSENUMBER#" >,
										<cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
									);
   </cfquery>
</cfloop>
<!---END FETCH TO CIN21EXAMPASS-------------------------------------------------------------------------------------->

<!--- BOARD EXAM RESULTS AND RATINGS CIN21ACHIEVEMENTS--->
<cfquery name="query_from_CIN21ACHIEVEMENTS" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21ACHIEVEMENTS
   WHERE GUID = '#theguid#';
</cfquery>
<cfloop query="query_from_CIN21ACHIEVEMENTS">
	<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
		INSERT INTO EGIN21ACHIEVEMENTS ( GUID,
										PERSONNELIDNO,
										AWARDTITLE,
										DATEGIVEN,
										NATURECATEGORY,
										REFERENCECODE
									   )
							 VALUES  (  <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#AWARDTITLE#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#DATEGIVEN#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#NATURECATEGORY#" >,
										<cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
									 );
	</cfquery>
</cfloop>
<!--- END BOARD EXAM RESULTS AND RATINGS--->
<!---LICENSE AND CERTIFICATION OF PRESENT PROFESSION--->
<!---END LICENSE AND CERTIFICATION OF PRESENT PROFESSION--->

<!---BLOOD TYPE CIN21MEDHISTORY--->
<cfquery name="query_from_CIN21MEDHISTORY" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21MEDHISTORY
   WHERE GUID = '#theguid#';
</cfquery>
<cfloop query="query_from_CIN21MEDHISTORY">
	<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
		INSERT INTO EGIN21MEDHISTORY (   GUID,
										PERSONNELIDNO,
										BLOODTYPE,
										REFERENCECODE
									  )
							 VALUES  (  <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#BLOODTYPE#" >,
										<cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
									 );
	</cfquery>
</cfloop>
<!---END BLOOD TYPE--->

<!---FETCH TO CIN21TRAINING-------------------------------------------------------------------------------------->
<cfquery name="query_from_CIN21TRAINING" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21TRAINING
   WHERE GUID = '#theguid#';
</cfquery>

<cfloop query="query_from_CIN21TRAINING">
	<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
         INSERT INTO EGIN21TRAINING  (   GUID,
										PERSONNELIDNO,
										INCLUSIVEDATE,
										TOPIC,
										REMARKS,
										REFERENCECODE
								    )
							VALUES (    <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#INCLUSIVEDATE#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#TOPIC#" >,
										<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#REMARKS#" >,
										<cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
									);
     </cfquery>
</cfloop>
<!---END FETCH TO CIN21TRAINING-------------------------------------------------------------------------------------->

<!---FETCH TO CIN21WORKHISTORY-------------------------------------------------------------------------------------->
   <cfquery name="query_from_CIN21WORKHISTORY" datasource="#session.company_dsn#">
	  SELECT   *
		FROM CIN21WORKHISTORY
	   WHERE GUID = '#theguid#';
   </cfquery>

    <cfloop query="query_from_CIN21WORKHISTORY">
    	<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
			INSERT INTO EGIN21WORKHISTORY ( GUID,
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
										   ACCOMPLISHMENT,
                                           REFERENCECODE
									     )
							   VALUES    ( <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#ENTITYCODE#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#MAINDUTIES#" >,
										   <cfqueryparam cfsqltype = "cf_sql_date" value = "#DATEHIRED#" >,
										   <cfqueryparam cfsqltype = "cf_sql_date" value = "#SEPARATIONDATE#" >,
										   <cfqueryparam cfsqltype = "cf_sql_integer" value = "#WORKSTARTINGSALARY#" >,
										   <cfqueryparam cfsqltype = "cf_sql_integer" value = "#WORKENDINGSALARY#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#LASTPOSITIONHELD#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#SUPERIOR#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#REASONFORLEAVING#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#SUPERIORPOSITION#">,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#SUPERIORCONTACT#">,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#COMPANYCONTACT#">,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#ACCOMPLISHMENT#">,
										   <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
										 );
    </cfquery>
  </cfloop>
<!---END FETCH TO CIN21WORKHISTORY-------------------------------------------------------------------------------------->

<!---Relatives friends working in Filinvet CIN21RELATIVE--->
<cfquery name="query_from_CIN21RELATIVE" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21RELATIVE
   WHERE GUID = '#theguid#';
</cfquery>
<cfloop query="query_from_CIN21RELATIVE">
     <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
           INSERT INTO EGIN21RELATIVE   (   GUID,
										   PERSONNELIDNO,
										   NAME,
										   COMPANY,
										   POSITION,
										   REFERENCECODE
										 )
							   VALUES    ( <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#NAME#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#COMPANY#" >,
										   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#POSITION#" >,
										   <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
										 );
	 </cfquery>
</cfloop>
<!---End Relatives friends working in Filinvet--->

<!--- Special Skills CIN21MISCINFO1--->
<cfquery name="query_from_CIN21MISCINFO1" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21MISCINFO1
   WHERE GUID = '#theguid#';
</cfquery>

<cfloop query="query_from_CIN21MISCINFO1">
     <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
		INSERT INTO EGIN21MISCINFO1  (  GUID,
									   PERSONNELIDNO,
									   SPECIALTALENTS,
									   CLASSIFICATION,
									   RANKHELD,
									   REFERENCECODE
									 )
						   VALUES    ( <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
									   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
									   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#SPECIALTALENTS#" >,
									   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#CLASSIFICATION#" >,
									   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#RANKHELD#" >,
									   <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
									 );
	</cfquery>
</cfloop>
<!--- End Special Skills --->

<!---FETCH CIN21CHAREFERENCE--->
<cfquery name="query_from_CIN21CHARREFERENCE" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21CHAREFERENCE
   WHERE GUID = '#theguid#';
</cfquery>
<cfloop query="query_from_CIN21CHARREFERENCE" >
	<cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
        INSERT INTO  EGIN21CHAREFERENCE (   GUID,
										   PERSONNELIDNO,
										   NAME,
										   OCCUPATION,
										   COMPANY,
										   CELLULARPHONE,
										   REFERENCECODE
									 )
								 VALUES ( <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
										  <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
										  <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#NAME#" >,
										  <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#OCCUPATION#" >,
										  <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#COMPANY#" >,
										  <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#CELLULARPHONE#" >,
										  <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
										 );
	</cfquery>
</cfloop>
 <!---END FETCH CIN21CHAREFERENCE--->

 <!---Employment Violations CIN21EMPVIOL--->
<cfquery name="query_from_CIN21EMPVIOL" datasource="#session.company_dsn#">
  SELECT   *
	FROM CIN21EMPVIOL
   WHERE GUID = '#theguid#';
</cfquery>
<cfloop query="query_from_CIN21EMPVIOL">
    <cfquery name="insertToRecruitmentGT" datasource="#session.global_dsn#">
		INSERT INTO EGIN21EMPVIOL    ( GUID,
									   PERSONNELIDNO,
									   CASENUMBER,
									   CASENAME,
									   CASESTATUS,
									   REFERENCECODE
									)
						   VALUES   (  <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
									   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
									   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#CASENUMBER#" >,
									   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#CASENAME#" >,
									   <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#CASESTATUS#" >,
									   <cfqueryparam cfsqltype="cf_sql_varchar" value="#REFERENCECODE#"/>
									);
	</cfquery>
</cfloop>
 <!---End Employment Violations --->


 <!--- ECINRECPROCESS --->
 <cfquery name="query_from_ECINRECPROCESS" datasource="#session.company_dsn#">
  SELECT   *
	FROM ECINRECPROCESS
   WHERE APPLICANTNUMBER = '#APPLICANTNUMBER#';
</cfquery>
<cfloop query="query_from_ECINRECPROCESS">
    <cfquery name="insertToMRFStatusTable" datasource="#session.global_dsn#">
		INSERT INTO EGINRECPROCESS (REQUISITIONNO,
									DOCNUMBER,
									REFERENCECODE,
									APPLICANTNUMBER,
									EXAMTYPE,
									EXAMSCHEDDATE,
									EXAMSTATUS,
									EXAMCOMMENTS,
									EXAMATTACHMENT,
									FDINTERVIEWDATE,
									FDDATEACTUALINTERVIEW,
									FDINTERVIEWER,
									FDSTATUS,
									FDCOMMENTS,
									FDATTACHMENT,
									FDFEEDBACKDATE,
									HRINTERVIEWDATE,
									HRFEEDBACKDATE,
									HRINTERVIEWER,
									HRSTATUS,
									HRCOMMENTS,
									HRATTACHMENT,
									DHINTERVIEWDATE,
									DHINTERVIEWER,
									DHSTATUS,
									DHCOMMENTS,
									DHATTACHMENT,
									DHDATEACTUALINTERVIEW,
									DHFEEDBACKDATE,
									GMINTERVIEWDATE,
									GMINTERVIEWER,
									GMSTATUS,
									GMCOMMENTS,
									GMDATEACTUALINTERVIEW,
									GMFEEDBACKDATE,
									JODATEINVITE,
									JODATEDECISION,
									JOSTATUS,
									JOCOMMENTS,
									JOATTACHMENT,
									PECDATERECEIVED,
									PECDATESUBMITTED,
									PECATTACHMENT,
									PECSTATUS,
									PECCOMMENTS,
									CFDATEGIVEN,
									CFDATESIGNED,
									CFSTATUS,
									CFCOMMENTS,
									CFATTACHMENT,
									OCOBDATE,
									OCNEODATE,
									OCSTATUS,
									OCATTACHMENT,
									OCCOMMENTS,
									APPROVED,
									ROUTEID,
									RECCREATEDBY,
									RECDATECREATED,
									USERID,
									GUID,
									PERSONNELIDNO,
									DATELASTUPDATE,
									TIMELASTUPDATE,
									DATEACTIONWASDONE,
									ATTACHMENTCODE,
									ACTIONBY,
									EFORMID,
									PROCESSID,
									ATTACHEDFILE,
									GMATTACHMENT
								)
					   VALUES   (  <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#REQUISITIONNO#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#DOCNUMBER#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#REFERENCECODE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#APPLICANTNUMBER#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#EXAMTYPE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#EXAMSCHEDDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#EXAMSTATUS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#EXAMCOMMENTS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#EXAMATTACHMENT#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#FDINTERVIEWDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#FDDATEACTUALINTERVIEW#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#FDINTERVIEWER#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#FDSTATUS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#FDCOMMENTS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#FDATTACHMENT#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#FDFEEDBACKDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#HRINTERVIEWDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#HRFEEDBACKDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#HRINTERVIEWER#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#HRSTATUS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#HRCOMMENTS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#HRATTACHMENT#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#DHINTERVIEWDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#DHINTERVIEWER#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#DHSTATUS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#DHCOMMENTS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#DHATTACHMENT#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#DHDATEACTUALINTERVIEW#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#DHFEEDBACKDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#GMINTERVIEWDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GMINTERVIEWER#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GMSTATUS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GMCOMMENTS#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#GMDATEACTUALINTERVIEW#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#GMFEEDBACKDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#JODATEINVITE#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#JODATEDECISION#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#JOSTATUS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#JOCOMMENTS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#JOATTACHMENT#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#PECDATERECEIVED#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#PECDATESUBMITTED#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PECATTACHMENT#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PECSTATUS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PECCOMMENTS#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#CFDATEGIVEN#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#CFDATESIGNED#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#CFSTATUS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#CFCOMMENTS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#CFATTACHMENT#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#OCOBDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#OCNEODATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#OCSTATUS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#OCATTACHMENT#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#OCCOMMENTS#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#APPROVED#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#ROUTEID#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#RECCREATEDBY#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#RECDATECREATED#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#USERID#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GUID#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PERSONNELIDNO#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#DATELASTUPDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#TIMELASTUPDATE#" >,
									<cfqueryparam cfsqltype = "cf_sql_timestamp" value = "#DATEACTIONWASDONE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#ATTACHMENTCODE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#ACTIONBY#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#EFORMID#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#PROCESSID#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#ATTACHEDFILE#" >,
									<cfqueryparam cfsqltype = "cf_sql_varchar" value = "#GMATTACHMENT#">
								);
	</cfquery>
	<cfset arrayAppend(imageArray, EXAMATTACHMENT) >
	<cfset arrayAppend(imageArray, HRATTACHMENT) >
	<cfset arrayAppend(imageArray, PECATTACHMENT) >
	<cfset arrayAppend(imageArray, OCATTACHMENT) >
	<cfset arrayAppend(imageArray, CFATTACHMENT) >
	<cfset arrayAppend(imageArray, DHATTACHMENT) >
	<cfset arrayAppend(imageArray, GMATTACHMENT) >
</cfloop>


   <cftry>
	<cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CMFAP WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CIN21EDUCATION WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CIN21EMPEXTRA WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CIN21EXAMPASS WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CIN21FAMILYBKGRND WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CIN21PERSONALINFO WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
          DELETE FROM CIN21POSITNAPLD WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
         DELETE FROM CIN21TRAINING WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CIN21WORKHISTORY WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
         DELETE FROM CIN21CHAREFERENCE WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
         DELETE FROM CIN21ACHIEVEMENTS WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CIN21MEDHISTORY WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CIN21RELATIVE WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CIN21MISCINFO1 WHERE GUID = '#theguid#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.company_dsn#">
        DELETE FROM CIN21EMPVIOL WHERE GUID = '#theguid#';
    </cfquery>
	<cfquery name="removeLocalData" datasource="#session.company_dsn#">
           DELETE FROM ECINRECPROCESS WHERE APPLICANTNUMBER = '#APPLICANTNUMBER#';
    </cfquery>

	<cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CMFCANDIDATELISTNG WHERE APPLICANTNUMBER = '#APPLICANTNUMBER#';
    </cfquery>
    <cfquery name="removeLocalData" datasource="#session.company_dsn#">
        DELETE FROM CMFSHORTLISTED WHERE APPLICANTNUMBER = '#APPLICANTNUMBER#';
    </cfquery>
    <cfcatch type="any">
    </cfcatch>
    </cftry>


    <cfloop array="#imageArray#" index="fileInd">
    	<cftry>
    		<cffile action="move" source="#sourceDir##fileInd#" destination="#destDir#" >
    	<cfcatch type="any">
    	</cfcatch>
    	</cftry>
    </cfloop>

<!---revert end--->

	<cftry>

		<cfquery name="getMaxApplHoldTime" datasource="#session.global_dsn#" maxrows="1">
			SELECT CONFIGVALUE
			  FROM EGRGRECRUITMENTCONFIG
			 WHERE NAME = 'MAXAPPLHOLDTIME'

		</cfquery>
		<cfif getMaxApplHoldTime.recordcount GT 0 >
			<cfset confvalue = getMaxApplHoldTime.CONFIGVALUE >
		<cfelse>
			<cfset confvalue = 50 >
		</cfif>
		<cfset startingDate = dateformat(dateadd('d',confvalue,now()), 'MM/DD/YYYY') >
		<cfset endingDate   = dateformat(dateadd('d',5,startingDate), 'MM/DD/YYYY') >
		<cfschedule
		    action = "update"
		    task = "#refnumber#"
			group="RECRUITMENT"
		    endDate = "#endingDate#"
		    endTime = "12:05 AM"
		    requestTimeOut = "420"
		    interval="daily"
		    overwrite = "yes"
		    startDate = "#startingDate#"
		    startTime = "10:00 PM"
		    url = "#session.domain#myapps/recruitment/scheduledtask/release.cfm?referencecode=#refnumber#"
		    operation="HTTPRequest"
		>
		<cftry>
    	<cfschedule
		    action = "delete"
		    task   = "#session.company_dsn##APPLICANTNUMBER#"
			group  ="RECRUITMENT">
			<cfcatch>
			</cfcatch>
		</cftry>
		<cfcatch>
		</cfcatch>
	</cftry>

</cfloop>



<cfcatch>

    <cfset messageback = cfcatch.Detail & ' ' & cfcatch.Message />
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGMFAP WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGIN21EDUCATION WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGIN21EMPEXTRA WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGIN21EXAMPASS WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGIN21FAMILYBKGRND WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGIN21PERSONALINFO WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
          DELETE FROM EGIN21POSITNAPLD WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
         DELETE FROM EGIN21TRAINING WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGIN21WORKHISTORY WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
         DELETE FROM EGIN21CHAREFERENCE WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
         DELETE FROM EGIN21ACHIEVEMENTS WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGIN21MEDHISTORY WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGIN21RELATIVE WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGIN21MISCINFO1 WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>
    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGIN21EMPVIOL WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>


    <cfquery name="removeGlobalData" datasource="#session.global_dsn#">
        DELETE FROM EGINRECPROCESS WHERE REFERENCECODE = '#REFERENCECODE#';
    </cfquery>

    <cfloop array="#imageArray#" index="fileInd">
    	<cftry>
    	<cffile action="move" source="#destDir##fileInd#" destination="#sourceDir#" >
    	<cfcatch type="any">
    	</cfcatch>
    	</cftry>
    </cfloop>

</cfcatch>

</cftry>


<cfreturn #messageback# >

</cffunction>

</cfcomponent>