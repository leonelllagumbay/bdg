<cfcomponent hint="This component is jobposting. Created MRF (Manpower Request Form) are POSTEDBYIBOSE here."
			 output="no"
             displayname="Job Posting"
             >

   <cffunction name="postGlobal"
   			   access="remote"
   			   description="Post MRF to Global"
               returntype="string"
               hint="return: MRF POSTEDBYIBOSE if success, error string when failure occur."
               >
               <cfargument name="requisitionnoval" required="yes" type="string">

               <cfquery name="updatePostedY" datasource="#session.company_dsn#">

                    UPDATE CRGPERSONELREQUEST
                       SET POSTEDBYIBOSE = 'Y',
                           POSTEDTO = 'Global',
                           DATEACTIONWASDONE = '#dateformat(now(), 'YYYY-MM-DD')#'
                     WHERE REQUISITIONNO = '#requisitionnoval#';

               </cfquery>

               <cfquery name="deleteineboard" datasource="#session.company_dsn#">

                    DELETE FROM ECRGBOARD
                     WHERE BOARDCODE = '#requisitionnoval#';

               </cfquery>

          		<cfinvoke method="globalinsert" requisitionnoval="#requisitionnoval#"  />

   <cfreturn #requisitionnoval# >

   </cffunction>


   <cffunction name="postCompany"
   			   access="remote"
   			   description="Post MRF to Company"
               returntype="string"
               hint="return: MRF POSTEDBYIBOSE if success, error string when failure occur."
               >
               <cfargument name="requisitionnoval" required="yes" type="string">

               <cfquery name="updatePostedY" datasource="#session.company_dsn#">
                	UPDATE CRGPERSONELREQUEST
                   		SET POSTEDBYIBOSE = 'Y',
                            POSTEDTO = 'Company',
                            DATEACTIONWASDONE = '#dateformat(now(), 'YYYY-MM-DD')#'
                 	WHERE REQUISITIONNO = '#requisitionnoval#';
               </cfquery>

               <cfquery name="deleteineboard" datasource="#session.company_dsn#">

                    DELETE FROM ECRGBOARD
                     WHERE BOARDCODE = '#requisitionnoval#';

               </cfquery>

               <cfquery name="deleteGlobalrequestcopy"  datasource="#session.global_dsn#">
                    DELETE
                      FROM GRGPERSONELREQUEST
                     WHERE REQUISITIONNO = '#requisitionnoval#' AND COMPANYCODE = '#session.companycode#'
               </cfquery>

   	<!---Posting goes here...--->

   <cfreturn #requisitionnoval# >

   </cffunction>


   <cffunction name="postinternalcompany"
   			   access="remote"
   			   description="Post MRF to Internal and Company"
               returntype="string"
               hint="return: MRF POSTEDBYIBOSE if success, error string when failure occur."
               >
               <cfargument name="requisitionnoval" required="yes" type="string">



               <cfquery name="deleteGlobalrequestcopy"  datasource="#session.global_dsn#">
                    DELETE
                      FROM GRGPERSONELREQUEST
                     WHERE REQUISITIONNO = '#requisitionnoval#' AND COMPANYCODE = '#session.companycode#'
               </cfquery>

               <cfinvoke component="jobposting"
                  method="postInternal"
                  returnvariable="returnedvar"
                  requisitionnoval="#requisitionnoval#"
                  >

               <cfquery name="updatePostedY" datasource="#session.company_dsn#">
                	UPDATE CRGPERSONELREQUEST
                   	   SET POSTEDBYIBOSE = 'Y',
                           POSTEDTO = 'Internal and Company',
                           DATEACTIONWASDONE = '#dateformat(now(), 'YYYY-MM-DD')#'
                 	 WHERE REQUISITIONNO = '#requisitionnoval#';
               </cfquery>


   <cfreturn #requisitionnoval# >

   </cffunction>


   <cffunction name="postinternalglobal"
   			   access="remote"
   			   description="Post MRF to Internal and Global"
               returntype="string"
               hint="return: MRF POSTEDBYIBOSE if success, error string when failure occur."
               >
               <cfargument name="requisitionnoval" required="yes" type="string">

               <cfinvoke component="jobposting"
                  method="postInternal"
                  returnvariable="returnedvar"
                  requisitionnoval="#requisitionnoval#"
                  >

               <cfinvoke method="globalinsert" requisitionnoval="#requisitionnoval#"  />

               <cfquery name="updatePostedY" datasource="#session.company_dsn#">
                	UPDATE CRGPERSONELREQUEST
                   	   SET POSTEDBYIBOSE = 'Y',
                           POSTEDTO = 'Internal and Global',
                           DATEACTIONWASDONE = '#dateformat(now(), 'YYYY-MM-DD')#'
                 	 WHERE REQUISITIONNO = '#requisitionnoval#';
               </cfquery>


   <cfreturn #requisitionnoval# >

   </cffunction>

   <cffunction name="postcompanyglobal"
   			   access="remote"
   			   description="Post MRF to Company and Global"
               returntype="string"
               hint="return: MRF POSTEDBYIBOSE if success, error string when failure occur."
               >
               <cfargument name="requisitionnoval" required="yes" type="string">

               <cfquery name="updatePostedY" datasource="#session.company_dsn#">
                	UPDATE CRGPERSONELREQUEST
                   	   SET POSTEDBYIBOSE = 'Y',
                           POSTEDTO = 'Company and Global',
                           DATEACTIONWASDONE = '#dateformat(now(), 'YYYY-MM-DD')#'
                 	 WHERE REQUISITIONNO = '#requisitionnoval#';
               </cfquery>

               <cfquery name="deleteineboard" datasource="#session.company_dsn#">

                    DELETE FROM ECRGBOARD
                     WHERE BOARDCODE = '#requisitionnoval#';

               </cfquery>

               <cfinvoke method="globalinsert" requisitionnoval="#requisitionnoval#"  />


   <cfreturn #requisitionnoval# >

   </cffunction>


   <cffunction name="postAll"
   			   access="remote"
   			   description="Post MRF to All"
               returntype="string"
               hint="return: MRF POSTEDBYIBOSE if success, error string when failure occur."
               >
               <cfargument name="requisitionnoval" required="yes" type="string">

               <cfquery name="deleteineboard" datasource="#session.company_dsn#">

                    DELETE FROM ECRGBOARD
                     WHERE BOARDCODE = '#requisitionnoval#';

               </cfquery>



               <cfinvoke  method="postInternal"
                          returnvariable="returnedvar"
                          requisitionnoval="#requisitionnoval#"
                          >

                <cfif returnedvar EQ requisitionnoval >
                    <!---OK--->
                <cfelse>
                    <cfthrow detail="Requisition Number mismatch" message="Requisition Number Error!">
                </cfif>



                <cfquery name="updatePostedY" datasource="#session.company_dsn#">
                	UPDATE CRGPERSONELREQUEST
                   		SET POSTEDBYIBOSE = 'Y',
                            POSTEDTO = 'All',
                            DATEACTIONWASDONE = '#dateformat(now(), 'YYYY-MM-DD')#'
                 	WHERE REQUISITIONNO = '#requisitionnoval#';
               </cfquery>

               <cfinvoke method="globalinsert" requisitionnoval="#requisitionnoval#"  />

   <cfreturn #requisitionnoval# >

   </cffunction>



   <cffunction name="postInternal"
   			   access="remote"
   			   description="Post MRF to Internal"
               returntype="string"
               hint="return: MRF POSTEDBYIBOSE if success, error string when failure occur."
               >
               <cfargument name="requisitionnoval" required="yes" type="string">

   	<!---Posting goes here...--->

    <cfquery name="deleteGlobalrequestcopy"  datasource="#session.global_dsn#">
        DELETE
          FROM GRGPERSONELREQUEST
         WHERE REQUISITIONNO = '#requisitionnoval#' AND COMPANYCODE = '#session.companycode#'
    </cfquery>

    <cfquery name="deleteeBoard" datasource="#session.company_dsn#">
        DELETE
          FROM ECRGBOARD
        WHERE BOARDCODE = '#requisitionnoval#'
    </cfquery>



    	  <cfquery name="getMrf" datasource="#session.company_dsn#" maxrows="1">

                SELECT  REQUISITIONNO AS REQNO,
                        RANKCODE,
                        SKILLSREQ,
                        SPECTRAINING,
                        SEX,
                        REQUISITIONEDBY,
                        REPLACEMENTREASON,
                        REPORTINGTO,
                        REPLACEMENTOF,
                        RELIGION,
                        NATUREOFJOBVAC,
                        NATUREOFEMP,
                        NATIONALITY,
                        MARITALSTAT,
                        EFFECTIVE,
                        AGE,
                        BRIEFDESC,
                        DATE,
                        DATEREQUISITION,
                        IFCONTRACTUAL,
                        DATETO,
                        DEGREEREQ,
                        EDUCATTAINMENT1,
			            EDUCATTAINMENT2,
			            EDUCATTAINMENT3,
			            EDUCATTAINMENT4,
			            EDUCATTAINMENT5,
                        DATENEEDED,
                        DEPARTMENTCODEFK,
                        DIVISIONCODE,
                        POSITIONCODEFK,
                        STATUS,
                        REQUIREDNO,
                        PROJECTCODE,
                        SOURCENAME

                 FROM  CRGPERSONELREQUEST
                WHERE  REQUISITIONNO = '#requisitionnoval#'
                       <!---AND APPROVED LIKE '%Y%'
                       AND (POSTEDBYIBOSE IS NULL OR POSTEDBYIBOSE = 'N' OR POSTEDBYIBOSE = '' OR POSTEDBYIBOSE != 'Internal' )--->
                 ;
            </cfquery>

       <cfloop query="getMrf">


            <cfquery name="getPosition" datasource="#session.company_dsn#" maxrows="1">

                SELECT DESCRIPTION
                  FROM CLKPOSITION
                 WHERE POSITIONCODE = '#POSITIONCODEFK#'

            </cfquery>

            <cfif getPosition.RecordCount GT 0>
                <cfset position = getPosition.DESCRIPTION >
            <cfelse>
                <cfset position = ' '>
            </cfif>


            <cfquery name="insertIntoecrgboard" datasource="#session.company_dsn#">

                INSERT INTO ECRGBOARD ( BOARDCODE,
                                        TEMPLATECODE_FK,
                                        DESCRIPTION,
                                        SORTID,
                                        CONTENT,
                                        STARTDATE,
                                        ENDDATE,
                                        ARCHIVE,
                                        PRIORITY,
                                        DISPLAYDESC,
                                        RECCREATEDBY,
                                        RECDATECREATED,
                                        USERID,
                                        DATELASTUPDATE,
                                        TIMELASTUPDATE,
                                        BOARDCOVER
                                        )
                             VALUES   ( <cfqueryparam cfsqltype="cf_sql_varchar" value="#REQNO#">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="BOARD001">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#position#">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="1">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.dbms#,#session.company_dsn#,#session.companycode#">,
                                        <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(now(), 'YYYY-MM-DD')#">,
                                        <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(DATENEEDED, 'YYYY-MM-DD')#">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="Y">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="1-HIGH">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="Y">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.USERID#">,
                                        <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(now(), 'YYYY-MM-DD')#">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.USERID#">,
                                        <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(now(), 'YYYY-MM-DD')#">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#TimeFormat(now(), 'HH:MM:SS')#">,
                                        <cfqueryparam cfsqltype="cf_sql_varchar" value="Y">

                                      )
                ;


            </cfquery>

            <cfquery name="updatePostedY" datasource="#session.company_dsn#">

                UPDATE CRGPERSONELREQUEST
                   SET POSTEDBYIBOSE = 'Y',
                       POSTEDTO = 'Internal',
                       DATEACTIONWASDONE = '#dateformat(now(), 'YYYY-MM-DD')#'
                 WHERE REQUISITIONNO = '#requisitionnoval#';

            </cfquery>

			<cfreturn #requisitionnoval# >

            </cfloop>


	<cfreturn 'xxxx'>





   </cffunction>


   <cffunction name="globalinsert" returntype="void" output="no" >

   <cfargument name="requisitionnoval" required="yes" type="string">

   	           <cfquery name="deleteGlobalrequestcopy"  datasource="#session.global_dsn#">
                    DELETE
                      FROM GRGPERSONELREQUEST
                     WHERE REQUISITIONNO = '#requisitionnoval#' AND COMPANYCODE = '#session.companycode#'
                </cfquery>


               <cfquery name="getMRFsample" datasource="#session.company_dsn#">
                    SELECT A.POSITIONCODEFK,
                           A.REQUISITIONNO AS REQNO,
                           A.COMPANYCODE,
                           A.REQUIREDNO,
                           A.DATELASTUPDATE,
                           A.DATEACTIONWASDONE,
						   B.DESCRIPTION AS BDESCRIPTION
                      FROM CRGPERSONELREQUEST A LEFT JOIN CLKPOSITION B ON (A.POSITIONCODEFK = B.POSITIONCODE)
                     WHERE REQUISITIONNO = '#requisitionnoval#';
               </cfquery>

                  <!---insert--->

                 <cfloop query="getMRFsample">
                    <cfquery name="insertRecordsCurrent16" datasource="#session.global_dsn#" >
                        INSERT INTO GRGPERSONELREQUEST (   POSITIONCODE,
                                                           REQUISITIONNO,
                                                           COMPANYCODE,
                                                           REQUIREDNO,
                                                           DATELASTUPDATE,
                                                           SOURCENAME,
														   POSITIONDESC,
														   COMPANYDSN,
														   DBMS
                                                        )
                             VALUES ( <cfqueryparam cfsqltype="cf_sql_varchar" value="#POSITIONCODEFK#">,
                                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#REQNO#">,
                                      <cfqueryparam cfsqltype="cf_sql_varchar" value="#COMPANYCODE#">,
                                      <cfqueryparam cfsqltype="cf_sql_integer" value="#REQUIREDNO#">,
                                      <cfqueryparam cfsqltype="cf_sql_date"    value="#DATEACTIONWASDONE#">,
                                      <cfqueryparam cfsqltype="cf_sql_varchar" value="iBOS/e">,
									  <cfqueryparam cfsqltype="cf_sql_varchar" value="#BDESCRIPTION#">,
									  <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.company_dsn#">,
									  <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.dbms#">

                                    );


                   </cfquery>
                 </cfloop>

   </cffunction>



</cfcomponent>